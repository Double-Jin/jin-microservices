<?php

declare(strict_types=1);

return [
    // nacos server url like https://nacos.hyperf.io, Priority is higher than host:port
    // 'url' => '',
    // The nacos host info
    'host' => env('NACOS_HOST'),
    'port' => env('NACOS_PORT'),
    // The nacos account info
    'username' => env('NACOS_USERNAME'),
    'password' => env('NACOS_PASSWORD'),
    'guzzle' => [
        'config' => null,
    ],
];
