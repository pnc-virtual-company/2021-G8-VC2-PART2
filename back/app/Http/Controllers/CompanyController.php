<?php

namespace App\Http\Controllers;

use App\Models\Company;
use Illuminate\Http\Request;

class CompanyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getCompanies()
    {
        return Company::with(['domain_company'])->get();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function createCompany(Request $request)
    {
        $request->validate([
            'company_name' => 'required|unique:companies',
            'location' => 'required',
            'logo' => 'nullable|image|mimes:jpg,jpeg,png,gif,jfif,svg|max:1999',
        ]);
        $company = new Company();
        $company ->company_name = $request->company_name;
        $company->location = $request->location;
        $company->logo = $request->file('logo')->hashName();
        $request->file('logo')->store('public/images/logos');
        $company->domain_companies_id = $request->domain_companies_id;

        $company->save();
        return response()->json(['message'=>'Your company have been created', 'data'=>$company ], 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function showOnCompany($id)
    {
        return Company::findOrFail($id);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function updateCompany(Request $request, $id)
    {
        $request->validate([
            'company_name' => 'required',
            'location' => 'required',
            'logo' => 'nullable|image|mimes:jpg,jpeg,png,gif,jfif,svg|max:1999',
        ]);
        $company = Company::findOrFail($id);
        $company ->company_name = $request->company_name;
        $company->location = $request->location;
        $company->logo = $request->file('logo')->hashName();
        $request->file('logo')->store('public/images/logos');
        $company->domain_companies_id = $request->domain_companies_id;

        $company->save();
        return response()->json(['message'=>'Your company have been updated', 'data'=>$company ], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        return  Company::destroy($id);
    }
}
