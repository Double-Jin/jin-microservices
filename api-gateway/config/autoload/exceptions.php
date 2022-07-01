<?php

declare(strict_types=1);

return [
    'handler' => [
        'http' => [
            Hyperf\HttpServer\Exception\Handler\HttpExceptionHandler::class,
            App\Exception\Handler\AppExceptionHandler::class,
            App\Exception\Handler\AppServiceExceptionHandler::class,
            App\Exception\Handler\RateLimitExceptionHandler::class,
        ],
    ],
];
