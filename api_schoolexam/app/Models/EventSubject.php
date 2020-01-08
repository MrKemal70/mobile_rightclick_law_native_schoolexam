<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class EventSubject extends Model
{
    protected $table = 'event_subjects';

    public function subjectCalled()
    {
        return $this->hasMany(Event::class, 'CONTACT_ID', 'USER_ID');
    }
}
