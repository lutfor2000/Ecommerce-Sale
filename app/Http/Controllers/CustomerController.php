<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Customer;
use Inertia\Inertia;

class CustomerController extends Controller
{
//=====================CustomerPage Start====================> 
     public function CustomerPage(Request $request){
           $user_id = $request->header('id');
           $customers = Customer::where('user_id',$user_id)->latest()->get();

           return Inertia::render('CustomerPage',['customers'=>$customers]);
     }     
//=====================CustomerPage End====================>    


    public function CustomerSavePage(Request $request){
           $user_id = $request->header('id');
           $id = $request->query('id');

           $customer = Customer::where('id',$id)->where('user_id',$user_id)->first();

           return Inertia::render('CustomerSavePage',['customer'=> $customer]);
    }

//=====================Create Customer Start====================>    
    public function CreateCustomer(Request $request){
            $user_id = $request->header('id');

            $request->validate([
                    'name' => 'required',
                    'email' => 'required|email|unique:customers,email',
                    'mobile' => 'required',
            ]);

            Customer::create([
                    'name' => $request->input('name'),
                    'email' => $request->input('email'),
                    'mobile' => $request->input('mobile'),
                    'user_id' => $user_id
            ]);

            $data = ['message'=>'Customer created successfully','status'=>true,'error'=>''];
            return redirect('/CustomerPage')->with($data);


    }
//=====================Create Customer End====================>



//=====================Customer List Start====================>  
public function CustomerList(Request $request){
        $user_id = $request->header('id');
        $customers = Customer::where('user_id',$user_id)->get();
        return $customers;
}
//=====================Customer List End====================>

//=====================Customer ById Start====================>  
public function CustomerById(Request $request){
        $user_id = $request->header('id');
        $customer = Customer::where('id',$request->id)->get();
        return $customer;
}
//=====================Customer ById End====================>

//=====================Customer Update Start====================>
public function CustomerUpdate(Request $request){
        $user_id = $request->header('id');

        Customer::where('id',$request->id)->where('user_id',$user_id)->update([
                'name' => $request->input('name'),
                'email' => $request->input('email'),
                'mobile' => $request->input('mobile'),
        ]);

        $data = ['message'=>'Customer Update successfully','status'=>true,'error'=>''];
        return redirect('/CustomerPage')->with($data);
}
//=====================Customer Update End====================>


//=====================Customer Delete Start====================>
public function CustomerDelete(Request $request, $id){
       $user_id = $request->header('id');
       Customer::where('user_id',$user_id)->where('id',$id)->delete();
       
      $data=['message'=>'Product Delete Successful','status'=>true,'error'=> ''];
      return redirect('/CustomerPage')->with($data);

}
//=====================Customer Delete End====================>

//=====================Customer Update Start====================>
//=====================Customer Update End====================>

}
