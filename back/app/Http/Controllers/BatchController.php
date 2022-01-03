<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Batch;
class BatchController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getAllBatchNames()
    {
        $batches = Batch::latest()->get();
        $cleanBatches = [];
        foreach($batches as $batch) {
            array_push($cleanBatches, $batch->name);
        }
        return $cleanBatches;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function addANewBatch(Request $request)
    {
        $request->validate([
            'name' => 'required',
        ]);
        $batch = new Batch();
        $batch->name = $request->name;
        $batch->save();
        return response()->json(['message' => 'Batch created', 'batch' => $batch], 201);
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function removeOneBatchNames($id)
    {
        //
        $idDeleted = Batch::destroy($id);
        if ($idDeleted) {
            return response()->json(['message' => 'Batch deleted'], 200);
        } else {
            return response()->json(['message' => 'Cannot delete!!'], 404);
        }
    }
    
}