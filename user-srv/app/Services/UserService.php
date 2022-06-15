<?php


namespace App\Services;

use Hyperf\Amqp\Producer;
use App\Amqp\Producer\UserProducer;
use App\Exception\JsonRpcException;
use App\Exception\ServiceException;
use App\Log;
use App\Model\User;
use App\Model\UserBonusLog;
use App\Model\UserStoredLog;

/**
 * 用户service
 * Class UserService
 * @package App\Services
 */
class UserService
{

    /**
     * 用户详情
     * @param $userId
     * @return array|mixed[]
     */
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

    /**
     * 用户积分列表
     * @param $page
     * @param $pageSize
     * @return mixed
     */
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

    /**
     * 用户储值列表
     * @param $page
     * @param $pageSize
     * @return mixed
     */
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

    /**
     * SAGA改变用户储值成功
     * @param $userId
     * @param $amount
     * @param $orderNo
     */
    public function changeStored($userId, $amount, $orderNo)
    {
        Log::get()->info("分布式事务-changeStored", [
            'user_id' => $userId,
            'amount' => $amount,
            'order_no' => $orderNo,
        ]);

        //分布式事务
        try {

            UserStoredLog::create([
                'user_id' => $userId,
                'type' => $amount >= 0 ? 1 : -1,
                'amount' => $amount,
                'source' => 'order',
                'remark' => $orderNo
            ]);

        } catch (\Throwable $e) {
            Log::get()->info("分布式事务-changeStored-调用失败");

            throw new ServiceException();
        }

    }

    /**
     * SAGA改变用户储值补偿
     * @param $userId
     * @param $amount
     * @param $orderNo
     */
    public function changeStoredCompensate($userId, $amount, $orderNo)
    {
        Log::get()->info("分布式事务-changeStoredCompensate", [
            'user_id' => $userId,
            'amount' => $amount,
            'order_no' => $orderNo,
        ]);

        //分布式事务
        try {
            UserStoredLog::query()
                ->where('user_id', $userId)
                ->where('source', 'order')
                ->where('remark', $orderNo)
                ->delete();

        } catch (\Throwable $e) {
            Log::get()->info("分布式事务-changeStoredCompensate-调用失败");

            throw new ServiceException();
        }

    }

    /**
     * 投递用户消息到RabbitMQ
     */
    public function userRabbitMQ()
    {

        //拼装数据
        $message = new UserProducer([
            'id' => 1
        ]);

        $producer = di()->get(Producer::class);

        //投递消息
        $result = $producer->produce($message);

        //投递消息失败
        if ($result != true){
            throw new JsonRpcException(430);
        }

    }
}