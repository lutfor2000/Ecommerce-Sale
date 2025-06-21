<?php

namespace App\Http\Controllers;
use Inertia\Inertia;
use Illuminate\Http\Request;
use App\Models\Category;
use Exception;
use Illuminate\Support\Facades\Crypt;

use function Termwind\render;

class CategoryController extends Controller
{   

     public function CategoryPage(Request $request){
                $user_id = $request->header('id');
                $categories = Category::where('user_id',$user_id)->get();
                return Inertia::render('CategoryPage',['categories' => $categories]);
     }   

     public function CategorySavePage(Request $request){
                $category_id = $request->query('id');
                $user_id = $request->header('id');
                $category = Category::where('id',$category_id)->where('user_id',$user_id)->first();
                return Inertia::render('CategorySavePage',['category'=>$category]);
     }

    public function CreateCategory(Request $request){
            $user_id = $request->header('id');

            $request->validate([
                'name' => 'required|unique:categories,name',
            ]);

            Category::create([
                'name' => $request->name,
                'user_id' => $user_id
            ]);

            $data = ['message'=>'Category created successfully','status'=>true,'error'=>''];
            return redirect('/CategoryPage')->with($data);
    }//end Method


    public function CategoryList(Request $request){
            $user_id = $request->header('id');

            $categories = Category::where('user_id',$user_id)->get();
            return $categories;
    }//end Method


    public function CategoryById(Request $request){
        try{
            $user_id = $request->header('id');
            $category =Category::where('id', $request->id)->where('user_id', $user_id)->first();
            return $category;

        }catch(Exception $e){

           return response()->json([
            'status' => 'success',
            'message' =>$e->getMessage(),
           ]);
           
        }
          
    }//End Method

    public function CategoryUpdate(Request $request){
            $user_id = $request->header('id');
            $id = $request->input('id');
            Category::where('id', $id)->where('user_id',$user_id)->update([
                    'name' => $request->input('name')
            ]);

            $data = ['message'=>'Category Updaetd successfully','status'=>true,'error'=>''];
            return redirect('/CategoryPage')->with($data);

    }//End Method

    public function CategoryDelete(Request $request, $id){
            $user_id = $request->header('id');

            Category::where('id',$id)->where('user_id', $user_id)->delete();

            $data = ['message'=>'Category Deleted successfully','status'=>true,'error'=>''];
            return redirect('/CategoryPage')->with($data);
    }


    // public function CategoryPage(){
    //     return inertia::render('CategoryPage');
    // }
}
