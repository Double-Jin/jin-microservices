<?php

declare(strict_types=1);

namespace App\Controller;

use App\Services\FileService;
use Hyperf\Di\Annotation\Inject;
use Hyperf\HttpServer\Annotation\Controller;
use Hyperf\HttpServer\Annotation\PostMapping;
use Hyperf\HttpServer\Contract\RequestInterface;

/**
 * 文件控制器
 * Class FileController
 * @package App\Controller
 */
#[Controller(prefix: '/File')]
class FileController extends CommonController
{
    /**
     * 注入FileService
     * @var FileService
     */
    #[Inject]
    protected FileService $fileService;

    /**
     * 上传文件
     * @param RequestInterface $request
     * @return \Psr\Http\Message\ResponseInterface
     */
    #[PostMapping(path: 'UploadFile')]
    public function uploadFile(RequestInterface $request)
    {
        $res = $this->fileService->getRpcUploadFile($request->file('file'));

        return $this->success($res);
    }

}
