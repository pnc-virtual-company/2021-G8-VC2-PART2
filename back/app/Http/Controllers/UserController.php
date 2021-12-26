<?php

namespace App\Http\Controllers;
use App\Models\Alumni;
use App\Models\Skill;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Symfony\Contracts\Service\Attribute\Required;

class Usercontroller extends Controller
{
    // Register
    public function signUp(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'role' => 'required'
        ]);
        $user = new User();
        $user->email = $request->email;
        $user->role = $request->role;
        if($request->role === 'admin'){
            $user->password = bcrypt($request->password);
            $user->status = 'validated';
            $user->save();

        } else if($request->role === 'ero'){
            $user->status = 'invited';
            $user->save();

        } else if($request->role === 'alumni') {
            $user->status = 'invited';
            $user->save();

            $alumni = new Alumni();
            $alumni->user_id = $user->id;
            $alumni->save();
        }
        return response()->json([
            'message' => 'Register',
            'user' => $user,
        ]);
    }
    // sign in step1
    public function signInStep1($email)
    {
        $user = User::where('email', $email)->get()->first();
        if(!$user) {
            return response()->json(['status' => 'Invalid Email'], 401);
        }
        return response()->json(['status' => $user->status, 'role' => $user->role]);
    }

    // sign in step2
    public function signInStep2(Request $request)
    {
        $user = User::where('email', $request->email)->get()->first();

        if(!$user){
            return response()->json(['message' => 'Unauthorized'], 401);
        }

        // admin sign in
        if($user->role === 'admin') {
            if(!Hash::check($request->password, $user->password)){
                return response()->json(['message' => 'Unauthorized'], 401);
            } else {
                return response()->json(['message' => 'Successfully', 'user' => $user], 201);
            }
        }

        // ero sign in
        if($user->role === 'ero') {
            if($user->status === 'invited') {
                $user->firstname = $request->firstname;
                $user->lastname = $request->lastname;
                $user->password = bcrypt($request->password);
                $user->status = 'validated';
                $user->save();
                return response()->json(['message' => 'Successfully', 'user' => $user], 201);
            } else if ($user->status === 'validated') {
                if(!Hash::check($request->password, $user->password)){
                    return response()->json(['message' => 'Unauthorized'], 401);
                } else {
                    return response()->json(['message' => 'Successfully', 'user' => $user], 200);
                }
            }
        }

        // alumni sign in
        if($user->role === 'alumni') {
            if($user->status === 'invited') {
                $user->firstname = $request->firstname;
                $user->lastname = $request->lastname;
                $user->password = bcrypt($request->password);
                $user->status = 'validated';
                $user->save();
                $alumni = Alumni::where('user_id', $user->id)->update([
                    'gender' => $request->gender,
                    'batch' => $request->batch,
                    'major' => $request->major,
                    'phone' => $request->phone,
                ]);

                $updatedResult = User::join('alumnis', 'users.id', '=', 'alumnis.user_id')
                                ->where('users.id', $user->id)
                                ->get(['users.*', 'alumnis.*']);
                
                return response()->json(['message' => 'Successfully', 'user' => $updatedResult[0]], 201);
            } else if ($user->status === 'validated') {
                if(!Hash::check($request->password, $user->password)){
                    return response()->json(['message' => 'Unauthorized'], 401);
                } else {
                    $alumni = User::join('alumnis', 'users.id', '=', 'alumnis.user_id')
                    ->where('users.id', $user->id)
                    ->get(['users.*', 'alumnis.*']);
                    return response()->json(['message' => 'Successfully', 'user' => $alumni[0]], 200);
                }
            }
        }
    }

    public function getUsers(){
        return User::latest()->get();
    }
    
    public function getAUser($id){
        $user = User::findOrFail($id);
        if($user->role === 'alumni') {
            $alumni = User::join('alumnis', 'users.id', '=', 'alumnis.user_id')
                    ->where('users.id', $id)
                    ->get(['users.*', 'alumnis.*']);
            return response()->json(['user' => $alumni[0]]);
        }
        return response()->json(['user' => $user]);
    }
    
    // update alumni information (email,phone number)
    public function updateAlumniInfo(Request $request, $id)
    {
        $request->validate([
            'email' => 'required',
            'phone' => 'required',
        ]);
        $userInfo = User::findOrFail($id);
        $userInfo->email = $request->email;
        $userInfo->save();
        
        $alumniInfo = Alumni::where('user_id', $userInfo->id)->get()->first()->update(['phone' => $request->phone]);
        
        $updatedResult = DB::table('users')
        ->join('alumnis', 'users.id', '=', 'alumnis.user_id')
        ->select('users.*', 'alumnis.*')
        ->where('users.id', '=', $userInfo->id)
        ->get();
        
        return response()->json(['message' => 'Email updated', 'alumniIfo' => $updatedResult], 200);
    }
}