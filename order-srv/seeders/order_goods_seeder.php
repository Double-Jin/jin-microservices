<?php

declare(strict_types=1);

use Hyperf\Database\Seeders\Seeder;

class OrderGoodsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \Hyperf\DbConnection\Db::table('order_goods')->insert([
            'order_no' => '20220527',
            'goods_id' => 2,
            'goods_sn' => 'AS12',
            'sku_id' => 10,
            'user_id' => 1,
            'goods_name' => '测试商品',
            'number' => 1,
            'goods_tag_price' => 100.00,
            'goods_real_price' => 100.00,
            'goods_discount' => 100.00,
            'goods_fact_money' => 100.00,
            'create_time' =>time(),
            'update_time' =>time(),
        ]);
    }
}
