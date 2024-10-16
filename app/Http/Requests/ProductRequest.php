<?php
namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ProductRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'name' => 'required|string|max:255|unique:products',
            'category_id' => 'required|exists:categories,id',
            'brand_id' => 'required|exists:brands,id',
            'price' => 'required|numeric',
            'quantity' => 'nullable|int',
            'track_quantity' => 'nullable|boolean',
            'discounted_price' => 'nullable|numeric',
            'cost' => 'nullable|numeric',
            'slug' => 'nullable|string',
            'status' => 'nullable|string',
            'p_image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'short_description' => 'required|string',
            'long_description' => 'required|string',
            'shipping_fee' => 'nullable|numeric',
            'minimum_order' => 'nullable|int',
            'c_stock' => 'nullable|int',
        ];
    }
}
