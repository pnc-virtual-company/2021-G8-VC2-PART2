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
        return Company::latest()->get();
    }
    public function getAllCompanies()
    {
        return Company::latest()->get();
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
            'company_name' => 'required',
            'location' => 'required',
            'domain_company' => 'required',
            'logo' => 'nullable|image|mimes:jpg,jpeg,png,gif,jfif,svg|max:1999',
            'domain_company'=>'required'
        ]);
        $company = new Company();
        $company ->company_name = $request->company_name;
        $company->location = $request->location;
        $company->logo = $request->file('logo')->hashName();
        $request->file('logo')->store('public/profiles');
        $company->domain_company = $request->domain_company;

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
            'domain_company' => 'required'
        ]);
        $company = Company::findOrFail($id);
        $company ->company_name = $request->company_name;
        $company->location = $request->location;
        $company->domain_company = $request->domain_company;
        $company->save();
        return response()->json(['message'=>'Your company have been updated', 'data'=>$company ], 200);
    }
    //update logo of company
    public function updateLogo(Request $request, $id)
    {
        $request->validate([
            'logo' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:1999',
        ]);
        $request->logo->store('public/profiles');
        $companyLogo = $request->logo->hashName();
        Company::where('id',$id)->get()->first()->update(['logo' => $companyLogo]);

        return response()->json(['message'=>'Your company have been updated',"companyLogo" => $request->logo->hashName()],200);
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
