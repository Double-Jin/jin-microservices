<?php


namespace App\Services;

use App\Exception\JsonRpcException;
use App\Log;
use App\Model\User;
use Hyperf\Di\Annotation\Inject;
use Qbhy\HyperfAuth\Authenticatable;
use Qbhy\HyperfAuth\AuthManager;

/**
 * 用户service
 * Class AuthService
 * @package App\Services
 */
class AuthService
{

    #[Inject]
    protected AuthManager $auth;

    /**
     * 用户登录
     * @param $phone
     * @return mixed
     */
    public function userLogin($phone)
    {
        Log::get()->info("调用userLogin");

        $user = User::query()
            ->withSum('bonus', 'bonus')
            ->withSum('stored', 'amount')
            ->where('phone',$phone)
            ->first();

        if (empty($user)) {
            Log::get()->info("用户不存在");

            throw new JsonRpcException(10001);
        }

        return [
            'user_info' => $user,
            'token_type' => 'bearer_token',
            'token' => $this->auth->guard('jwt')->login($user),
        ];
    }

    /**
     * 用户退出
     * @param $token
     * @return mixed
     */
    public function userLogout($token)
    {
        Log::get()->info("调用userLogout");

        $this->auth->guard('jwt')->logout($token);

        return ;
    }

    /**
     * 检查用户token
     * @param $token
     * @return mixed
     */
    public function userCheckToken($token)
    {
        Log::get()->info("调用userCheckToken");

        $guard = $this->auth->guard('jwt');

        try {

            if (! $guard->user($token) instanceof Authenticatable) {
                throw new JsonRpcException(422);
            }

        }catch (\Throwable $exception){
            throw new JsonRpcException(422);
        }

        return ;
    }
}