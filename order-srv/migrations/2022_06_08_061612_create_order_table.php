<?php

use Hyperf\Database\Schema\Schema;
use Hyperf\Database\Schema\Blueprint;
use Hyperf\Database\Migrations\Migration;

class CreateOrderTable extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('order', function (Blueprint $table) {
            $table->bigIncrements('id');

            $table->string('order_no')->nullable()->comment('订单编号');

            $table->integer('user_id')->default(0)->comment('线下订单编号');
            $table->integer('coupon_id')->default(0)->comment('会员优惠券id');

            $table->decimal('order_money',10,2)->default(0)->comment('订单金额');
            $table->decimal('order_discount',10,2)->default(0)->comment('订单折扣');
            $table->decimal('order_fact_money',10,2)->default(0)->comment('订单实际金额');

            $table->integer('consume_number')->default(0)->comment('商品数量');

            $table->tinyInteger('order_status')->default(0)->comment('订单状态, -1 已关闭 0 待支付 1 支付成功 2 已发货 3 退款处理  4 已完成');
            $table->tinyInteger('payment')->default(1)->comment('支付方式 1储值 2微信');

            $table->integer('create_time')->default(0)->comment('创建时间');
            $table->integer('update_time')->default(0)->comment('更新时间');

            $table->comment('订单表');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('order');
    }
}
