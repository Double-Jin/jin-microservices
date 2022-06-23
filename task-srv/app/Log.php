<?php
/**
 * @user: DoubleJin
 * @date: 2022/5/26
 * @create: 14:54
 */

namespace App;

use Hyperf\Logger\LoggerFactory;
use Hyperf\Utils\ApplicationContext;

class Log
{
    public static function get(string $name = 'app')
    {
        return ApplicationContext::getContainer()->get(LoggerFactory::class)->get($name);
    }
}