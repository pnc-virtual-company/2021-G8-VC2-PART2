<?php

namespace App\Http\Controllers;

use App\Models\Alumni_skill;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AlumniSkillController extends Controller
{
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function createAlumniSKill(Request $request)
    {
        $request->validate([
            'alumni_id' => 'required',
            'skillName' => 'required',
        ]);
        $skills = $request->skillName;
        foreach($skills as $skill) {
            $alumniskill = new Alumni_skill();
            $alumniskill->alumni_id = $request->alumni_id;
            $alumniskill->skillName= $skill;
    
            $alumniskill->save();
        };

        return response()->json(['message' => 'Alumni skill',  'alumniSKill' => Alumni_skill::with(['alumni'])->latest()->first()], 201);
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function deleteAlumniSkill(Request $request)
    {
        $alumniSkillId = Alumni_skill::select('id')->where('alumni_id', '=', $request->alumni_id)->where('skillName', '=', $request->skillName)->get();
        return Alumni_skill::destroy($alumniSkillId[0]->id);
    }
}
