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
namespace App\Controller;

use Hyperf\HttpServer\Annotation\Controller;
use Hyperf\HttpServer\Annotation\GetMapping;
use Hyperf\RateLimit\Annotation\RateLimit;

/**
 * 限流控制器
 * Class RateLimitController
 * @package App\Controller
 */
#[Controller(prefix: '/RateLimit')]
class RateLimitController extends CommonController
{

    /**
     * 测试限流
     * @return \Psr\Http\Message\ResponseInterface
     */
    #[GetMapping(path: 'Test')]
    #[RateLimit(create:1,consume:1, capacity:1,waitTimeout:1)]
    public function test()
    {
        return $this->success('这是测试限流');
    }

}
