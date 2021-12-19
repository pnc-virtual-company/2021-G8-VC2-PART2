<?php

use App\Http\Controllers\DomainCompanyController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Usercontroller;
use App\Http\Controllers\CompanyController;
use App\Http\Controllers\SkillController;

Route::post('/signup', [UserController::class, "signUp"]);
Route::post('/signup/admin', [UserController::class, "signUpAdmin"]);
Route::post('/signIn/step1', [UserController::class, "signInStep1"]);
Route::post('/signIn/Step2', [UserController::class, "signInStep2"]);

Route::get('/users',[UserController::class, "getUsers"]);

//Route for domain company
Route::get('/domain_companies',[DomainCompanyController::class, "getDomainCompanies"]);
Route::get('/domain_companies/{id}',[DomainCompanyController::class, "showOneDomain"]);

Route::post('/domain_companies',[DomainCompanyController::class, "createDomain"]);
Route::put('/domain_companies/{id}',[DomainCompanyController::class, "updateDomain"]);

//Route for company

Route::get('/companies',[CompanyController::class, "getCompanies"]);
Route::get('/companies/{id}',[CompanyController::class, "showOneCompany"]);

Route::post('/companies',[CompanyController::class, "createCompany"]);
Route::put('/companies/{id}',[CompanyController::class, "updateCompany"]);
Route::delete('/companies/{id}',[CompanyController::class, "destroy"]);

//Route for skill

Route::get('/skills',[SkillController::class, "getSkills"]);
Route::get('/skills/{id}',[SkillController::class, "showOneSkill"]);

Route::post('/skills',[SkillController::class, "createSkill"]);
Route::put('/skills/{id}',[SkillController::class, "updateSkill"]);
Route::delete('/skills/{id}',[SkillController::class, "destroy"]);