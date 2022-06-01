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
use Hyperf\HttpServer\Contract\ResponseInterface;

#[Controller(prefix: '/saga')]
class SagaController extends AbstractController
{
    #[Inject]
    protected UserService $userService;

    #[PostMapping(path: 'changeStored')]
    public function changeStored(RequestInterface $request): array
    {

        $this->userService->changeStored(
            $request->input('user_id'),
            $request->input('amount'),
            $request->input('order_no'),
        );

        return [
            'dtm_result' => 'SUCCESS',
        ];
    }

    #[PostMapping(path: 'changeStoredCompensate')]
    public function changeStoredCompensate(RequestInterface $request): array
    {
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
