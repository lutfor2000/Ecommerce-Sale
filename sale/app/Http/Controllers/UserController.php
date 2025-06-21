<?php

namespace App\Http\Controllers;
use Inertia\Inertia;
use Illuminate\Http\Request;
use App\Models\User;
use Exception;
use App\Helper\JWTToken;
use App\Mail\OTPMail;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Hash;
use App\Models\Product;
use App\Models\Category;
use App\Models\Customer;
use App\Models\Invoice;

class UserController extends Controller
{
   public function RegistrationPage(Request $request){
        return Inertia::render('RegistrationPage');
    }

   public function LoginPage(){
        return Inertia::render('LoginPage');
    }

   public function SendOTPPage(){
        return Inertia::render('SendOTPPage');
    }

   public function VerifyOTPPage(){
        return Inertia::render('VerifyOTPPage');
    }


   public function ResetPasswordPage(){
        return Inertia::render('ResetPasswordPage');
    }

    

   public function UserRegistration(Request $request){
       try {

            $request->validate([
                'name' => 'required',
                'email' => 'required|email|unique:users,email',
                'password' => 'required',
                'mobile' => 'required',
            ]);

            User::create([
                'name' => $request->input('name'),
                'email' => $request->input('email'),
                'password' => Hash::make($request->password),
                'mobile' => $request->input('mobile'),
            ]);

            
                $data = ['message'=>'User created successfully','status'=>true,'error'=>''];
                return redirect()->route('login.page')->with($data);
            

        } catch (Exception $e) {
        
                $data = ['message'=>'Something went wrong','status'=>false,'error'=>''];
                return redirect('/registration')->with($data);
        }

    }//---end method



   public function UserLogin(Request $request){

        $user = User::where('email', $request->input('email'))->first();

        if ($user && Hash::check($request->input('password'), $user->password)) {
            // Auth success
            $request->session()->put('email', $user->email);
            $request->session()->put('user_id', $user->id);

            $data = ['message'=>'User login successfully','status'=>true,'error'=>''];
            return redirect('/DashboardPage')->with($data);

        } else {
            $data = ['message'=>'Login Failed','status'=>false,'error'=>''];
            return redirect('/login')->with($data);
        }

   }//----End Method----



   public function DashboardPage(Request $request){
        $user_id = request()->header('id');
        
        $product = Product::where('user_id', $user_id)->count();
        $category = Category::where('user_id', $user_id)->count();
        $customer = Customer::where('user_id', $user_id)->count();
        $invoice = Invoice::where('user_id', $user_id)->count();
        $total = Invoice::where('user_id', $user_id)->sum('total');
        $vat = Invoice::where('user_id', $user_id)->sum('vat');
        $payable = Invoice::where('user_id', $user_id)->sum('payable');
        $discount = Invoice::where('user_id', $user_id)->sum('discount');

        $data = [
            'product' => $product,
            'category' => $category,
            'customer' => $customer,
            'invoice' => $invoice,
            'total' => round($total),
            'vat' => round($vat),
            'payable' => round($payable),
            'discount' => $discount
        ];

        return Inertia::render('DashboardPage',['list'=>$data]);
   }//----End Method----


   
   public function UserLogout(Request $request){
        $request->session()->forget('email');
        $request->session()->forget('user_id');

        $data = ['message'=>'User logout successfully','status'=>true,'error'=>''];
        return redirect('/login')->with($data);
   }//----End Method----



   public function SendOTPCode(Request $request){
        $email = $request->input('email');
        $otp = rand(1000,9999);
        $count = User::where('email',$email)->count();


        if ($count == 1) {

             Mail::to($email)->send(new OTPMail($otp));
             User::where('email', $email)->update(['otp' => $otp]);

             $request->session()->put('email', $email);
             $data = ["message"=>"4 Digit {$otp} OTP send successfully","status"=>true,"error"=>''];

             return redirect('/verify-otp')->with($data);

        }else{
            $data = ['message'=>'unauthorized','status'=>false,'error'=>''];
            return redirect('/registration')->with($data);
        }
   }//----End Method----



   public function VerifyOTP(Request $request){
        
        $email = $request->session()->get('email');
        $otp = $request->input('otp');
        
        $count = User::where('email', $email)->where('otp', $otp)->count();

        if($count == 1){
             User::where('email', $email)->update(['otp' => 0]);
            //  $token = JWTToken::CreateTokenForSetPassword($request->input('email'));
            $request->session()->put('otp_verify','yes');

            $data = ["message"=>"OTP verification successfully","status"=>true,"error"=>''];
            return redirect('/reset-password')->with($data);

        }else{

            $data = ['message'=> 'unauthorized','status'=>false, 'error'=>''];
            return redirect('/login')->with($data);

        }
   }//----End Method----



   public function ResetPassword(Request $request){
        try{
            
            $email = $request->session()->get('email','default');
            
            $password = Hash::make($request->password);
           
            $otp_verify = $request->session()->get('otp_verify','default');

            if($otp_verify === 'yes'){
                User::where('email', $email)->update(['password' => $password]);
                $request->session()->flush();

                $data = ['message'=> 'Password reset successfully','status'=>true, 'error'=>'' ];
                return redirect('/login')->with($data);

            }
            else{

                $data = ['message'=> 'Request fail','status'=>false, 'error'=>'' ];
                return redirect('/reset-password')->with($data);
            }

        }catch(Exception $e){
                $data = ['message'=> $e->getMessage(),'status'=>false, 'error'=>'' ];
                return redirect('/reset-password')->with($data);
        }
   }//----End Method----

   public function ProfilePage(Request $request){
        $email = $request->header('email');
        $user = User::where('email',$email)->first();

        return inertia::render('ProfilePage',['user' => $user]);
   }

   public function UserUpdate(Request $request){
        $email = request()->header('email');
        User::where('email', $email)->update([
            'name' => $request->input('name'),
            'email'=> $request->input('email'),
            'mobile'=> $request->input('mobile'),
        ]);

        $data = ['message'=> 'Profile update successfully','status'=>true, 'error'=>'' ];
        return redirect()->back()->with($data);
   }
   


}


