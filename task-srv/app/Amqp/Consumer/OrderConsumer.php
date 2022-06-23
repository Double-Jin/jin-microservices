<?php

declare(strict_types=1);

namespace App\Amqp\Consumer;

use App\Log;
use Hyperf\Amqp\Result;
use Hyperf\Amqp\Annotation\Consumer;
use Hyperf\Amqp\Message\ConsumerMessage;
use PhpAmqpLib\Message\AMQPMessage;

/**
 * 订单订阅消息消费者
 * Class OrderConsumer
 * @package App\Amqp\Consumer
 */
#[Consumer(exchange: 'order', routingKey: 'order', queue: 'order', name: "OrderConsumer", nums: 1)]
class OrderConsumer extends ConsumerMessage
{
    public function consumeMessage($data, AMQPMessage $message): string
    {
        Log::get()->info("消费订单队列",$data);

        return Result::ACK;
    }
}
