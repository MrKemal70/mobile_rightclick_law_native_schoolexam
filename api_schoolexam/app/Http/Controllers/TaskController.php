<?php

namespace App\Http\Controllers;

use App\Models\Task;
use Illuminate\Http\Request;

class TaskController extends Controller
{
    public function tasks()
    {
        try{
            $tasks = Task::all();

            $tasksArray = array();

            foreach($tasks as $task)
            {
                $tasksArray[] = [
                    'assigned'         => $task->userAssigned->FULL_NAME,
                    'responsible'      => $task->userResponsible->FULL_NAME,
                    'task_subject'     => $task->TASK_SUBJECT,
                    'task_description' => $task->TASK_DESCRIPTION,
                ];
            }

            return response()->json([
                'success' => true,
                'message' => 'İşlem başarılı.',
                'data'    => $tasksArray
            ]);
        }
        catch (\Exception $e) {

            return response()->json([
                'success'     => false,
                'message'     => 'Üzgünüz! Bir hata oluştu.',
                'err_message' => $e->getMessage(),
                'err_code'    => $e->getCode(),
                'err_line'    => $e->getLine(),
            ]);
        }
    }

    public function getuncompletedtasks(Request $request)
    {
        $userID = $request->userID;
        $tasks = Task::all()->where('RESPONSIBLE_USER_ID', '=', $userID)->where('IS_COMPLETED', '=', '0')->all();

        $tasksArray = array();


        foreach($tasks as $task)
        {
            $tasksArray[] = [
                'is_completed'     => $task->IS_COMPLETED,
                'assigned'         => $task->userAssigned->FULL_NAME,
                'responsible'      => $task->userResponsible->FULL_NAME,
                'task_subject'     => $task->TASK_SUBJECT,
                'task_description' => $task->TASK_DESCRIPTION
            ];
        }

        try {
            $count = count($tasksArray);
        }
        catch (\Exception $e) {
            $count = 0;
        }

        return response()->json([
            'count' => $count,
            'data'  => $tasksArray
        ]);
    }
}
