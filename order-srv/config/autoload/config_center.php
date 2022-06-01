<?php

declare(strict_types=1);
/**
 * This file is part of Hyperf.
 *
 * @link     https://www.hyperf.io
 * @document https://hyperf.wiki
 * @contact  group@hyperf.io
 * @license  https://github.com/hyperf/hyperf/blob/master/LICENSE
 */
use Hyperf\ConfigCenter\Mode;

return [
    'enable' => (bool) env('CONFIG_CENTER_ENABLE', true),
    'driver' => env('CONFIG_CENTER_DRIVER', 'nacos'),
    'mode' => env('CONFIG_CENTER_MODE', Mode::PROCESS),
    'drivers' => [
        'nacos' => [
            'driver' => Hyperf\ConfigNacos\NacosDriver::class,
            'merge_mode' => Hyperf\ConfigNacos\Constants::CONFIG_MERGE_OVERWRITE,
            'interval' => 3,
            'default_key' => 'nacos_config',
            'listener_config' => [
                // dataId, group, tenant, type, content
                'nacos_config' => [
                    // 命名空间/ID
                    'tenant' => env('NACOS_TENANT'), // corresponding with service.namespaceId
                    // DataID
                    'data_id' => env('NACOS_DATA_ID'),
                    // 组名
                    'group' => 'DEFAULT_GROUP',
                    'type' => 'json',
                ],
            ],
            'client' => [
                // 客户端
                'host' => env('NACOS_HOST'),
                'port' => env('NACOS_PORT'),
                'username' => env('NACOS_USERNAME'),
                'password' => env('NACOS_PASSWORD'),
                'guzzle' => [
                    'config' => null,
                ],
            ],
        ],
    ],
];
