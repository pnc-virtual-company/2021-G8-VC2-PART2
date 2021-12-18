<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Usercontroller;


Route::post('/signup', [UserController::class, "signUp"]);
Route::post('/signup/admin', [UserController::class, "signUpAdmin"]);
Route::post('/signIn/step1', [UserController::class, "signInStep1"]);
Route::post('/signIn/Step2', [UserController::class, "signInStep2"]);

Route::get('/users',[UserController::class, "getUsers"]);
