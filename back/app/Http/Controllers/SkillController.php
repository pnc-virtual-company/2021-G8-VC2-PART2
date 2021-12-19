<?php

namespace App\Http\Controllers;

use App\Models\Skill;
use Illuminate\Http\Request;

class SkillController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getSkills()
    {
        return Skill::latest()->get();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function createSkill(Request $request)
    {
        $request->validate([
            'skill_name' => 'required|unique:skills',
        ]);
        $skill = new Skill();
        $skill->skill_name = $request->skill_name;

        $skill->save();
        return response()->json(['message'=>'Your skill have been created', 'data'=>$skill ], 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function showOneSkill($id)
    {
        return Skill::findOrFail($id);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function updateSkill(Request $request, $id)
    {
        $request->validate([
            'skill_name' => 'required',
        ]);
        $skill = Skill::findOrFail($id);
        $skill->skill_name = $request->skill_name;

        $skill->save();
        return response()->json(['massage'=>'Your skill have been updated', 'data'=> $skill], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        return  Skill::destroy($id);
    }
}
