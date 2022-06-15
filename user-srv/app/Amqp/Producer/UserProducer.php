<?php

declare(strict_types=1);

namespace App\Amqp\Producer;

use Hyperf\Amqp\Annotation\Producer;
use Hyperf\Amqp\Message\ProducerMessage;

/**
 * 用户订阅消息生产者
 * Class UserProducer
 * @package App\Amqp\Producer
 */
#[Producer(exchange: 'user', routingKey: 'user')]
class UserProducer extends ProducerMessage
{
    public function __construct($data)
    {
        $this->payload = $data;
    }
}
