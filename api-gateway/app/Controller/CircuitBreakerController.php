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

use App\Services\UserService;
use Hyperf\Di\Annotation\Inject;
use Hyperf\CircuitBreaker\Annotation\CircuitBreaker;
use Hyperf\HttpServer\Annotation\Controller;
use Hyperf\HttpServer\Annotation\GetMapping;

#[Controller(prefix: '/CircuitBreaker')]
class CircuitBreakerController extends CommonController
{
    #[Inject]
    protected UserService $userService;

    #[GetMapping(path: 'Test')]
    #[CircuitBreaker(timeout:0.4, failCounter:1, successCounter:1, fallback:"App\Controller\CircuitBreakerController::circuitBreakerFallback")]
    public function test()
    {
        $this->userService->testCircuitBreaker();

        return $this->success('这是服务降级');
    }

    public function circuitBreakerFallback()
    {
        return $this->success('服务降级啦~');
    }

}
