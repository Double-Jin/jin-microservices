<?php

declare(strict_types=1);

/**
 * This file is part of Hyperf.
 *
 * @link     https://www.hyperf.io
 * @document https://doc.hyperf.io
 * @contact  group@hyperf.io
 */

use GuzzleHttp\Exception\GuzzleException;
use Hyperf\Redis\Redis;
use Hyperf\Logger\LoggerFactory;
use Hyperf\Utils\ApplicationContext;
use Hyperf\Contract\StdoutLoggerInterface;
use Hyperf\ExceptionHandler\Formatter\FormatterInterface;

/**
 * 获取Container
 */
if (!function_exists('di')) {
    /**
     * Finds an entry of the container by its identifier and returns it.
     * @param null|mixed $id
     * @return mixed|\Psr\Container\ContainerInterface
     */
    function di($id = null)
    {
        $container = ApplicationContext::getContainer();
        if ($id) {
            return $container->get($id);
        }
        return $container;
    }
}

/**
 * 控制台日志
 */
if (!function_exists('stdLog')) {
    function stdLog()
    {
        return di()->get(StdoutLoggerInterface::class);
    }
}

/**
 * 文件日志
 */
if (!function_exists('logger')) {
    function logger($name = 'log', $group = 'default')
    {
        return di()->get(LoggerFactory::class)->get($name, $group);
    }
}

/**
 * redis 客户端实例
 */
if (!function_exists('redis')) {
    function redis()
    {
        return di()->get(Redis::class);
    }
}

/**
 * 缓存实例 简单的缓存
 */
if (!function_exists('cache')) {
    function cache()
    {
        return di()->get(\Psr\SimpleCache\CacheInterface::class);
    }
}

if (!function_exists('format_throwable')) {
    /**
     * Format a throwable to string.
     * @param Throwable $throwable
     * @return string
     */
    function format_throwable(Throwable $throwable): string
    {
        return di()->get(FormatterInterface::class)->format($throwable);
    }
}


if (!function_exists('responseSuccess')) {
    function responseSuccess($code, $message = '', $data = [])
    {
        $content = ['code' => $code];
        $message ? $content['msg'] = $message : $content['msg'] = \App\Constants\ResponseCode::getMessage($code);
        $data ? $content['data'] = $data : $content['data'] = [];
        return $content;
    }
}

if (!function_exists('responseError')) {
    function responseError($code, $message = '', $data = [])
    {
        $content = ['code' => $code];
        $message ? $content['msg'] = $message : $content['msg'] = \App\Constants\ResponseCode::getMessage($code);
        $data ? $content['data'] = $data : $content['data'] = [];
        return $content;
    }
}


/**
 * 判读字符串是否为json
 */
if (!function_exists('isJson')) {
    /**
     * Finds an entry of the container by its identifier and returns it.
     * @param string $string
     */
    function isJson($string)
    {
        json_decode($string);
        return (json_last_error() == JSON_ERROR_NONE);
    }
}

/**
 * 容器实例
 */
if (!function_exists('container')) {
    function container()
    {
        return ApplicationContext::getContainer();
    }
}

/**
 * 获取BearerToken
 */
if (!function_exists('getBearerToken')) {
    function getBearerToken($Authorization)
    {
        if (\Hyperf\Utils\Str::startsWith($Authorization, 'Bearer ')) {
            return \Hyperf\Utils\Str::substr($Authorization, 7);
        }

        return null;
    }
}



