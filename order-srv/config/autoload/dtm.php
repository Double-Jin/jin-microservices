<?php

declare(strict_types=1);
/**
 * This file is part of DTM-PHP.
 *
 * @license  https://github.com/dtm-php/dtm-client/blob/master/LICENSE
 */
use DtmClient\Constants\Protocol;
use DtmClient\Constants\DbType;

return [
    'protocol' => Protocol::HTTP,
    'server' => env('DTM_HOST'),
    'port' => [
        'http' => 36789,
        'grpc' => 36790,
    ],
    'barrier' => [
        // DB 模式下的子事务屏障配置
        'db' => [
            'type' => DbType::MySQL
        ],
        // Redis 模式下的子事务屏障配置
        'redis' => [
            // 子事务屏障记录的超时时间
            'expire_seconds' => 7 * 86400,
        ],
        'apply' => [],
    ],
    'guzzle' => [
        'options' => [],
    ],
];
