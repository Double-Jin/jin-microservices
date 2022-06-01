<?php


namespace App\Controller;

class CommonController extends AbstractController
{
    public function success($data = [])
    {
        return $this->response->json(responseSuccess(200, '', $data));
    }
}