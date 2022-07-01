<?php
/**
 * @user: DoubleJin
 * @date: 2022/5/24
 * @create: 09:31
 */

namespace App\JsonRpc;

use App\Services\AuthService;
use Hyperf\RpcServer\Annotation\RpcService;
use App\Services\UserService;
use Hyperf\Di\Annotation\Inject;

/**
 * 用户rpc服务
 * Class OrderRpcService
 * @package App\JsonRpc
 */
#[RpcService(name: "UserRpcService", protocol: "jsonrpc-http", server: "jsonrpc-http", publishTo: "nacos")]
class UserRpcService implements UserRpcServiceInterface
{
    #[Inject]
    protected UserService $userService;

    #[Inject]
    protected AuthService $authService;

    /**
     * 用户详情
     * @param int $userId
     * @return array
     */
    public function userInfo(int $userId): array
    {
        return [
            'code' => 200,
            'data' => $this->userService->userInfo($userId)
        ];
    }

    /**
     * 用户积分列表
     * @param int $page
     * @param int $pageSize
     * @return array
     */
    public function userBonusList(int $page, int $pageSize): array
    {
        return [
            'code' => 200,
            'data' => $this->userService->userBonusList($page, $pageSize)
        ];
    }

    /**
     * 用户储值列表
     * @param int $page
     * @param int $pageSize
     * @return array
     */
    public function userStoredList(int $page, int $pageSize): array
    {
        return [
            'code' => 200,
            'data' => $this->userService->userStoredList($page, $pageSize)
        ];
    }

    /**
     * 投递用户消息到RabbitMQ
     * @return array
     */
    public function userRabbitMQ() : array
    {
        return [
            'code' => 200,
            'data' => $this->userService->userRabbitMQ()
        ];
    }

    /**
     * 用户登录
     * @param string $phone
     * @return array
     */
    public function userLogin(string $phone): array
    {
        return [
            'code' => 200,
            'data' => $this->authService->userLogin($phone)
        ];
    }

    /**
     * 用户退出
     * @param string $token
     * @return array
     */
    public function userLogout(string $token): array
    {
        return [
            'code' => 200,
            'data' => $this->authService->userLogout($token)
        ];
    }

    /**
     * 检查用户token
     * @param string $token
     * @return array
     */
    public function userCheckToken(string $token): array
    {
        return [
            'code' => 200,
            'data' => $this->authService->userCheckToken($token)
        ];
    }
}