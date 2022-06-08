<?php

declare(strict_types=1);

use Hyperf\Database\Seeders\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \Hyperf\DbConnection\Db::table('user')->insert([
            'user_name' => 'DoubleJin',
            'user_image' => 'http://thirdwx.qlogo.cn/mmopen/Px0DzaTpW96d5vicVMbA6hkjic31msWnF1gU1yicrfNsmkxd1UT8N4vlTV6UArXQm1cBo3AB9I74dfGIquZ21SuJRLCuA5fIia7v/132',
            'phone' => '1358888888',
            'sex' => 1,
            'create_time' =>time(),
            'update_time' =>time(),
        ]);
    }
}
