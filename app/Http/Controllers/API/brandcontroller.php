<?php

namespace App\Http\Controllers\api;
use App\Models\Brand;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class brandcontroller extends Controller
{
    public function index()
    {
        $brands = Brand::all();
        return response()->json($brands);
    }
    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'slug' => 'required|string',
            'status' => 'nullable|string',
            // 'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        // $imageName = time().'.'.$request->image->extension();
        // $request->image->move(public_path('uploads/image'), $imageName);

        $brand = Brand::create([
            'title' => $request->title,
            'slug' => $request->slug,
            'status' => $request->status,
        ]);

        return response()->json($brand, 201);
    }
    public function show($id)
    {
        $brand = brand::findOrFail($id);
        return response()->json($brand);
    }
    public function update(Request $request, $id)
    {
        $brand = brand::findOrFail($id);

        $request->validate([
            'title' => 'required|string|max:255',
            'slug' => 'nullable|string',
            'status' => 'nullable|string',
        ]);

        // if ($request->hasFile('photo')) {
        //     if ($brand->photo) {
        //         Storage::delete('public/uploads/image/'.$brand->photo);
        //     }
        //     $imageName = time().'.'.$request->image->extension();
        //     $request->photo->move(public_path('uploads/image'), $imageName);
        //     $brand->photo = $imageName;
        // }
        $brand->title = $request->title;
        $brand->slug = $request->slug;
        $brand->status = $request->status;
        $brand->save();
        return response()->json($brand);
    }
    public function destroy($id)
    {
        $brand = brand::findOrFail($id);

        if ($brand->photo) {
            Storage::delete('public/uploads/image/'.$brand->photo);
        }

        $brand->delete();

        return response()->json(null, 204);
    }
}
