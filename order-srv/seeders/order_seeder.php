<?php

declare(strict_types=1);

use Hyperf\Database\Seeders\Seeder;

class OrderSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \Hyperf\DbConnection\Db::table('order')->insert([
            'order_no' => '20220527',
            'user_id' => 1,
            'coupon_id' => 0,
            'order_money' => 100.00,
            'order_discount' => 100.00,
            'order_fact_money' => 100.00,
            'consume_number' => 1,
            'order_status' => 1,
            'payment' => 1,
            'create_time' =>time(),
            'update_time' =>time(),
        ]);

    }
}
