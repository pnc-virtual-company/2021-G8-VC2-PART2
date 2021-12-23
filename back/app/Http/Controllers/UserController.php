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

        //return the user is invited or validated when email is registered or invited
        if(!$user) {
            return response()->json(['status' => 'Invalid Email'], 401);
        }
        return response()->json(['status' => $user->status]);
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
                return response()->json(['message' => 'Successfully', 'user' => $user]);
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
                return response()->json(['message' => 'Successfully', 'user' => $user]);
            } else if ($user->status === 'validated') {
                if(!Hash::check($request->password, $user->password)){
                    return response()->json(['message' => 'Unauthorized'], 401);
                } else {
                    return response()->json(['message' => 'Successfully', 'user' => $user]);
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
                return response()->json(['message' => 'Successfully', 'user' => $user]);
            } else if ($user->status === 'validated') {
                if(!Hash::check($request->password, $user->password)){
                    return response()->json(['message' => 'Unauthorized'], 401);
                } else {
                    $alumni = DB::table('users')
                    ->join('alumnis', 'users.id', '=', 'alumnis.user_id')
                    ->select('users.*', 'alumnis.*')
                    ->get();
                    return response()->json(['message' => 'Successfully', 'user' => $user]);
                }
            }
        }
    }

    public function getUsers(){
        return User::latest()->get();
    }
}
