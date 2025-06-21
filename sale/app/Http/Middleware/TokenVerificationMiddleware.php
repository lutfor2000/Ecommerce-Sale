<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Helper\JWTToken;

class TokenVerificationMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $token = $request->cookie('token');
        $result = JWTToken::VerifyToken($token);

        if($result == 'unauthorized'){
            return response()->json([
                'status' => 'failed',
                'message' => 'unauthorized Middleware Error'
            ]);
        }else{
            $request->headers->set('email', $result->userEmail);
            $request->headers->set('id', $result->userId);
            return $next($request);
        }

        // $email = $request->session()->get('email','default');
        // $user_id = $request->session()->get('user_id','default');
        // if($email == 'default'){
        //     return redirect('/login');
        // }else{
        //     $request->headers->set('email',$email);
        //     $request->headers->set('id',$user_id);
        //     return $next($request);
        // }
        
       
    } 
}
