<?php
/**
 * @user: DoubleJin
 * @date: 2022/5/24
 * @create: 09:31
 */

namespace App\JsonRpc;

use Hyperf\RpcClient\AbstractServiceClient;

class OrderRpcConsumer extends AbstractServiceClient
{
    /**
     * 定义对应服务提供者的服务名称
     * @var string
     */
    protected $serviceName = 'OrderRpcService';

    /**
     * 定义对应服务提供者的服务协议
     * @var string
     */
    protected $protocol = 'jsonrpc-http';

    public function orderList(int $userId): array
    {
        return $this->__request(__FUNCTION__, compact('userId'));
    }

    public function createOrder(array $data): array
    {
        return $this->__request(__FUNCTION__, compact('data'));
    }


}