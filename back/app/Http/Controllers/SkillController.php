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
        $skills = Skill::latest()->get();
        $cleanSkills = [];
        foreach($skills as $skill) {
            array_push($cleanSkills, $skill->skill_name);
        }
        return $cleanSkills;
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
