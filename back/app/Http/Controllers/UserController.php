<?php

namespace App\Http\Controllers;
use App\Models\Alumni;
use App\Models\Skill;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Symfony\Component\HttpKernel\Profiler\Profile;
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

                $defaultImg = 'male.jpg';
                if($request->gender == 'female') {
                    $request->$defaultImg = "female.jpg";
                }

                $alumni = Alumni::where('user_id', $user->id)->update([
                    'gender' => $request->gender,
                    'batch' => $request->batch,
                    'major' => $request->major,
                    'phone' => $request->phone,
                    'profile'=>$defaultImg 
                ]);

                $updatedResult = User::join('alumnis', 'users.id', '=', 'alumnis.user_id')
                                ->where('users.id', $user->id)
                                ->get(['users.*', 'alumnis.*']);
                
                return response()->json(['message' => 'Successfully', 'user' => $updatedResult[0]], 201);
            } else if ($user->status === 'validated') {
                if(!Hash::check($request->password, $user->password)){
                    return response()->json(['message' => 'Unauthorized'], 401);
                } else {
                    $alumni = $this->getAUser($user->id);
                    return response()->json(['message' => 'Successfully', 'user' => $alumni], 200);
                }
            }
        }
    }

    /*get all EROs*/
    public function getEroUsers() {
        return User::where('role', "ero")->latest()->get();
    }
    /*get all Alumnis*/
    public function getAlumniUsers() {
        $users = User::join('alumnis', 'users.id', '=', 'alumnis.user_id')
                ->get(['users.*', 'alumnis.*']);
        foreach($users as $user) {
            $skills = DB::table('alumni_skills')
                        ->select('skillName')
                        ->where('alumni_id', '=', $user->id)
                        ->get();
            $cleanSkillList = [];
            foreach($skills as $skill) {
                array_push($cleanSkillList, $skill->skillName);
            }
            $user['skills'] = $cleanSkillList;
            
            $employmentList = DB::table('employments')
                            ->join('companies', 'companies.id', '=', 'employments.company_id')
                            ->where('employments.alumni_id', '=', $user->id)
                            ->get(['employments.*', 'companies.*']);
            
            $user['employments'] = $employmentList;
        }
        return $users;
    }
    public function getAUser($id){
        $user = User::findOrFail($id);

        if($user->role == 'alumni') {
            $user = DB::table('users')
                    ->join('alumnis', 'users.id', '=', 'alumnis.user_id')
                    ->where('users.id', '=', $id)
                    ->get(['users.*', 'alumnis.*'])->first();
            $skills = DB::table('alumni_skills')
                        ->select('skillName')
                        ->where('alumni_skills.alumni_id', '=', $id)
                        ->get();
            $cleanSkillList = [];
            foreach($skills as $skill) {
                array_push($cleanSkillList, $skill->skillName);
            }
            $user->skills = $cleanSkillList;
            
            $employmentList = DB::table('employments')
                            ->join('companies', 'companies.id', '=', 'employments.company_id')
                            ->where('employments.alumni_id', '=', $id)
                            ->get(['employments.*', 'companies.*']);
            
            $user->employments = $employmentList;
        }

        return $user;
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
        
        $alumni = Alumni::where('user_id', $userInfo->id)->get()->first()->update(['phone' => $request->phone]);
        
        return response()->json(['message' => 'Email updated', 'newEmail' => $request->email, 'newPhone' => $request->phone, 'user' => $userInfo], 200);
    }
    /* upload profile alumni*/
    public function profilePost(Request $request, $id)
    {
        $request->validate([
            'profile' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:1999',
        ]);
        $request->profile->store('public/profiles');
        $alumniProfile = $request->profile->hashName();
        Alumni::where('user_id', $id)->get()->first()->update(['profile' => $alumniProfile]);
        
        return response()->json(['message'=>'Your profile have been uploaded',"profile" => $request->profile->hashName()],200);
    }

}