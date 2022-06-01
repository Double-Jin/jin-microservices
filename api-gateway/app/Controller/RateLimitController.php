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

use Hyperf\Di\Annotation\Inject;
use Hyperf\HttpServer\Annotation\Controller;
use Hyperf\HttpServer\Annotation\GetMapping;
use Hyperf\HttpServer\Contract\RequestInterface;
use Hyperf\RateLimit\Annotation\RateLimit;

#[Controller(prefix: '/RateLimit')]
class RateLimitController extends CommonController
{

    #[GetMapping(path: 'Test')]
    #[RateLimit(create:1,consume:1, capacity:1,waitTimeout:1)]
    public function test(RequestInterface $request)
    {
        return $this->success('这是测试限流');
    }

}
