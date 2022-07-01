<?php

declare(strict_types=1);

namespace App\Controller;

use App\Middleware\UserAuthMiddleware;
use App\Services\AuthService;
use Hyperf\Di\Annotation\Inject;
use Hyperf\HttpServer\Annotation\Controller;
use Hyperf\HttpServer\Annotation\GetMapping;
use Hyperf\HttpServer\Annotation\Middleware;
use Hyperf\HttpServer\Contract\RequestInterface;

/**
 * 用户权限控制器
 * Class UserController
 * @package App\Controller
 */
#[Controller(prefix: '/Auth')]
class AuthController extends CommonController
{
    /**
     * 注入AuthService
     * @var AuthService
     */
    #[Inject]
    protected AuthService $authService;

    /**
     * 用户登录
     * @param RequestInterface $request
     * @return \Psr\Http\Message\ResponseInterface
     */
    #[GetMapping(path: 'Login')]
    public function Login(RequestInterface $request)
    {
        //调用authService.getRpcUserLogin
        $res = $this->authService->getRpcUserLogin('1358888888');

        return $this->success($res);
    }

    /**
     * 用户退出
     * @param RequestInterface $request
     * @return \Psr\Http\Message\ResponseInterface
     */
    #[GetMapping(path: 'Logout')]
    #[Middleware(UserAuthMiddleware::class)]
    public function Logout(RequestInterface $request)
    {
        //调用authService.getRpcUserLogout
        $res = $this->authService->getRpcUserLogout(getBearerToken($request->header('Authorization')));

        return $this->success($res);
    }
}
