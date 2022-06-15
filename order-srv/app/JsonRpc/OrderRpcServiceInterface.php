<?php
/**
 * @user: DoubleJin
 * @date: 2022/5/24
 * @create: 09:31
 */

namespace App\JsonRpc;

interface OrderRpcServiceInterface
{

    public function orderList(int $userId): array;

    public function createOrder(array $data): array;

    public function orderRabbitMQ(): array;

}