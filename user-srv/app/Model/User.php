<?php

declare (strict_types=1);

namespace App\Model;

use Hyperf\DbConnection\Model\Model;

class User extends Model
{

    const CREATED_AT = 'create_time';

    const UPDATED_AT = 'update_time';

    protected $dateFormat = 'U';
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'user';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'user_name',
        'user_image',
        'phone',
        'sex',
    ];
    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = ['id' => 'integer'];

    public function bonus()
    {
        return $this->hasMany(UserBonusLog::class, 'user_id', 'id');
    }

    public function stored()
    {
        return $this->hasMany(UserStoredLog::class, 'user_id', 'id');
    }
}