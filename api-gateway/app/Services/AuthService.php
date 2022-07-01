<?php


namespace App\Services;

use App\Exception\ServiceException;
use App\JsonRpc\UserRpcServiceInterface;
use App\Log;
use Hyperf\Di\Annotation\Inject;
use Swoole\Coroutine;

/**
 * 用户权限service
 * Class AuthService
 * @package App\Services
 */
class AuthService
{

    /**
     * 注入UserRpcServiceInterface
     * @var UserRpcServiceInterface
     */
    #[Inject]
    protected UserRpcServiceInterface $userRpcServiceInterface;

    /**
     * 用户登录
     * @param int $page
     * @param int $pageSize
     * @return mixed
     */
    public function getRpcUserLogin(string $phone)
    {
        Log::get()->info("调用getRpcUserLogin");

        try {
            //调用用户服务中的用户登录方法
            $res = $this->userRpcServiceInterface->userLogin($phone);

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
     * 用户退出
     * @param string $token
     * @return mixed
     */
    public function getRpcUserLogout(string $token)
    {
        Log::get()->info("调用getRpcUserLogout");

        try {
            //调用用户服务中的用户退出方法
            $res = $this->userRpcServiceInterface->userLogout($token);

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
     * 检查用户token
     * @param string $token
     * @return mixed
     */
    public function getRpcUserCheckToken(string $token)
    {
        Log::get()->info("调用getRpcUserLogout");

        try {
            //调用用户服务中的检查用户token方法
            $res = $this->userRpcServiceInterface->userCheckToken($token);

        } catch (\Throwable $ex) {
            Log::get()->info("rpc调用失败", [
                'code' => $ex->getCode(),
                'file' => $ex->getFile(),
                'message' => $ex->getMessage(),
            ]);

            throw new ServiceException(430,'token已过期');
        }

        if ($res['code'] !== 200) {
            Log::get()->info("rpc调用失败", [
                'code' => $res['code'],
                'file' => '',
                'message' => $res['message']
            ]);

            throw new ServiceException(430,'token已过期');
        }

        return $res['data'];
    }

}