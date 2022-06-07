<?php


namespace App\Services;

use App\Exception\ServiceException;
use App\Log;
use App\JsonRpc\UserRpcConsumer;
use Hyperf\Di\Annotation\Inject;
use Swoole\Coroutine;

/**
 * 用户service
 * Class UserService
 * @package App\Services
 */
class UserService
{

    /**
     * 注入UserRpcConsumer
     * @var UserRpcConsumer
     */
    #[Inject]
    protected UserRpcConsumer $userRpcConsumer;

    /**
     * 用户信息
     * @param $userId
     * @return mixed
     */
    public function getRpcUserInfo($userId)
    {
        Log::get()->info("调用getRpcUserInfo");

        try {

            //调用用户服务中的用户详情方法
            $res = $this->userRpcConsumer->userInfo($userId);

        } catch (\Throwable $ex) {
            Log::get()->info("rpc调用失败", [
                'code' => $ex->getCode(),
                'file' => $ex->getFile(),
                'message' => $ex->getMessage(),
            ]);

            throw new ServiceException(430);
        }

        if ($res['code'] !== 200) {
            Log::get()->info("rpc调用失败", [
                'code' => $res['code'],
                'file' => '',
                'message' => $res['message']
            ]);

            throw new ServiceException(430);
        }

        return $res['data'];
    }

    /**
     * 用户积分列表
     * @param int $page
     * @param int $pageSize
     * @return mixed
     */
    public function getRpcUserBonusList(int $page, int $pageSize)
    {
        Log::get()->info("调用getRpcUserBonusList");

        try {
            //调用用户服务中的用户积分列表方法
            $res = $this->userRpcConsumer->userBonusList($page, $pageSize);

        } catch (\Throwable $ex) {
            Log::get()->info("rpc调用失败", [
                'code' => $ex->getCode(),
                'file' => $ex->getFile(),
                'message' => $ex->getMessage(),
            ]);

            throw new ServiceException(430);
        }

        if ($res['code'] !== 200) {
            Log::get()->info("rpc调用失败", [
                'code' => $res['code'],
                'file' => '',
                'message' => $res['message']
            ]);

            throw new ServiceException(430);
        }

        return $res['data'];
    }

    /**
     * 户储值列表
     * @param int $page
     * @param int $pageSize
     * @return mixed
     */
    public function getRpcUserStoredList(int $page, int $pageSize)
    {
        Log::get()->info("调用getRpcUserStoredList");

        try {
            //调用用户服务中的用户储值列表方法
            $res = $this->userRpcConsumer->userStoredList($page, $pageSize);

        } catch (\Throwable $ex) {
            Log::get()->info("rpc调用失败", [
                'code' => $ex->getCode(),
                'file' => $ex->getFile(),
                'message' => $ex->getMessage(),
            ]);

            throw new ServiceException(430);
        }

        if ($res['code'] !== 200) {
            Log::get()->info("rpc调用失败", [
                'code' => $res['code'],
                'file' => '',
                'message' => $res['message']
            ]);

            throw new ServiceException(430);
        }

        return $res['data'];
    }

    /**
     * 测试服务降级
     */
    public function testCircuitBreaker()
    {

        Log::get()->info("调用testCircuitBreaker");

        Coroutine::sleep(1);
    }

}