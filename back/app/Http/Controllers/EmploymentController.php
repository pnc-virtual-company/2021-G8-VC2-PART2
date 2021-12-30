<?php

namespace App\Http\Controllers;

use App\Models\Employment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class EmploymentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getEmployments()
    {
        return Employment::with(['alumni','company','position'])->get();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function AddNewEmployment(Request $request)
    {
        $request->validate([
            'startJobDate' => 'required',
            'endJobDate' => 'nullable',
        ]);
        $employment = new Employment();
        $employment->startJobDate = $request->startJobDate;
        $employment->alumni_id = $request->alumni_id;
        $employment->workPosition = $request->workPosition;
        $employment->company_id = $request->company_id;
        $employment->endJobDate = $request->endJobDate;
        $employment->save();

        $result = DB::table('employments')
                ->join('companies', 'companies.id', '=', 'employments.company_id')
                ->where('employments.id', '=', $employment->id)
                ->get(['companies.*', 'employments.*']);
        return response()->json(['message'=>'Your Employment have been created', 'data'=>$result ], 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function getOneEmployment($id)
    {
        return Employment::findOrFail($id);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function updateEmployment(Request $request, $id)
    {
        $request->validate([
            'startJobDate' => 'required',
            'endJobDate' => 'nullable',
        ]);
        $employment = Employment::findOrFail($id);
        $employment->startJobDate = $request->startJobDate;
        $employment->endJobDate = $request->endJobDate;
        $employment->alumni_id = $request->alumni_id;
        $employment->workPosition = $request->workPosition;
        $employment->company_id = $request->company_id;
        
        $employment->save();

        $result = DB::table('employments')
                ->join('companies', 'companies.id', '=', 'employments.company_id')
                ->where('employments.id', '=', $employment->id)
                ->get(['companies.*', 'employments.*']);
        return response()->json(['message'=>'Your Employment have been updated', 'data'=>$result], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function removeEmployment($id)
    {
        $isDeleted = Employment::destroy($id);
        if($isDeleted === 1){
            return response()->json(['massage'=>'Your Employment have been deleted'], 200);
        }else{
            return response()->json(['massage'=>'ID already exit'], 404);
        }
    }
}