<?php

use App\Http\Controllers\CallController;
use App\Http\Controllers\DocumentController;
use App\Http\Controllers\EventController;
use Illuminate\Http\Request;
use \App\Http\Controllers\MainController;
use \App\Http\Controllers\TaskController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/users', [MainController::class, 'users']);
Route::post('/login', [MainController::class, 'login']);
Route::get('/tasks', [TaskController::class, 'tasks']);
Route::post('/uncompletedtasks', [TaskController::class, 'getuncompletedtasks']);
Route::post('/uncompletedcalls', [CallController::class, 'getcalls']);
Route::get('/documents', [DocumentController::class, 'getDocumentLength']);
Route::post('/events', [EventController::class, 'getEvents']);
Route::post('/completetasks', [TaskController::class, 'completeTask']);
