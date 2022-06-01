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

use App\Services\OrderService;
use Hyperf\HttpServer\Contract\RequestInterface;
use Hyperf\HttpServer\Annotation\Controller;
use Hyperf\HttpServer\Annotation\PostMapping;
use Hyperf\Di\Annotation\Inject;

#[Controller(prefix: '/saga')]
class SagaController extends AbstractController
{
    #[Inject]
    protected OrderService $orderService;

    #[PostMapping(path: 'sageCreateOrder')]
    public function sageCreateOrder(RequestInterface $request): array
    {
        var_dump(1);
        $this->orderService->sageCreateOrder($request->all());

        return [
            'dtm_result' => 'SUCCESS',
        ];
    }

    #[PostMapping(path: 'sageCreateOrderCompensate')]
    public function sageCreateOrderCompensate(RequestInterface $request): array
    {
        $this->orderService->sageCreateOrderCompensate($request->all());

        return [
            'dtm_result' => 'SUCCESS',
        ];
    }

}
