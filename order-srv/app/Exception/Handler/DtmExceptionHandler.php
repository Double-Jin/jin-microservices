<?php

declare(strict_types=1);

namespace App\Exception\Handler;

use App\Exception\JsonRpcException;
use App\Exception\ServiceException;
use Hyperf\Contract\StdoutLoggerInterface;
use Hyperf\ExceptionHandler\ExceptionHandler;
use Hyperf\HttpMessage\Stream\SwooleStream;
use Hyperf\Utils\Context;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Throwable;

/**
 * DTM异常处理
 * Class JsonRpcExceptionHandler
 * @package App\Exception\Handler
 */
class DtmExceptionHandler extends ExceptionHandler
{
    /**
     * @var StdoutLoggerInterface
     */
    protected $logger;

    public function handle(Throwable $throwable, ResponseInterface $response)
    {

        if ($throwable instanceof ServiceException) {

            //阻止异常冒泡
            $this->stopPropagation();

            return $response->withStatus(409);
        }

        // 交给下一个异常处理器
        return $response;
    }

    public function isValid(Throwable $throwable): bool
    {
        return true;
    }
}
