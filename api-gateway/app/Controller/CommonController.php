<?php

namespace App\Controller;

/**
 * 通用控制器
 * Class CommonController
 * @package App\Controller
 */
class CommonController extends AbstractController
{
    public function success($data = [])
    {
        return $this->response->json(responseSuccess(200, '', $data));
    }

}