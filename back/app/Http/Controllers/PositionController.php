<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Position;

class PositionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getWorkPositions()
    {
        $positions = Position::latest()->get();
        
        $cleanPositionList = [];
        foreach($positions as $pos) {
            array_push($cleanPositionList, $pos->position_name);
        }
        
        return $cleanPositionList;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function createWorkPosition(Request $request)
    {
        $request->validate([
            'position_name' => 'required',
        ]);
        $position = new Position();
        $position->position_name = $request->position_name;

        $position->save();
        return response()->json(['message' => 'Position created', 'postion' => $position], 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function getOneWorkPosition($id)
    {
        return Position::findOrFail($id);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function updateWorkPosition(Request $request, $id)
    {
        $request->validate([
            'position_name' => 'required',
        ]);
        $position = Position::findOrFail($id);
        $position->position_name = $request->position_name;

        $position->save();

        return response()->json(['message' => 'Position updated', 'position' => $position], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function deleteWorkPosition($id)
    {
        $position = Position::destroy($id);
        if ($position) {
            return response()->json(['message' => 'Position deleted'], 200);
        } else {
            return response()->json(['message' => 'Cannot delete!!'], 404);
        }
    }
}