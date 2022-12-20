<?php
/**
 * @user: DoubleJin
 * @date: 2022/12/20
 * @create: 09:31
 */

namespace App\JsonRpc;

interface FileRpcServiceInterface
{

    public function uploadFile(string $type, string $base64string, string $fileName): array;

}