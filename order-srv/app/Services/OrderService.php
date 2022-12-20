<?php


namespace App\Services;

use App\Amqp\Producer\OrderProducer;
use App\JsonRpc\UserRpcServiceInterface;
use App\Model\OrderGoods;
use DtmClient\Saga;
use DtmClient\TransContext;
use App\Exception\JsonRpcException;
use App\Exception\ServiceException;
use App\Log;
use App\Model\Order;
use Hyperf\Amqp\Producer;
use Hyperf\Di\Annotation\Inject;

/**
 * 订单service
 * Class OrderService
 * @package App\Services
 */
class OrderService
{
    /**
     * 注入DTM.SAGA
     * @var Saga
     */
    #[Inject]
    protected Saga $saga;

    /**
     * 注入UserRpcServiceInterface
     * @var UserRpcServiceInterface
     */
    #[Inject]
    protected UserRpcServiceInterface $userRpcServiceInterface;

    /**
     * 订单列表
     * @param $userId
     * @return mixed[]
     */
    public function orderList($userId)
    {
        Log::get()->info("调用orderList");

        $list = Order::query()
            ->where('user_id', $userId)
            ->get();

        if (empty($list)) {
            Log::get()->info("订单为空");

            throw new JsonRpcException(10001);
        }

        //调用用户服务拿到用户信息
        foreach ($list as $item) {
            try {
                //调用用户服务中的用户详情方法
                $res = $this->userRpcServiceInterface->userInfo($item->user_id);

            } catch (\Throwable $ex) {
                Log::get()->info("rpc调用失败");

                throw new JsonRpcException(430);
            }

            if ($res['code'] !== 200) {
                Log::get()->info("rpc调用失败");

                throw new JsonRpcException(430);
            }

            //拼装数据
            $item->user = $res['data'];
        }

        return $list->toArray();

    }

    /**
     * 创建订单
     * @param $data
     * @return string
     */
    public function createOrder($data)
    {
        Log::get()->info("调用createOrder");

        try {
            //分布式事务
            $data['order_no'] = date("YmdHis");

            //获取用户储值
            //todo

            //判断商品库存
            //todo

            $this->saga->init();
            //创建订单
            $this->saga->add(
                env('DTM_ORDER_URL') . '/saga/sageCreateOrder',
                env('DTM_ORDER_URL') . '/saga/sageCreateOrderCompensate',
                $data
            );
            //扣用户余额
            $this->saga->add(
                env('DTM_USER_URL') . '/saga/changeStored',
                env('DTM_USER_URL'). '/saga/changeStoredCompensate',
                ['order_no'=>$data['order_no'] ,'user_id'=>$data['user_id'],'amount'=>-$data['order_fact_money']]
            );

            // 提交 Saga 事务
            $this->saga->submit();

        } catch (\Throwable $ex) {
            Log::get()->info("rpc调用失败");

            throw new JsonRpcException(430);
        }

        return TransContext::getGid();

    }

    /**
     * SAGA订单创建成功
     * @param $data
     * @return string
     */
    public function sageCreateOrder($data)
    {
        Log::get()->info("分布式事务-sageCreateOrder",$data);

        //分布式事务
        try {
            Order::create([
                'order_no' => $data['order_no'],
                'user_id' => $data['user_id'],
                'coupon_id' => $data['coupon_id'],
                'order_money' => $data['order_money'],
                'order_discount' => $data['order_fact_money'],
                'consume_number' => $data['consume_number'],
                'order_status' => 0,
                'payment' => $data['payment'],
            ]);

            foreach ($data['goods'] as $item) {
                OrderGoods::create([
                    'order_no' => $data['order_no'],
                    'goods_id' => $item['goods_id'],
                    'goods_sn' => $item['goods_sn'],
                    'sku_id' => $item['sku_id'],
                    'user_id' => $item['user_id'],
                    'goods_name' => $item['goods_name'],
                    'number' => $item['number'],
                    'goods_tag_price' => $item['goods_tag_price'],
                    'goods_real_price' => $item['goods_real_price'],
                    'goods_discount' => $item['goods_fact_money'],
                ]);
            }

        } catch (\Throwable $e) {
            Log::get()->info("分布式事务-sageCreateOrder-调用失败");

            throw new ServiceException();
        }

        return true;
    }


    /**
     * SAGA订单创建补偿
     * @param $data
     * @return string
     */
    public function sageCreateOrderCompensate($data)
    {
        Log::get()->info("分布式事务-sageCreateOrderCompensate",$data);

        //分布式事务
        try {
            Order::query()
                ->where('order_no',$data['order_no'])
                ->where('user_id',$data['user_id'])
                ->delete();

            OrderGoods::query()
                ->where('order_no',$data['order_no'])
                ->where('user_id',$data['user_id'])
                ->delete();

        } catch (\Throwable $e) {
            Log::get()->info("分布式事务-sageCreateOrderCompensate-调用失败");

            throw new ServiceException();
        }

        return true;

    }

    /**
     * 投递订单消息到RabbitMQ
     */
    public function orderRabbitMQ()
    {

        //拼装数据
        $message = new OrderProducer([
            'id' => 1
        ]);

        $producer = di()->get(Producer::class);

        //投递消息
        $result = $producer->produce($message);

        //投递消息失败
        if ($result != true){
            throw new JsonRpcException(430);
        }

    }


}