<?php

namespace App\Http\Controllers;

use App\Models\Task;
use App\Models\User;
use Illuminate\Http\Request;

class MainController extends Controller
{
    public function users()
    {
        $users = User::all();

        return response()->json($users);
    }

    public function login(Request $request)
    {
        $email = trim($request->email);
        $password = trim($request->password);
        $password = sha1(md5(sha1(User::ENCRYPTION_KEY . $password . User::ENCRYPTION_KEY)));
        //dd($password);

        if (!empty($email) && !empty($password)) {

            $user = new User();
            $userVerify = $user->userVerify($email, $password);

            if (empty($userVerify)) {

                return response()->json([
                    'success' => false,
                    'message' => 'Kullanıcı adı veya şifre hatalı',
                    'userid'  => null
                ]);
            }


            return response()->json([
                'success' => true,
                'message' => 'Kullanıcı adı ve şifre doğrulandı',
                'userid'  => $userVerify->USER_ID
            ]);
        }

        return response()->json([
                'success' => false,
                'message' => 'Kullanıcı adı veya şifre boş geçilemez',
                'userid'  => null
        ]);
    }
}
