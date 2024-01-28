<?php

use App\Http\Controllers\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::post('/auth/register', [AuthController::class, 'register']);
Route::post('/auth/login', [AuthController::class, 'login']);
Route::get('/auth/user', [AuthController::class, 'index']);
Route::get('auth/deleteduser', [AuthController::class, 'deletedindex']);
Route::post('/auth/delete/{id}', [AuthController::class, 'delete']);


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
