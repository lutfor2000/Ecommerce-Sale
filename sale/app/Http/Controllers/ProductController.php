<?php

namespace App\Http\Controllers;

use GuzzleHttp\Promise\Create;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Exception;
use App\Models\Category;
use App\Models\Product;

class ProductController extends Controller
{
    public function ProductPage(Request $request){
        $user_id = $request->header('id');
        $products = Product::where('user_id', $user_id)->with('category')->latest()->get();
        return Inertia::render('ProductPage',['products' => $products]);

    }//end Method

    public function ProductSavePage(Request $request){
        $user_id = $request->header('id');
        $product_id = $request->query('id');
        $product = Product::where('id',$product_id)->where('user_id',$user_id)->first();
        
        $categories = Category::where('user_id',$user_id)->get();
        return Inertia::render('ProductSavePage',['product'=>$product,'categories'=>$categories]);

    }
 //===============Product Create Start==============================>
    public function CreateProduct(Request $request){

        try{ //<--error check start
            $user_id = $request->header('id');

            //--Validation Check-----
            $request->validate([
                    'category_id' => 'required',
                    'name' => 'required',
                    'price' => 'required',
                    'unit' => 'required',
                    'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg,webp|max:2048',
            ]);

            $data = [
                    'name' => $request->name,
                    'price' => $request->price,
                    'unit' => $request->unit,
                    'category_id' => $request->category_id,
                    'user_id' => $user_id
            ];

            //Image Upload---
            if($request->hasFile('image')){
                    $image = $request->file('image');
                    $fileName = time().'.'.$image->getClientOriginalExtension();
                    $filePath = 'uploads/products/'.$fileName;
                    $image->move(public_path('uploads/products/'), $fileName);
                    $data['image'] = $filePath;
            }
            
            Product::create($data);

            $data = ['message'=>'Product created successfully','status'=>true,'error'=>''];
            return redirect('/ProductPage')->with($data);
        }
        catch(Exception $e){

             $data = ['message'=>'Product Create Fail','status'=> false,'error'=> ''];
            return redirect('/ProductSavePage')->with($data);

        }//<--error Check


    }//Method End-----
 //===============Product Create End==============================>

    public function ProductList(Request $request){
            $user_id = $request->header('id');
            $products = Product::where('user_id',$user_id)->get();
            return $products;
    }//End Method

    public function ProductById(Request $request){
            $user_id = $request->header('id');
            $product = Product::where('user_id',$user_id)->where('id',$request->id)->get();
            return $product;
    }//End Method

 //===============Product Update Start==============================>
    public function productUpdate(Request $request){
        $user_id = $request->header('id');

        $request->validate([
            'name' => 'required',
            'price' => 'required',
            'unit' => 'required',
            'category_id' => 'required'
        ]);

        $product = Product::where('user_id', $user_id)->findOrFail($request->id);

        $product->name = $request->name;
        $product->price = $request->price;
        $product->unit = $request->unit;
        $product->category_id = $request->category_id;

        if($request->hasFile('image')){
            
            if($product->image && file_exists(public_path($product->image))){
                unlink(public_path($product->image));
            }

            $request->validate([
                'image' => 'image|mimes:jpeg,png,jpg,gif,svg,webp|max:2048'
            ]);

            $image = $request->file('image');

            $fileName = time().'.'.$image->getClientOriginalExtension();
            $filePath = 'uploads/products/'.$fileName;

            $image->move(public_path('uploads/products/'), $fileName);
            $product->image = $filePath;
        }

        $product->save();

        $data = ['message'=>'Product updated successfully','status'=>true,'error'=>''];
        return redirect('/ProductPage')->with($data);

    }//End Method----
 //===============Product Update End==============================>


//===============Product Delete Start==============================>
    public function ProductDelete(Request $request, $id){
            // $user_id = $request->header('id');

            $product = Product::findOrFail($id);

            if($product->image && file_exists(public_path($product->image))){
                unlink(public_path($product->image));
            }

            $product->delete();

            $data = ['message'=>'Product Deleted successfully','status'=>true,'error'=>''];
            return redirect()->back()->with($data);

    }
//===============Product Delete End==============================>


    //===============Product Delete Start==============================>
    //===============Product Delete End==============================>


}
