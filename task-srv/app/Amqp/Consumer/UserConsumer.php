<?php

declare(strict_types=1);

namespace App\Amqp\Consumer;

use App\Log;
use Hyperf\Amqp\Result;
use Hyperf\Amqp\Annotation\Consumer;
use Hyperf\Amqp\Message\ConsumerMessage;
use PhpAmqpLib\Message\AMQPMessage;

/**
 * 用户订阅消息消费者
 * Class UserConsumer
 * @package App\Amqp\Consumer
 */
#[Consumer(exchange: 'user', routingKey: 'user', queue: 'user', name: "UserConsumer", nums: 1)]
class UserConsumer extends ConsumerMessage
{
    public function consumeMessage($data, AMQPMessage $message): string
    {
        Log::get()->info("消费用户队列",$data);

        return Result::ACK;
    }
}
