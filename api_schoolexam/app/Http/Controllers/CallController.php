<?php

namespace App\Http\Controllers;

//use App\Call;
use App\Models\Call;
use Illuminate\Http\Request;

class CallController extends Controller
{
    public function getcalls(Request $request)
    {
        $userID = $request->userID;
        $calls = Call::all()->where('RESPONSIBLE_USER_ID', '=', $userID)->where('IS_CALL_MADE', '=', '0')->all();

        $callsArray = array();

        foreach($calls as $call)
        {
            $callsArray[] = [
                'is_call_made'     => $call->IS_CALL_MADE,
                'subject'          => $call->SUBJECT,
                'responsible'      => $call->userResponsible->FULL_NAME,
                'called'           => $call->userCalled->FULL_NAME,
            ];
        }

        try {
            $count = count($callsArray);
        }
        catch (\Exception $e) {
            $count = 0;
        }

        return response()->json([
            'count'   => $count,
            'success' => true,
            'message' => 'İşlem başarılı.',
            'data'    => $callsArray
        ]);

    }
}
