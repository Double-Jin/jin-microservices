<?php

declare(strict_types=1);

namespace App\Controller;

use App\Services\OrderService;
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
     * @var OrderService
     */
    #[Inject]
    protected OrderService $orderService;

    /**
     * 订单创建成功
     * @param RequestInterface $request
     * @return string[]
     */
    #[PostMapping(path: 'sageCreateOrder')]
    public function sageCreateOrder(RequestInterface $request): array
    {
        //调用orderService.sageCreateOrder方法
        $this->orderService->sageCreateOrder($request->all());

        return [
            'dtm_result' => 'SUCCESS',
        ];
    }

    /**
     * 订单创建成功补偿
     * @param RequestInterface $request
     * @return string[]
     */
    #[PostMapping(path: 'sageCreateOrderCompensate')]
    public function sageCreateOrderCompensate(RequestInterface $request): array
    {
        //调用orderService.sageCreateOrderCompensate方法
        $this->orderService->sageCreateOrderCompensate($request->all());

        return [
            'dtm_result' => 'SUCCESS',
        ];
    }

}
