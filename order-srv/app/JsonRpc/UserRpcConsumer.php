<?php
/**
 * @user: DoubleJin
 * @date: 2022/5/24
 * @create: 09:31
 */

namespace App\JsonRpc;

use Hyperf\RpcClient\AbstractServiceClient;

/**
 * 用户rpc消费者服务
 * Class UserRpcConsumer
 * @package App\JsonRpc
 */
class UserRpcConsumer extends AbstractServiceClient
{
    /**
     * 定义对应服务提供者的服务名称
     * @var string
     */
    protected $serviceName = 'UserRpcService';

    /**
     * 定义对应服务提供者的服务协议
     * @var string
     */
    protected $protocol = 'jsonrpc-http';

    public function userInfo(int $userId): array
    {
        return $this->__request(__FUNCTION__, compact('userId'));
    }

}