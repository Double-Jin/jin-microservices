<?php
/**
 * @user: DoubleJin
 * @date: 2022/6/23
 * @create: 14:55
 */

use Hyperf\Crontab\Crontab;

return [
    // 是否开启定时任务
    'enable' => true,
    'crontab' => [
        (new Crontab())->setType('command')
            ->setName('TestCommand')
            ->setRule('* * * * *')->setCallback([
                'command' => 'TestCommand',
            ]),
    ],
];