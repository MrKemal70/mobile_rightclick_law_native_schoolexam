<?php

namespace App\Models;

use App\Models\User;
use Illuminate\Database\Eloquent\Model;


class Call extends Model
{
    protected $table = 'calls_to_make';

    public function userCalled()
    {
        return $this->belongsTo(User::class, 'CONTACT_ID', 'USER_ID');
    }

    public function userResponsible()
    {
        return $this->belongsTo(User::class, 'RESPONSIBLE_USER_ID', 'USER_ID');
    }

}
