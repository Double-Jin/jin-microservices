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

/**
 * 服务降级控制器
 * Class CircuitBreakerController
 * @package App\Controller
 */
#[Controller(prefix: '/CircuitBreaker')]
class CircuitBreakerController extends CommonController
{

    /**
     * 注入UserService
     * @var UserService
     */
    #[Inject]
    protected UserService $userService;

    /**
     * 测试服务降级
     * @return \Psr\Http\Message\ResponseInterface
     */
    #[GetMapping(path: 'Test')]
    #[CircuitBreaker(options:["timeout"=>0.05],failCounter:1, successCounter:1, fallback:"App\Controller\CircuitBreakerController::circuitBreakerFallback")]
    public function test()
    {
        $this->userService->testCircuitBreaker();

        return $this->success('这是服务降级');
    }

    /**
     * 服务降级异常返回方法
     * @return \Psr\Http\Message\ResponseInterface
     */
    public function circuitBreakerFallback()
    {
        return $this->success('服务降级啦~');
    }

}
