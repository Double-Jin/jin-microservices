<?php

declare(strict_types=1);

namespace App\Exception;

use App\Constants\ResponseCode;
use Hyperf\Server\Exception\ServerException;
use Throwable;

class ServiceException extends ServerException
{
    public function __construct(int $code = 0, string $message = null, Throwable $previous = null)
    {
        if (is_null($message)) {
            $message = ResponseCode::getMessage($code);
        }
        parent::__construct($message, $code, $previous);
    }
}