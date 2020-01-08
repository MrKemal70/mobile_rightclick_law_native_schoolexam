<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Event extends Model
{
    protected $table = 'events';

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */


    public function userCalled()
    {
        return $this->belongsTo(User::class, 'WHO_ID', 'USER_ID');
    }

    public function subjectCalled()
    {
        return $this->belongsTo(EventSubject::class, 'SUBJECT_ID', 'SUBJECT_ID');
    }

    public function eventLocation()
    {
        return $this->belongsTo(EventLocation::class, 'EVENT_LOCATION_ID', 'LOCATION_ID');
    }
}
