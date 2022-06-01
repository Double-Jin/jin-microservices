<?php


namespace App\Services;

use App\Exception\ServiceException;
use App\Log;
use Hyperf\HttpServer\Annotation\RequestMapping;
use App\JsonRpc\UserRpcConsumer;
use Swoole\Coroutine;

class UserService
{

    public function getRpcUserInfo($userId)
    {
        Log::get()->info("调用getRpcUserInfo");

        try {
            $res = di(UserRpcConsumer::class)->userInfo($userId);

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

    public function getRpcUserBonusList(int $page, int $pageSize)
    {
        Log::get()->info("调用getRpcUserBonusList");

        try {
            $res = di(UserRpcConsumer::class)->userBonusList( $page,  $pageSize);

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

    public function getRpcUserStoredList(int $page, int $pageSize)
    {
        Log::get()->info("调用getRpcUserStoredList");

        try {
            $res = di(UserRpcConsumer::class)->userStoredList( $page,  $pageSize);

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

    public function testCircuitBreaker(){

        Log::get()->info("调用testCircuitBreaker");

        Coroutine::sleep(1);
    }

}