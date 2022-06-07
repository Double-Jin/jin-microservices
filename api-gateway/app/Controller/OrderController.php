<?php

declare(strict_types=1);
/**
 * This file is part of Hyperf.
 *
 * @link     https://www.hyperf.io
 * @document https://hyperf.wiki
 * @contact  group@hyperf.io
 * @license  https://github.com/hyperf/hyperf/blob/master/LICENSE
 */

namespace App\Controller;

use App\Services\OrderService;
use Hyperf\Di\Annotation\Inject;
use Hyperf\HttpServer\Annotation\Controller;
use Hyperf\HttpServer\Annotation\GetMapping;
use Hyperf\HttpServer\Annotation\PostMapping;
use Hyperf\HttpServer\Contract\RequestInterface;

/**
 * 订单控制器
 * Class OrderController
 * @package App\Controller
 */
#[Controller(prefix: '/Order')]
class OrderController extends CommonController
{
    /**
     * 注入OrderService
     * @var OrderService
     */
    #[Inject]
    protected OrderService $orderService;

    /**
     * 用户订单列表
     * @param RequestInterface $request
     * @return \Psr\Http\Message\ResponseInterface
     */
    #[GetMapping(path: 'OrderList')]
    public function orderList(RequestInterface $request)
    {
        //调用orderService.getRpcOrderList方法
        $res = $this->orderService->getRpcOrderList(1);

        return $this->success($res);
    }

    /**
     * 创建订单
     * @param RequestInterface $request
     * @return \Psr\Http\Message\ResponseInterface
     */
    #[PostMapping(path: 'CreateOrder')]
    public function createOrder(RequestInterface $request)
    {
        //调用orderService.rpcCreateOrder方法
        $res = $this->orderService->rpcCreateOrder([
            'user_id' => 1,
            'coupon_id' => 0,
            'order_money' => '100',
            'order_discount' => '100',
            'order_fact_money' => '100',
            'consume_number' => 1,
            'payment' => 1,
            'goods' => [
                [
                    'goods_id' => 1,
                    'goods_sn' => 'JIN02',
                    'sku_id' => 1,
                    'user_id' => 1,
                    'goods_name' => '测试商品',
                    'number' => 1,
                    'goods_tag_price' => '100',
                    'goods_real_price' => '100',
                    'goods_discount' => '100',
                    'goods_fact_money' => '100'
                ]
            ]
        ]);

        return $this->success($res);
    }

}
