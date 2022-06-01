<?php


namespace App\Services;

use App\Exception\ServiceException;
use App\JsonRpc\OrderRpcConsumer;
use App\Log;
use Hyperf\Utils\Str;
use Hyperf\HttpServer\Annotation\RequestMapping;
use App\JsonRpc\UserRpcConsumer;

class OrderService
{

    public function getRpcOrderList(int $userId)
    {
        Log::get()->info("调用getRpcOrderList");

        try {
            $res = di(OrderRpcConsumer::class)->orderList( $userId);

        } catch (\Throwable $ex) {
            Log::get()->info("rpc调用失败",[
                'code' => $ex->getCode(),
                'file' => $ex->getFile(),
                'message' => $ex->getMessage(),
            ]);

            throw new ServiceException(430);
        }

        if ($res['code'] !== 200) {
            Log::get()->info("rpc调用失败",[
                'code' => $res['code'],
                'file' => '',
                'message' => $res['message']
            ]);

            throw new ServiceException(430);
        }

        return $res['data'];
    }


    public function rpcCreateOrder(array $data)
    {
        Log::get()->info("调用rpcCreateOrder");

        try {
            $res = di(OrderRpcConsumer::class)->createOrder($data);

        } catch (\Throwable $ex) {

            Log::get()->info("rpc调用失败",[
                'code' => $ex->getCode(),
                'file' => $ex->getFile(),
                'message' => $ex->getMessage(),
            ]);

            throw new ServiceException(430);
        }

        if ($res['code'] !== 200) {
            Log::get()->info("rpc调用失败",[
                'code' => $res['code'],
                'file' => '',
                'message' => $res['message']
            ]);

            throw new ServiceException(430);
        }

        return $res['data'];
    }

}