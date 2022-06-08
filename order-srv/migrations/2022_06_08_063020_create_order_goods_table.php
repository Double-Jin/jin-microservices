<?php

use Hyperf\Database\Schema\Schema;
use Hyperf\Database\Schema\Blueprint;
use Hyperf\Database\Migrations\Migration;

class CreateOrderGoodsTable extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('order_goods', function (Blueprint $table) {

            $table->bigIncrements('id');

            $table->string('order_no',35)->nullable()->comment('订单编号');
            $table->integer('goods_id')->default(0)->comment('商品id');
            $table->string('goods_sn',35)->nullable()->comment('商品编号');
            $table->integer('sku_id')->default(0)->comment('skuid');
            $table->integer('user_id')->default(0)->comment('用户id');
            $table->string('goods_name',35)->nullable()->comment('商品名');
            $table->integer('number')->default(0)->comment('商品个数');

            $table->decimal('goods_tag_price',10,2)->default(0)->comment('吊牌价');
            $table->decimal('goods_real_price',10,2)->default(0)->comment('实际价');
            $table->decimal('goods_discount',10,2)->default(0)->comment('商户折扣');
            $table->decimal('goods_fact_money',10,2)->default(0)->comment('商品实际金额');

            $table->integer('create_time')->default(0)->comment('创建时间');
            $table->integer('update_time')->default(0)->comment('更新时间');

            $table->comment('订单商品表');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('order_goods');
    }
}
