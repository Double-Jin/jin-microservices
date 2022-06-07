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
namespace App\Exception\Handler;

use App\Exception\JsonRpcException;
use Hyperf\Contract\StdoutLoggerInterface;
use Hyperf\ExceptionHandler\ExceptionHandler;
use Hyperf\HttpMessage\Stream\SwooleStream;
use Hyperf\Utils\Context;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Throwable;

/**
 * jsonRpc异常处理
 * Class JsonRpcExceptionHandler
 * @package App\Exception\Handler
 */
class JsonRpcExceptionHandler extends ExceptionHandler
{
    /**
     * @var StdoutLoggerInterface
     */
    protected $logger;

    public function handle(Throwable $throwable, ResponseInterface $response)
    {

        if ($throwable instanceof JsonRpcException) {


            //阻止异常冒泡
            $this->stopPropagation();

            $request =  Context::get(ServerRequestInterface::class);
            $jsonRpcTreaty = $request->getAttribute('data');
            //返回自定义错误数据
//            return di(ResponseBuilder::class)->buildResponse($request,$response);
            $result = responseError($throwable->getCode(), $throwable->getMessage());

            $jsonRpc = [
                "jsonrpc" => $jsonRpcTreaty['jsonrpc'],
                "id" => $jsonRpcTreaty['id'],
                "result" => $result,
                "context" => ''
            ];

            return $response->withStatus($throwable->getCode())
                ->withAddedHeader('content-type', 'application/json; charset=utf-8')
                ->withBody(new SwooleStream(json_encode($jsonRpc, JSON_UNESCAPED_UNICODE)));
        }

        // 交给下一个异常处理器
        return $response;
    }

    public function isValid(Throwable $throwable): bool
    {
        return true;
    }
}
