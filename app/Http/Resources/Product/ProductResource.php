<?php

namespace App\Http\Resources\Product;

use Illuminate\Http\Resources\Json\JsonResource;

class ProductResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'title' => $this->title,
            'price' => $this->price,
            'slug ' => $this->slug,
            'summary' => $this->summary,
            'description' => $this->description,
            'photo' => $this->photo,
            'stock' => $this->stock,
            // 'size' => $this->size,
            'status' => $this->status,
            'discount' => $this->discount,
            'is_featured' => $this->is_featured,
            'cat_id ' => $this->cat_id,
            'child_cat_id ' => $this->child_cat_id,
            'brand_id ' => $this->brand_id,
            'rating' => $this->product_reviews && $this->product_reviews->count() > 0
            ? round($this->product_reviews->sum('star') / $this->product_reviews->count(), 2)
            : "No rating yet",
        ];
    }
}


