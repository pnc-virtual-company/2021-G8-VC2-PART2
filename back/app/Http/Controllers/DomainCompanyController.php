<?php

namespace App\Http\Controllers;

use App\Models\DomainCompany;
use Illuminate\Http\Request;

class DomainCompanyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getDomainCompanies()
    {
            return DomainCompany::latest()->get();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function createDomain(Request $request)
    {
        $request->validate([
            'domain_name' => 'required|unique:domain_companies',
        ]);
        $domain = new DomainCompany();
        $domain->domain_name = $request->domain_name;

        $domain->save();
        return response()->json(['message'=>'Your domain have been created', 'data'=>$domain ], 201);

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function showOneDomain($id)
    {
        return DomainCompany::findOrFail($id);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function updateDomain(Request $request, $id)
    {
        $request->validate([
            'domain_name' => 'required|unique',
        ]);
        $domain = DomainCompany::findOrFail($id);
        $domain->domain_name = $request->domain_name;

        $domain->save();
        return response()->json(['massage'=>'Your Domain have been updated', 'data'=> $domain], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        return  DomainCompany::destroy($id);
    }
}
