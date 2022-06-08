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
use Hyperf\HttpServer\Contract\RequestInterface;
use Hyperf\HttpServer\Annotation\Controller;
use Hyperf\HttpServer\Annotation\PostMapping;
use Hyperf\Di\Annotation\Inject;

/**
 * DTM.SAGA回调控制器
 * Class SagaController
 * @package App\Controller
 */
#[Controller(prefix: '/saga')]
class SagaController extends AbstractController
{
    /**
     * 注入OrderService
     * @var UserService
     */
    #[Inject]
    protected UserService $userService;

    /**
     * 改变储值成功
     * @param RequestInterface $request
     * @return string[]
     */
    #[PostMapping(path: 'changeStored')]
    public function changeStored(RequestInterface $request): array
    {
        //调用userService.changeStored方法
        $this->userService->changeStored(
            $request->input('user_id'),
            $request->input('amount'),
            $request->input('order_no'),
        );

        return [
            'dtm_result' => 'SUCCESS',
        ];
    }

    /**
     * 改变储值成功补偿
     * @param RequestInterface $request
     * @return string[]
     */
    #[PostMapping(path: 'changeStoredCompensate')]
    public function changeStoredCompensate(RequestInterface $request): array
    {
        //调用userService.changeStoredCompensate方法
        $this->userService->changeStoredCompensate(
            $request->input('user_id'),
            $request->input('amount'),
            $request->input('order_no'),
        );

        return [
            'dtm_result' => 'SUCCESS',
        ];
    }
}
