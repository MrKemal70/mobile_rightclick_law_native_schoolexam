<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class EventLocation extends Model
{
    protected $table = 'locations';

    public function eventLocation()
    {
        return $this->hasMany(Event::class, 'EVENT_LOCATION_ID', 'LOCATION_ID');
    }
}
