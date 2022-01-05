<?php

use App\Http\Controllers\AlumniSkillController;
use App\Http\Controllers\DomainCompanyController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\CompanyController;
use App\Http\Controllers\SkillController;
use App\Http\Controllers\BatchController;
use App\Http\Controllers\EmploymentController;

Route::post('/invite', [UserController::class, "signUp"]);
Route::get('/signin/{email}', [UserController::class, "signInStep1"]);
Route::post('/signin/password', [UserController::class, "signInStep2"]);
Route::post('/signin/completeinfo', [UserController::class, "signInStep2"]);

Route::get('/users/ero',[UserController::class, "getEroUsers"]);
Route::get('/users/alumni',[UserController::class, "getAlumniUsers"]);
Route::get('/users/{id}',[UserController::class, "getAUser"]);
Route::get('/users/email/all',[UserController::class, "getUserEmails"]);

Route::delete('/users/{id}',[UserController::class, "removeUser"]);
// update alumni information
Route::put('/users/updateinfo/{id}',[UserController::class, "updateAlumniInfo"]);
// post profile alumni
Route::put('users/updateprofiles/{id}',[Usercontroller::class,"profilePost"]);
//Route for domain company
Route::get('/domain_companies',[DomainCompanyController::class, "getDomainCompanies"]);
Route::get('/domain_companies/{id}',[DomainCompanyController::class, "showOneDomain"]);

Route::post('/domain_companies',[DomainCompanyController::class, "createDomain"]);
Route::put('/domain_companies/{id}',[DomainCompanyController::class, "updateDomain"]);

//Route for company

Route::get('/companies',[CompanyController::class, "getCompanies"]);
Route::get('/allcompanies',[CompanyController::class, "getAllCompanies"]);
Route::get('/companies/{id}',[CompanyController::class, "showOneCompany"]);

Route::post('/companies',[CompanyController::class, "createCompany"]);
Route::put('/companies/{id}',[CompanyController::class, "updateCompany"]);
Route::put('/companies/updateLogos/{id}',[CompanyController::class, "updateLogo"]);
Route::delete('/companies/{id}',[CompanyController::class, "destroy"]);

//Route for skill

Route::get('/skills',[SkillController::class, "getSkills"]);
Route::delete('/skills/{id}',[SkillController::class, "destroy"]);
//alumni skill
Route::post('/alumniskills/add', [AlumniSkillController::class ,'createAlumniSkill']);
Route::post('/alumniskills/remove', [AlumniSkillController::class ,'deleteAlumniSkill']);


// Route for batch
Route::get('/batches',[BatchController::class, "getAllBatchNames"]);

Route::post('/batches',[BatchController::class, "addANewBatch"]);
Route::delete('/batches/{id}',[BatchController::class, "removeOneBatchNames"]);

//Route for employment

Route::get('/employments',[EmploymentController::class, "getEmployments"]);
Route::get('/employments/{id}',[EmploymentController::class, "getOneEmployment"]);

Route::post('/employments',[EmploymentController::class, "AddNewEmployment"]);
Route::put('/employments/{id}',[EmploymentController::class, "updateEmployment"]);
Route::delete('/employments/{id}',[EmploymentController::class, "removeEmployment"]);