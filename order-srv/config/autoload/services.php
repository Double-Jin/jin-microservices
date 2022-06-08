<?php
/**
 * @user: DoubleJin
 * @date: 2022/5/24
 * @create: 09:35
 */

// 这个是nacos服务的端口和地址
$registry = [
    'protocol' => 'nacos',
    'address' => 'http://'.env('NACOS_HOST').':'.env('NACOS_PORT'),
];

// 这里配置需要用的rpc服务
$services = [
    [
        'name' => 'UserRpcService',
        'service' => \App\JsonRpc\UserRpcServiceInterface::class
    ]
];

return [
    'enable' => [
        // 开启服务发现
        'discovery' => true,
        // 开启服务注册
        'register' => true,
    ],
    // 服务消费者相关配置
    'consumers' => value(function () use ($services, $registry) {
        // 循环生成rpc消费端
        $consumers = [];
        foreach ($services as $value) {
            $consumers[] = [
                'name' => $value['name'],
                'service' => $value['service'],
                'registry' => $registry
            ];
        }
        return $consumers;
    }),
    // 服务提供者相关配置
    'providers' => [],
    // 服务驱动相关配置
    'drivers' => [
        // nacos 配置,当前使用
        'nacos' => [
            // The nacos host info
            'host' => env('NACOS_HOST'),
            'port' => env('NACOS_PORT'),
            // nacos 账号密码信息
            'username' => env('NACOS_USERNAME'),
            'password' => env('NACOS_PASSWORD'),
            'guzzle' => [
                'config' => null,
            ],
            // 命名空间,public为默认系统空间
            'group_name' => 'api',
            // 命名空间ID
             'namespace_id' => env('NACOS_TENANT'),
            // 心跳检查秒数
            'heartbeat' => 5,
            'ephemeral' => true, // 是否注册临时实例
        ],
    ],
];