<?php


namespace App\Services;

use App\Model\OrderGoods;
use DtmClient\Api\ApiInterface;
use DtmClient\TCC;
use DtmClient\Saga;
use DtmClient\TransContext;
use App\Exception\JsonRpcException;
use App\Exception\ServiceException;
use App\JsonRpc\UserRpcConsumer;
use App\Log;
use App\Model\Order;
use Hyperf\Di\Annotation\Inject;

class OrderService
{
    #[Inject]
    protected TCC $tcc;

    #[Inject]
    protected Saga $saga;

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

                $res = di(UserRpcConsumer::class)->userInfo($item->user_id);

            } catch (\Throwable $ex) {
                Log::get()->info("rpc调用失败");

                throw new JsonRpcException(430);
            }

            if ($res['code'] !== 200) {
                Log::get()->info("rpc调用失败");

                throw new JsonRpcException(430);
            }

            $item->user = $res['data'];
        }

        return $list->toArray();

    }

    public function createOrder($data)
    {

        //分布式事务
        $orderNo = date("YmdHis");
        $data['order_no'] = $orderNo;

        //获取用户储值
        //todo

        //判断商品库存
        //todo

        $this->saga->init();
        // 增加转出子事务
        //创建订单
        $this->saga->add(
            env('DTM_ORDER_URL') . '/saga/sageCreateOrder',
            env('DTM_ORDER_URL') . '/saga/sageCreateOrderCompensate',
            $data
        );
        // 增加转入子事务
        //扣用户余额
        $this->saga->add(
            env('DTM_USER_URL') . '/saga/changeStored',
            env('DTM_USER_URL'). '/saga/changeStoredCompensate',
            ['order_no'=>$data['order_no'] ,'user_id'=>$data['user_id'],'amount'=>-$data['order_fact_money']]
        );
        // 提交 Saga 事务
        $this->saga->submit();

        return TransContext::getGid();

    }

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

    }

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

    }


}