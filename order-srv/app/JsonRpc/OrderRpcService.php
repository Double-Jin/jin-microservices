<?php
/**
 * @user: DoubleJin
 * @date: 2022/5/24
 * @create: 09:31
 */

namespace App\JsonRpc;

use Hyperf\RpcServer\Annotation\RpcService;
use App\Services\OrderService;
use Hyperf\Di\Annotation\Inject;

#[RpcService(name:"OrderRpcService", protocol:"jsonrpc-http", server:"jsonrpc-http", publishTo:"nacos")]
class OrderRpcService implements OrderRpcServiceInterface
{
    #[Inject]
    protected OrderService $orderService;

    public function orderList(int $userId): array
    {
        return successJsonRpc(200, $this->orderService->orderList($userId));
    }

    public function createOrder(array $data): array
    {
        return successJsonRpc(200, $this->orderService->createOrder($data));
    }

}