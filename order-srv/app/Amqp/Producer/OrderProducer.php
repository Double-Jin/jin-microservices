<?php

declare(strict_types=1);

namespace App\Amqp\Producer;

use Hyperf\Amqp\Annotation\Producer;
use Hyperf\Amqp\Message\ProducerMessage;

/**
 * 订单订阅消息生产者
 * Class OrderProducer
 * @package App\Amqp\Producer
 */
#[Producer(exchange: 'order', routingKey: 'order')]
class OrderProducer extends ProducerMessage
{
    public function __construct($data)
    {
        $this->payload = $data;
    }
}
