<?php


namespace App\Services;

use App\Exception\JsonRpcException;
use App\Log;

/**
 * 文件service
 * Class UserService
 * @package App\Services
 */
class FileService
{

    /**
     * 上传文件
     * @param $type 文件类型
     * @param $base64string base64数据
     * @param $fileName 文件名
     * @return array|mixed[]
     */
    public function uploadFile(string $type,string $base64string,string $fileName)
    {
        Log::get()->info("调用uploadFile");

        try {

            if (!file_exists(config('file.storage.local.root'))){
                @mkdir(config('file.storage.local.root'), 0755, true);
            }

            $filePath = config('file.storage.local.root').'/'.$fileName;

            //base64转换成文件
            $baseFile = str_replace( 'data:' . $type . ';base64,', '', $base64string);
            $newFile = fopen( $filePath, "wb" );
            fwrite( $newFile, base64_decode( $baseFile) );
            fclose( $newFile );

        } catch (\Throwable $ex) {

            Log::get()->info("rpc调用失败");

            throw new JsonRpcException(430);
        }

        return [
            'file_name' => $fileName,
            'file_path' => $filePath
        ];

    }

}