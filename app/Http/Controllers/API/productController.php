<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests\Products\CreateProductRequest;
use App\Http\Requests\Products\EditProductRequest;
use App\Models\Product;
use App\Models\ProductsCommands;
use App\Models\User;
use Illuminate\Auth\Access\Response;

class productController extends Controller
{
    // public function __construct(Request $request) {

    //     $this->authorizeResource(Product::class);
    // }

    public function index() {
        if (!$all = Product::all()) {

            return ApiResponse::error('Error while fetching products');
        }

        return ApiResponse::success('List of products', $all->toArray());

    }
    public function show($id = null) {

        if($product = Product::find($id)) {

            return ApiResponse::success('Product Found', $product->toArray());
        }

        return ApiResponse::error('Product Not Found', [], 404);
    }
    public function types($type) {
        switch ($type) {

            case 'random': {

                return ApiResponse::success(data: Product::all()->random(1)->toArray());
            }
            case 'best-sellers': {

                $sales = new Product();
                return ApiResponse::success(
                    data: $sales->with('products')
                        ->select("product_id")
                        ->selectRaw("sum(quantity) as total_quantity")
                        ->groupBy("product_id")
                        ->orderBy("total_quantity", "DESC")
                        ->limit(5)
                        ->get()
                        ->toArray()
                );
            }

            default: return abort(404);
        }

    }
    public function create(ProductController $request) {

        $data = $request->all();

        // $validation = validator($data, Product::rules());

        // if($validation->fails()) {

        //     return ApiResponse::error('Validation failed', $validation->errors()->all() , 400);
        // }

        $imageName = $data['name'] . '-' . time() . '.' . $request->file('img')->extension();

        if($request->file('img')->storeAs('public', $imageName)) {

            $data['img'] = $imageName;

            if (! Product::create($data)) {

                return ApiResponse::error('Product creation failed', [], 500);

            }
            return ApiResponse::success('Product created successfully', $data, 201);
        }

        return ApiResponse::error('Image Upload Error', [], 403);
    }
    public function edit(Request $request) {

        $data = $request->except('id', '_method');

        if ($db_product = Product::find($request->input('id'))) {

            if ($request->input('imageEdited') == "true") {

                $imageName = $data['name'] . '-' . time() . '.' . $request->file('img')->extension();

                if($request->file('img')->storeAs('public', $imageName)) {

                    $data['img'] = $imageName;

                }
            } else unset($data['img']);

            if(! $db_product->update($data)) {

                return ApiResponse::error('Product edit failed', [], );
            }

            return ApiResponse::success('Product edited successfully', $data);

        }

        return ApiResponse::error('Product not found', [$data], 404);

    }

    public function search($query) {

        if ($result = Product::where('name','LIKE', "%$query%")->get()) {

            return ApiResponse::success('Product found', $result->toArray());
        }

        return ApiResponse::error(message: 'Error searching', code: 500);
    }

    public function destroy(Request $request) {

        $id = $request->input('id');

        if (! empty($id)) {

            if (Product::destroy($id)) {

                return ApiResponse::success('Product deleted successfully');
            }

            return ApiResponse::error('Delete failed', []);
        }

        return ApiResponse::error('You must specify a product identifier');

    }

}
