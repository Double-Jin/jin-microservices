<?php

declare(strict_types=1);

namespace App\Controller;

use Hyperf\HttpServer\Annotation\Controller;
use Hyperf\HttpServer\Annotation\GetMapping;
use Hyperf\HttpServer\Contract\RequestInterface;

/**
 * 配置控制器
 * Class ConfigController
 * @package App\Controller
 */
#[Controller(prefix: '/Config')]
class ConfigController extends CommonController
{

    /**
     * 测试配置中心数据获取
     * @param RequestInterface $request
     * @return \Psr\Http\Message\ResponseInterface
     */
    #[GetMapping(path: 'Test')]
    public function test(RequestInterface $request)
    {
        //获取nacos中的配置
        $config = config('nacos_config');

        return $this->success($config);
    }

}
