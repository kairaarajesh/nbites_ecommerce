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
            'id'=>$this->id,
            'title' => $this->title,
            'price' => $this->price,
            // 'slug ' => $this->slug,
            // 'desc' => $this->summary,
            'desc' => $this->description,
            'img' => $this->photo,
            'total_quantity' => $this->stock,
            // 'size' => $this->size,
            'status' => $this->status,
            'reduction' => $this->discount,
            'is_featured' => $this->is_featured,
            'categorie_id ' => $this->cat_id,
            'child_cat_id ' => $this->child_cat_id,
            'brand_id ' => $this->brand_id,
            'rating' => $this->product_reviews && $this->product_reviews->count() > 0
            ? round($this->product_reviews->sum('star') / $this->product_reviews->count(), 2)
            : "No rating yet",
        ];
    }
}


