<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ReviewResource extends JsonResource
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
            // 'customer' => $this->customer,
            // 'review' => $this->review,
            // 'star' => $this->star,
            // 'created_at' => $this->created_at
            'user_id' => $this->user_id,
            'product_id' => $this->product_id,
            'rate' => $this->rate,
            'review' => $this->review,
            'status' => $this->status,

        ];
    }
}

