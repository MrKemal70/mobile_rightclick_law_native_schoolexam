<?php

namespace App\Http\Controllers;

use App\Models\Event;
use Illuminate\Http\Request;

class EventController extends Controller
{
    public function getEvents(Request $request)
    {
        $userID = $request->userID;
        $events = Event::all()->where('WHO_ID', '=', $userID)->where('IS_COMPLETED', '=', '0')->all();

        $eventsArray = [];
        foreach($events as $event)
        {
            $loc     = $event->eventLocation;
            $locname = '';

            if (isset($loc))
                $locname = $loc->LOCATION_NAME;

            $eventsArray[] = [
                'is_completed'     => $event->IS_COMPLETED,
                'subject'          => $event->subjectCalled->SUBJECT,
                'location'         => $locname,
                'begin_date'       => $event->BEGIN_DATE,
                'end_date'         => $event->END_DATE,
                'who_id'           => $event->userCalled->FULL_NAME,
            ];
        }

        try {
            $count = count($eventsArray);
        }
        catch (\Exception $e) {
            $count = 0;
        }

        return response()->json([
            'count'   => $count,
            'success' => true,
            'message' => 'İşlem başarılı.',
            'data'    => $eventsArray
        ]);

    }
}
