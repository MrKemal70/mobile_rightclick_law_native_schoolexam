<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    protected $table = 'tasks';

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function userAssigned()
    {
        return $this->belongsTo(User::class, 'ASSIGNED_BY_ID', 'USER_ID');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function userResponsible()
    {
        return $this->belongsTo(User::class, 'RESPONSIBLE_USER_ID', 'USER_ID');
    }


}
