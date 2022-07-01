<?php
/**
 * @user: DoubleJin
 * @date: 2022/5/24
 * @create: 09:31
 */

namespace App\JsonRpc;

interface UserRpcServiceInterface
{

    public function userInfo(int $userId): array;
    
    public function userBonusList(int $page, int $pageSize): array;

    public function userStoredList(int $page, int $pageSize): array;

    public function userRabbitMQ(): array;

    public function userLogin(string $phone): array;

    public function userLogout(string $token): array;


}