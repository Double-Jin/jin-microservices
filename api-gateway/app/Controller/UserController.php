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
use Hyperf\HttpServer\Annotation\Controller;
use Hyperf\HttpServer\Annotation\GetMapping;
use Hyperf\HttpServer\Contract\RequestInterface;

/**
 * 用户控制器
 * Class UserController
 * @package App\Controller
 */
#[Controller(prefix: '/User')]
class UserController extends CommonController
{
    /**
     * 注入UserService
     * @var UserService
     */
    #[Inject]
    protected UserService $userService;

    /**
     * 用户信息
     * @param RequestInterface $request
     * @return \Psr\Http\Message\ResponseInterface
     */
    #[GetMapping(path: 'UserInfo')]
    public function userInfo(RequestInterface $request)
    {
        //调用userService.getRpcUserInfo方法
        $res = $this->userService->getRpcUserInfo(1);

        return $this->success($res);
    }

    /**
     * 用户积分列表
     * @param RequestInterface $request
     * @return \Psr\Http\Message\ResponseInterface
     */
    #[GetMapping(path: 'UserBonusList')]
    public function userBonusList(RequestInterface $request)
    {
        //调用userService.getRpcUserBonusList方法
        $res = $this->userService->getRpcUserBonusList(1,15);

        return $this->success($res);
    }

    /**
     * 用户储值列表
     * @param RequestInterface $request
     * @return \Psr\Http\Message\ResponseInterface
     */
    #[GetMapping(path: 'UserStoredList')]
    public function userStoredList(RequestInterface $request)
    {
        //调用userService.getRpcUserStoredList方法
        $res = $this->userService->getRpcUserStoredList(1,15);

        return $this->success($res);
    }
}
