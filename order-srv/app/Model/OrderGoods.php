<?php

declare (strict_types=1);
namespace App\Model;

use Hyperf\DbConnection\Model\Model;
class OrderGoods extends Model
{
    const CREATED_AT = 'create_time';
    const UPDATED_AT = 'update_time';

    protected ?string $dateFormat = 'U';
    /**
     * The table associated with the model.
     *
     */
    protected ?string $table = 'order_goods';
    /**
     * The attributes that are mass assignable.
     *
     */
    protected array $fillable = ['order_no', 'goods_id', 'goods_sn', 'sku_id', 'user_id', 'goods_name', 'number', 'goods_tag_price', 'goods_real_price', 'goods_discount', 'goods_fact_money'];
    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected array $casts = ['id' => 'integer'];
}