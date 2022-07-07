<?php

declare (strict_types=1);
namespace App\Model;

use Hyperf\DbConnection\Model\Model;
class Order extends Model
{
    const CREATED_AT = 'create_time';
    const UPDATED_AT = 'update_time';

    protected ?string $dateFormat = 'U';
    /**
     * The table associated with the model.
     *
     */
    protected ?string $table = 'order';
    /**
     * The attributes that are mass assignable.
     *
     */
    protected array $fillable = ['order_no', 'user_id', 'coupon_id', 'order_money', 'order_discount', 'order_fact_money', 'consume_number', 'order_status', 'payment'];
    /**
     * The attributes that should be cast to native types.
     *
     */
    protected array $casts = ['id' => 'integer'];

    public function orderGoods()
    {
        return $this->hasMany(OrderGoods::class, 'order_no', 'order_no');
    }
}