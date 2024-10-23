<?php

namespace App\Http\Resources\Product;

use Illuminate\Http\Resources\Json\ResourceCollection;

class ProductCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return
             $this->collection->transform(function($product) {
                return [
                    'id'=>$product->id,
                    'title' => $product->title,
                    // 'totalPrice' => round((1 - ($product->discount / 100)) * $product->price, 2),
                    // 'rating' => $product->reviews->count() > 0
                        //  ? round($product->reviews->sum('star') / $product->reviews->count(), 2)
                    //     : 'No rating yet',
                    // 'desc' => $product->summary,
                    'description' => $product->description,
                    'price' => $product->price,
                    // 'discount' => $product->discount,
                    'img' => $product->photo,
                    'total_quantity' => $product->stock,
                    // 'size' => $product->size,
                    'status' => $product->status,
                    'reduction' => $product->discount,
                    'is_featured' => $product->is_featured,
                    'categorie_id ' => $product->cat_id,
                    'child_cat_id ' => $product->child_cat_id,
                    'brand_id ' => $product->brand_id,
                    'rating' => $product->product_reviews && $product->product_reviews->count() > 0
                    ? round($product->product_reviews->sum('star') / $product->product_reviews->count(), 2)
                    : "No rating yet",

                ];
            })
        ;
    }
}
