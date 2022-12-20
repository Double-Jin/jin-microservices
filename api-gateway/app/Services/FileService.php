<?php


namespace App\Services;

use App\Exception\ServiceException;
use App\JsonRpc\FileRpcServiceInterface;
use App\Log;
use Hyperf\Di\Annotation\Inject;
use Hyperf\Utils\Str;

/**
 * 文件service
 * Class UserService
 * @package App\Services
 */
class FileService
{

    /**
     * 注入FileRpcServiceInterface
     * @var FileRpcServiceInterface
     */
    #[Inject]
    protected FileRpcServiceInterface $fileRpcServiceInterface;

    /**
     * 上传文件
     * @param $file
     * @return mixed
     */
    public function getRpcUploadFile($file)
    {
        Log::get()->info("调用uploadFile");

        $type =$file->getExtension(); //获取文件类型

        $fileData = file_get_contents($file->getRealPath()); //获取文件二进制流

        $base64String = 'data:' . $type . ';base64,' . chunk_split(base64_encode($fileData));

        $fileName = Str::random(16) . '.' . $type;

        try {
            //调用文件服务中的文件上传方法
            $res = $this->fileRpcServiceInterface->uploadFile($type,$base64String,$fileName);

        } catch (\Throwable $ex) {
            Log::get()->info("rpc调用失败", [
                'code' => $ex->getCode(),
                'file' => $ex->getFile(),
                'message' => $ex->getMessage(),
            ]);

            throw new ServiceException(430);
        }

        if ($res['code'] !== 200) {
            Log::get()->info("rpc调用失败", [
                'code' => $res['code'],
                'file' => '',
                'message' => $res['message']
            ]);

            throw new ServiceException(430);
        }

        return $res['data'];

    }

}