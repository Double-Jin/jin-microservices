<?php

declare(strict_types=1);

return [
    'http' => [
        \DtmClient\Middleware\DtmMiddleware::class,
    ],
    'jsonrpc-http' => [
        \Hyperf\Tracer\Middleware\TraceMiddleware::class,
        \DtmClient\Middleware\DtmMiddleware::class,
    ],
];
