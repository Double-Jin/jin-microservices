<?php


namespace App\Constants;

use Hyperf\Constants\AbstractConstants;
use Hyperf\Constants\Annotation\Constants;

/**
 * @Constants
 */
class ResponseCode extends AbstractConstants
{
    /**
     * @Message("请求错误");
     */
    const ERROR = 0;

    /**
     * @Message("成功");
     */
    const SUCCESS = 200;

    /**
     * @Message("创建成功");
     */
    const CREATE_ED = 201;

    /**
     * 请求成功但服务器未处理，响应中包含指示信息
     * @Message("请求成功");
     */
    const ACCEPT_ED = 202;

    /**
     * 请求成功，但是没有响应内容
     * @Message("请求成功");
     */
    const NO_CONTENT = 204;

    /**
     * 请求成功，缓存生效
     * @Message("NO_TMODIFIED");
     */
    const NO_TMODIFIED = 302;

    /**
     * 请求错误，无法解析请求体
     * @Message("请求错误");
     */
    const BAD_REQUEST = 400;

    /**
     * 认证失败
     * @Message("请登录");
     */
    const UNAUTHORIZED = 401;

    /**
     * 服务器已经接受到请求，但拒绝执行
     * @Message("FORBIDDEN");
     */
    const FORBIDDEN = 403;

    /**
     * 找不到请求的资源
     * @Message("找不到请求的资源");
     */
    const  NOT_FOUND = 404;

    /**
     * 方法不允许当前用户访问
     * @Message("METHOD_NOT_ALLOWED");
     */
    const  METHOD_NOT_ALLOWED = 405;

    /**
     * 请求资源已过期
     * @Message("GONE");
     */
    const  GONE = 410;

    /**
     * 请求体内的类型错误
     * @Message("MEDIA_TYPE");
     */
    const  MEDIA_TYPE = 405;

    /**
     * 验证失败
     * @Message("验证失败");
     */
    const  UNPROCESSABLE = 422;


    /**
     * 请求频繁
     * @Message("请求频繁");
     */
    const  MAX_REQUEST = 429;

    /**
     * RPC调用失败
     * @Message("RPC调用失败");
     */
    const  RPC_ERROR = 430;

}