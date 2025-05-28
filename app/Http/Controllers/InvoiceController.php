<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Models\Invoice;
use App\Models\Product;
use App\Models\InvoiceProduct;
use Exception;
use Inertia\Inertia;

class InvoiceController extends Controller
{
 
//===============Invoice ListPage Start==============================>
public function InvoiceListPage(Request $request){
            $user_id = $request->header('id');
            $user_id = request()->header('id');
            $list = Invoice::where('user_id', $user_id)
                ->with('customer','invoiceProduct.product')->get();
            return Inertia::render('InvoiceListPage',['list'=>$list]);
}
//===============Invoice ListPage End==============================>

//===============Invoice Create Start==============================>
public function InvoiceCreate(Request $request){
            DB::beginTransaction();
       try{
            $user_id = $request->header('id');
            $data = [
                'user_id' => $user_id,
                'customer_id' => $request->customer_id,
                'total' => $request->total,
                'discount' => $request->discount,
                'vat' => $request->vat,
                'payable' => $request->payable,
            ];

            $invoice = Invoice::create($data);

            $products = $request->input('products');

            foreach($products as $product){
                $existUnit = Product::where('id',$product['id'])->first();

                if(!$existUnit){
                    return response()->json([
                        'status' => 'failed',
                        'message' => "Product with ID {$product['id']} not found"
                    ]);
                }

                if($existUnit->unit < $product['unit']){
                    return response()->json([
                        'status' => 'failed',
                        'message' => "Only {$existUnit->unit} units available in stock for product id {$product['unit']}"
                    ]);
                }

                InvoiceProduct::create([
                    'invoice_id' => $invoice->id,
                    'product_id' => $product['id'],
                    'user_id' => $user_id,
                    'qty' => $product['unit'],
                    'sale_price' => $product['price']
                ]);

                Product::where('id', $product['id'])->update([
                    'unit' => $existUnit->unit - $product['unit']
                ]);


            }//End Foreach--

                DB::commit();
                $data = ['message'=>'Invoice created successfully','status'=>true,'error'=>''];
                return redirect('/InvoiceListPage')->with($data);

       }catch(Exception $e){

        
                DB::rollBack();
                $data = ['message'=>'Something went wrong','status'=>false,'error'=>$e->getMessage()];
                return redirect()->back()->with($data);

       }
}//End Method
//===============Invoice Create End==============================>


//===============Invoice List Start==============================>
public function InvoiceList(Request $request){
                $user_id = $request->header('id');
                $invoice_list = Invoice::with('customer')->where('user_id',$user_id)->get();
                return $invoice_list;
}
//===============Invoice List End==============================>


//===============Invoice Details Start==============================>
public function InvoiceDetails(Request $request){
                $user_id = $request->header('id');

                $customerDetails = Customer::where('user_id',$user_id)->where('id',$request->customer_id)->get();
                $invoiceDetails = Invoice::where('user_id',$user_id)->where('id', $request->invoice_id)->get();
                $invoiceProduct = InvoiceProduct::where('user_id',$user_id)->where('invoice_id',$request->invoice_id)->with('product')->get();

                return [
                    'customer' => $customerDetails,
                    'invoice' => $invoiceDetails,
                    'product' => $invoiceProduct
                ];      

}
//===============Invoice Details End==============================>

//===============Invoice Delete Start==============================>
public function InvoiceDelete(Request $request, $id){

                DB::beginTransaction();

            try{

                $user_id = $request->header('id');

                //--InvoiceProduct Delete
                InvoiceProduct::where('invoice_id',$id)->where('user_id', $user_id)->delete();
                
                //--Invoice Delete
                Invoice::where('id',$id)->where('user_id',$user_id)->delete();

                DB::commit();

                $data = ['message'=>'Invoice deleted successfully','status'=>true,'error'=>''];
                return redirect()->back()->with($data);

            }catch(Exception $e){

                DB::rollBack();

                $data = ['message'=>'Something went wrong','status'=>false,'error'=>$e->getMessage()];
                return redirect()->back()->with($data);


            }
}
//===============Invoice Delete End==============================>

//===============Invoice Delete Start==============================>

//===============Invoice Delete End==============================>


}
