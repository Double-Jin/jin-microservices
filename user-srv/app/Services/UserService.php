<?php


namespace App\Services;

use App\Exception\JsonRpcException;
use App\Exception\ServiceException;
use App\Log;
use App\Model\User;
use App\Model\UserBonusLog;
use App\Model\UserStoredLog;

class UserService
{

    public function userInfo($userId)
    {
        Log::get()->info("调用userInfo");

        $User = User::query()
            ->withSum('bonus', 'bonus')
            ->withSum('stored', 'amount')
            ->find($userId);

        if (empty($User)) {
            Log::get()->info("用户不存在");

            throw new JsonRpcException(10001);
        }

        return $User->toArray();

    }

    public function userBonusList($page, $pageSize)
    {
        Log::get()->info("调用userBonusList");

        $list = UserBonusLog::query()
            ->paginate($pageSize, ['*'], 'page', $page);

        if ($list->isEmpty()) {
            Log::get()->info("用户积分不存在");

            throw new JsonRpcException(10002);
        }

        return $list->toArray();
    }

    public function userStoredList($page, $pageSize)
    {
        Log::get()->info("调用userBonusList");

        $list = UserStoredLog::query()
            ->paginate($pageSize, ['*'], 'page', $page);

        if ($list->isEmpty()) {
            Log::get()->info("用户储值不存在");

            throw new JsonRpcException(10003);
        }

        return $list->toArray();
    }

    public function changeStored($userId,$amount,$orderNo){
        Log::get()->info("分布式事务-changeStored",[
            'user_id'=>$userId,
            'amount'=>$amount,
            'order_no'=>$orderNo,
        ]);
        //分布式事务
        try {

            UserStoredLog::create([
                'user_id' => $userId,
                'type' => $amount >= 0 ? 1: -1,
                'amount' => $amount,
                'source' => 'order',
                'remark' => $orderNo
            ]);

        } catch (\Throwable $e) {
            Log::get()->info("分布式事务-changeStored-调用失败");

            throw new ServiceException();
        }

    }

    public function changeStoredCompensate($userId,$amount,$orderNo){
        Log::get()->info("分布式事务-changeStoredCompensate",[
            'user_id'=>$userId,
            'amount'=>$amount,
            'order_no'=>$orderNo,
        ]);

        //分布式事务
        try {
            UserStoredLog::query()
                ->where('user_id',$userId)
                ->where('source','order')
                ->where('remark',$orderNo)
                ->delete();

        } catch (\Throwable $e) {
            Log::get()->info("分布式事务-changeStoredCompensate-调用失败");

            throw new ServiceException();
        }

    }

}