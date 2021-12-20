<?php

use App\Http\Controllers\DomainCompanyController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Usercontroller;


Route::post('/signup', [UserController::class, "signUp"]);
Route::post('/signup/admin', [UserController::class, "signUpAdmin"]);
Route::post('/signIn/step1', [UserController::class, "signInStep1"]);
Route::post('/signIn/step2', [UserController::class, "signInStep2"]);

Route::get('/users',[UserController::class, "getUsers"]);

//Route for domain company
Route::get('/domain_companies',[DomainCompanyController::class, "getDomainCompanies"]);
Route::get('/domain_companies/{id}',[DomainCompanyController::class, "showOneDomain"]);

Route::post('/domain_companies',[DomainCompanyController::class, "createDomain"]);
Route::put('/domain_companies/{id}',[DomainCompanyController::class, "updateDomain"]);