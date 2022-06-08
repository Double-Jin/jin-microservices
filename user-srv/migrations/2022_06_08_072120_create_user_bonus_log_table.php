<?php

use Hyperf\Database\Schema\Schema;
use Hyperf\Database\Schema\Blueprint;
use Hyperf\Database\Migrations\Migration;

class CreateUserBonusLogTable extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('user_bonus_log', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('user_id')->default(0)->comment('用户id');
            $table->tinyInteger('type')->default(0)->comment('积分类型 -1减去积分 1 增加积分');
            $table->integer('bonus')->default(0)->comment('积分值');
            $table->string('source',50)->nullable()->comment('来源: order订单 admin_change后台调整');
            $table->string('remark',50)->nullable()->comment('备注');

            $table->integer('create_time')->default(0)->comment('创建时间');
            $table->integer('update_time')->default(0)->comment('更新时间');

            $table->comment('用户积分表');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('user_bonus_log');
    }
}
