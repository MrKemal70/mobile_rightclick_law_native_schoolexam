<?php

namespace App\Models;

use App\Models\Call;
use Illuminate\Database\Eloquent\Model;

/**
 * @property int USER_ID
 * Class User
 * @package App\Models
 */
class User extends Model
{
    protected $table = 'users';
    const ENCRYPTION_KEY = 'LK76TQib61ujOzqe3PNLS0uOMt8czKAwit8EYj7nNl3rM78Z4CLDI7eA250EYiT';

    /**,
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function taskAssigned()
    {
        return $this->hasMany(Task::class, 'ASSIGNED_BY_ID', 'USER_ID');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function taskResponsible()
    {
        return $this->hasMany(Task::class, 'RESPONSIBLE_USER_ID', 'USER_ID');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */

    public function callCalled()
    {
        return $this->hasMany(Call::class, 'CONTACT_ID', 'USER_ID');
    }


    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany

     */

    public function callResponsible()
    {
        return $this->hasMany(Call::class, 'RESPONSIBLE_USER_ID', 'USER_ID');
    }


    /**
     * @param $email
     * @param $password
     * @return self|null
     */
    public function userVerify($email, $password)
    {
        return self::query()
                    ->where('email', $email)
                    ->where('password', $password)
                    ->first();
    }
}
