<?php

declare(strict_types=1);

return [
    'http' => [
        \Hyperf\Tracer\Middleware\TraceMiddleware::class,
//        \App\Exception\Handler\AppServiceExceptionHandler::class,
    ],
    'jsonrpc-http' => [
        \Hyperf\Tracer\Middleware\TraceMiddleware::class,
    ],
];
