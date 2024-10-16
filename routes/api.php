<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\BannerController;
use App\Http\Controllers\API\categoryController;
use App\Http\Controllers\API\brandController;
use App\Http\Controllers\API\organicController;
// use App\Http\Controllers\API\ProductController;
use App\Http\Controllers\ProductController;
use App\Http\Resources\product\ProductCollection;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});


Route::get('banner', [BannerController::class, 'index']);
Route::post('banner', [BannerController::class, 'store']);
Route::get('banner/{id}', [BannerController::class, 'show']);
Route::put('banner/{id}', [BannerController::class, 'update']);
Route::delete('banner/{id}', [BannerController::class, 'destroy']);

Route::get('category', [categoryController::class, 'index']);
Route::post('category', [categoryController::class, 'store']);
Route::get('category/{id}', [categoryController::class, 'show']);
Route::put('category/{id}', [categoryController::class, 'update']);
Route::delete('category/{id}', [categoryController::class, 'destroy']);

Route::get('brand', [brandController::class, 'index']);
Route::post('brand', [brandController::class, 'store']);
Route::get('brand/{id}', [brandController::class, 'show']);
Route::put('brand/{id}', [brandController::class, 'update']);
Route::delete('brand/{id}', [brandController::class, 'destroy']);

Route::get('/', function(){

    return response()->json(['name' => 'friedshop-back-laravel', 'version' => '1.0', 'author' => 'v1p3r75', 'docs' => 'elfriedv16@gmail.com']);
  });
Route::apiResource('/product','ProductController');
Route::group(['prefix'=>'products'],function(){
	Route::apiResource('/{product}/reviews','ReviewController');
});

Route::get('/product', [ProductController::class, 'indexApi'])->name('product.show');
Route::get('/product/{product}', [ProductController::class, 'show'])->name('product.show');
