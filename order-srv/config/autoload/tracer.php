<?php
/**
 * @user: DoubleJin
 * @date: 2022/5/25
 * @create: 11:29
 */


return [
    // 选择默认的 Tracer
    'default' => env('TRACER_DRIVER', 'jaeger'),

    // 这里的代码演示不对 enable 内的配置进行展开
    'enable' => [],

    'tracer' => [
        // Zipkin 驱动配置
        'zipkin' => [
            // 当前应用的配置
            'app' => [
                'name' => env('APP_NAME', 'skeleton'),
                // 如果 ipv6 和 ipv6 为空组件会自动从 Server 中检测
                'ipv4' => '127.0.0.1',
                'ipv6' => null,
                'port' => 9501,
            ],
            'driver' => \Hyperf\Tracer\Adapter\ZipkinTracerFactory::class,
            'options' => [
                // Zipkin 服务的 endpoint 地址
                'endpoint_url' => env('ZIPKIN_ENDPOINT_URL', 'http://localhost:9411/api/v2/spans'),
                // 请求超时秒数
                'timeout' => env('ZIPKIN_TIMEOUT', 1),
            ],
            // 采样器，默认为所有请求的都追踪
            'sampler' => \Zipkin\Samplers\BinarySampler::createAsAlwaysSample(),
        ],
    ],
];