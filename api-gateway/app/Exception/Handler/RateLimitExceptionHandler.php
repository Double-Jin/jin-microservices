<?php

declare(strict_types=1);
/**
 * This file is part of Hyperf.
 *
 * @link     https://www.hyperf.io
 * @document https://doc.hyperf.io
 * @contact  group@hyperf.io
 * @license  https://github.com/hyperf/hyperf/blob/master/LICENSE
 */

namespace App\Exception\Handler;

use App\Exception\ServiceException;
use Hyperf\ExceptionHandler\ExceptionHandler;
use Hyperf\HttpMessage\Stream\SwooleStream;
use Hyperf\RateLimit\Exception\RateLimitException;
use Psr\Http\Message\ResponseInterface;
use Throwable;

/**
 * 限流器异常处理
 * Class RateLimitExceptionHandler
 * @package App\Exception\Handler
 */
class RateLimitExceptionHandler extends ExceptionHandler
{
    public function handle(Throwable $throwable, ResponseInterface $response)
    {
        if ($throwable instanceof RateLimitException) {
            //阻止异常冒泡
            $this->stopPropagation();

            //返回自定义错误数据
            $result = responseError($throwable->getCode(), '您被限流啦');

            return $response->withStatus($throwable->getCode())
                ->withAddedHeader('content-type', 'application/json')
                ->withBody(new SwooleStream(json_encode($result, JSON_UNESCAPED_UNICODE)));
        }

        // 交给下一个异常处理器
        return $response;
    }

    /**
     *
     * @param Throwable $throwable 抛出的异常
     * @return bool 该异常处理器是否处理该异常
     */
    public function isValid(Throwable $throwable): bool
    {
        //当前的异常是否属于业务异常
        return true;
    }
}