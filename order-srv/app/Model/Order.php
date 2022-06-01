<?php

declare (strict_types=1);

namespace App\Model;

use Hyperf\DbConnection\Model\Model;

class Order extends Model
{

    const CREATED_AT = 'create_time';

    const UPDATED_AT = 'update_time';

    protected $dateFormat = 'U';
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'order';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'order_no',
        'user_id',
        'coupon_id',
        'order_money',
        'order_discount',
        'order_fact_money',
        'consume_number',
        'order_status',
        'payment',
    ];
    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = ['id' => 'integer'];

    public function orderGoods()
    {
        return $this->hasMany(OrderGoods::class, 'order_no', 'order_no');
    }


}