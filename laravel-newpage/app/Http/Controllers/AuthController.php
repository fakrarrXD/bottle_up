<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
class AuthController extends Controller
{
    //shit
    public function register(Request $req)
    {

        //validate
        $rules=[
            'name'=>'required|string',
            'email'=>'required|string|unique:users',
            'username'=>'required|string',
            'password'=>'required|string|min:6'
        ];
        $validator = Validator::make($req->all(), $rules);
        if($validator->fails()){
            return response()->json($validator->errors(), 400);
        }

        //create new user in user table
        $user = User::create([
            'name'=>$req->name,
            'email'=>$req->email,
            'username'=>$req->username,
            'password'=>Hash::make($req->password)
        ]);
        $token = $user->createToken('Personal Access Token')->plainTextToken;
        $response = ['user'=> $user, 'token'=>$token];
        return response()->json($response, 200);

    }

    public function login(Request $req)
    {
        //validate inputs
        $rules =[
            'email' => 'required',
            'password' => 'required|string'
        ];
        $req->validate($rules);
        //find user email in users table
        $user = User::where('email', $req->email)->first();
        //if user email found
        if($user && Hash::check($req->password, $user->password)){
            $token = $user->createToken('Personal Access Token')->plainTextToken;
            $response=['user'=>$user, 'token'=>$token];
            return response()->json($response, 200);
        }
        $response =['message'=>'Incorrect email or password'];
        return response()->json($response, 400);

    }

    public function index()
    {
        $user = User::all();
        $nondeletedUser = $user->where('is_deleted', 0);
        $data = [
            'status' => 200,
            'user' => $nondeletedUser
        ];
        return response()->json($data, 200);
    }

    public function deletedindex()
    {
        $user = User::all();
        $deletedUser = $user->where('is_deleted', 1);
        $data = [
            'status' => 200,
            'user' => $deletedUser
        ];
        return response()->json($data, 200);
    }


    public function delete($id)
    {
        $user = User::find($id);

        if ($user) {
            $user->is_deleted = 1;
            $user->save();

            $data = [
                'status' => 200,
                'message' => 'User deleted successfully'
            ];
        } else {
            $data = [
                'status' => 404,
                'message' => 'User not found'
            ];
        }

        return response()->json($data, $data['status']);
    }

}
