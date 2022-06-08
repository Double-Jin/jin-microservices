<?php

use Hyperf\Database\Schema\Schema;
use Hyperf\Database\Schema\Blueprint;
use Hyperf\Database\Migrations\Migration;

class CreateUserStoredLogTable extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('user_stored_log', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('user_id')->default(0)->comment('用户id');
            $table->tinyInteger('type')->default(0)->comment('积分类型 -1减去储值 1 增加储值');
            $table->decimal('amount',10,2)->default(0)->comment('金额');
            $table->string('source',50)->nullable()->comment('来源: pay充值 order订单 admin_change后台调整');
            $table->string('remark',50)->nullable()->comment('备注');

            $table->integer('create_time')->default(0)->comment('创建时间');
            $table->integer('update_time')->default(0)->comment('更新时间');

            $table->comment('用户储值表');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('user_stored_log');
    }
}
