<?php

namespace App\Http\Controllers;

use App\Models\Alumni_skill;
use Illuminate\Http\Request;

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
            'skill_id' => 'required',
        ]);

        $alumniskill = new Alumni_skill();
        $alumniskill->alumni_id = $request->alumni_id;
        $alumniskill->skill_id = $request->skill_id;

        $alumniskill->save();

        return response()->json(['message' => 'Alumni skill',  'alumniSKill' => Alumni_skill::with(['alumni', 'skill'])->latest()->first()], 201);
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function deleteSlumniSkill(Request $request)
    {
        $alumniSkill = Alumni_skill::select('id')->where('alumni_id', '=', $request->alumni_id)->where('skill_id', '=', $request->skill_id)->get();
        return Alumni_skill::destroy($alumniSkill[0]->id);
    }
}