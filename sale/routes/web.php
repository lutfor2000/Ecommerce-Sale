<?php
use Inertia\Inertia;
use App\Http\Middleware\SessionAuthenticate;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\InvoiceController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\SaleController;

// Route::get('/', function () {
//     return view('welcome');
// });

//-------Home Page All Route---
Route::get('/', [HomeController::class, 'index'])->name('home');


//--------User Page Route-----------
Route::get('/registration',[UserController::class, 'RegistrationPage'])->name('registration.page');
Route::get('/login',[UserController::class, 'LoginPage'])->name('login.page');
Route::get('/send-otp',[UserController::class, 'SendOTPPage'])->name('sendotp.page');
Route::get('/verify-otp',[UserController::class, 'VerifyOTPPage'])->name('VerifyOTPPage');

//-------User Api Call---------
Route::post('/user-registration', [UserController::class, 'UserRegistration'])->name('user.registration'); 
Route::post('/user-login', [UserController::class, 'UserLogin'])->name('user.login');
Route::post('/send-otp', [UserController::class, 'SendOTPCode'])->name('SendOTPCode');  
Route::post('/verify-otp', [UserController::class, 'VerifyOTP'])->name('VerifyOTP'); 

Route::middleware(SessionAuthenticate::class)->group(function(){
    
    //  //======All User Route===========
    Route::post('/reset-password', [UserController::class, 'ResetPassword']);
    Route::get('/DashboardPage', [UserController::class, 'DashboardPage']);
    Route::get('/user-logout', [UserController::class, 'UserLogout']);
    Route::get('/reset-password',[UserController::class, 'ResetPasswordPage']);
    
    //======All Category Route===========
    Route::post('/create-category', [CategoryController::class, 'CreateCategory'])->name('category.create');
    Route::get('/list-category', [CategoryController::class, 'CategoryList'])->name('category.list');
    Route::get('/CategoryPage', [CategoryController::class, 'CategoryPage'])->name('CategoryPage');
    Route::post('/category-by-id', [CategoryController::class, 'CategoryById']);
    Route::post('/update-category', [CategoryController::class, 'CategoryUpdate'])->name('category.update');
    Route::get('/delete-category/{id}', [CategoryController::class, 'CategoryDelete'])->name('category.delete');

    Route::get('/CategoryPage', [CategoryController::class, 'CategoryPage'])->name('CategoryPage');
    Route::get('/CategorySavePage', [CategoryController::class, 'CategorySavePage'])->name('CategorySavePage');


    //Product All Route==========>
    Route::post('/create-product', [ProductController::class, 'CreateProduct'])->name('CreateProduct');
    Route::get('/list-product', [ProductController::class, 'ProductList'])->name('ProductList');
    Route::post('/product-by-id', [ProductController::class, 'ProductById'])->name('ProductById');
    Route::post('/product-update',[ProductController::class,'productUpdate'])->name('product.update');
    Route::get('/delete-product/{id}', [ProductController::class, 'ProductDelete'])->name('ProductDelete');
    Route::get('/ProductPage', [ProductController::class, 'ProductPage'])->name('product.page');
    Route::get('/ProductSavePage', [ProductController::class, 'ProductSavePage'])->name('ProductSavePage');

    //Customer All Route==========>
    Route::post('/create-customer', [CustomerController::class, 'CreateCustomer'])->name('CreateCustomer');
    Route::get('/list-customer', [CustomerController::class, 'CustomerList'])->name('CustomerList');
    Route::post('/customer-by-id', [CustomerController::class, 'CustomerById'])->name('CustomerById');
    Route::post('/update-customer', [CustomerController::class, 'CustomerUpdate'])->name('CustomerUpdate');
    Route::get('/delete-customer/{id}', [CustomerController::class, 'CustomerDelete'])->name('CustomerDelete');
    Route::get('/CustomerPage', [CustomerController::class, 'CustomerPage'])->name('CustomerPage');
    Route::get('/CustomerSavePage', [CustomerController::class, 'CustomerSavePage'])->name('CustomerSavePage');

    //Invoice all routes
    Route::post('/invoice-create', [InvoiceController::class, 'InvoiceCreate'])->name('InvoiceCreate');
    Route::get('/invoice-list', [InvoiceController::class, 'InvoiceList'])->name('InvoiceList');
    Route::post('/invoice-details', [InvoiceController::class, 'InvoiceDetails'])->name('InvoiceDetails');
    Route::get('/invoice-delete/{id}', [InvoiceController::class, 'InvoiceDelete'])->name('InvoiceDelete');
    Route::get('/InvoiceListPage', [InvoiceController::class, 'InvoiceListPage'])->name('InvoiceListPage');

    //Dashboard Summary
    Route::get('/dashboard-summary', [DashboardController::class, 'DashboardSummary'])->name('DashboardSummary');

    //Sale Controller
    Route::get('/create-sale', [SaleController::class, 'SalePage'])->name('SalePage');

    //Profile--
     Route::get('/ProfilePage', [UserController::class, 'ProfilePage']);
      Route::post('/user-update', [UserController::class, 'UserUpdate']);

});

