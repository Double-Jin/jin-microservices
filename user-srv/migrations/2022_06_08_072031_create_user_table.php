<?php

use Hyperf\Database\Schema\Schema;
use Hyperf\Database\Schema\Blueprint;
use Hyperf\Database\Migrations\Migration;

class CreateUserTable extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('user', function (Blueprint $table) {
            $table->bigIncrements('id');

            $table->string('user_name', 50)->nullable()->comment('用户名');
            $table->string('user_image', 255)->nullable()->comment('头像');
            $table->string('phone', 30)->nullable()->comment('手机号');
            $table->tinyInteger('sex')->default(0)->comment('性别,1男，2女，0未知');

            $table->integer('create_time')->default(0)->comment('创建时间');
            $table->integer('update_time')->default(0)->comment('更新时间');

            $table->comment('用户表');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('user');
    }
}
