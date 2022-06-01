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

#[Controller(prefix: '/User')]
class UserController extends CommonController
{
    #[Inject]
    protected UserService $userService;

    #[GetMapping(path: 'UserInfo')]
    public function userInfo(RequestInterface $request)
    {
        $res = $this->userService->getRpcUserInfo(1);

        return $this->success($res);
    }

    #[GetMapping(path: 'UserBonusList')]
    public function userBonusList(RequestInterface $request)
    {
        $res = $this->userService->getRpcUserBonusList(1,15);

        return $this->success($res);
    }

    #[GetMapping(path: 'UserStoredList')]
    public function userStoredList(RequestInterface $request)
    {
        $res = $this->userService->getRpcUserStoredList(1,15);

        return $this->success($res);
    }
}
