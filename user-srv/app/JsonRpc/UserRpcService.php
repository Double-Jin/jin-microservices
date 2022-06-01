<?php
/**
 * @user: DoubleJin
 * @date: 2022/5/24
 * @create: 09:31
 */

namespace App\JsonRpc;

use Hyperf\RpcServer\Annotation\RpcService;
use App\Services\UserService;
use Hyperf\Di\Annotation\Inject;

#[RpcService(name:"UserRpcService", protocol:"jsonrpc-http", server:"jsonrpc-http", publishTo:"nacos")]
class UserRpcService implements UserRpcServiceInterface
{
    #[Inject]
    protected UserService $userService;

    public function userInfo(int $userId): array
    {
        return successJsonRpc(200, $this->userService->userInfo($userId));
    }

    public function userBonusList(int $page, int $pageSize): array
    {
        return successJsonRpc(200, $this->userService->userBonusList($page, $pageSize));
    }

    public function userStoredList(int $page, int $pageSize): array
    {
        return successJsonRpc(200, $this->userService->userStoredList($page, $pageSize));
    }
}