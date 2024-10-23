<?php

namespace App\Http\Controllers\api;

use App\Models\Category;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class categorycontroller extends Controller
{
    public function index()
    {
        $categories = Category::all();

        // Return the categories with a message as JSON response
        return response()->json([
            "message" => "List of category",
            "data" => $categories
        ]);
    }
    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'slug' => 'nullable|string',
            'description' => 'required|string',
            'status' => 'nullable|string',
            'photo' => 'nullable|photo|mimes:jpeg,png,jpg,gif,svg|max:2048',

        ]);
        $imageName = time().'.'.$request->image->extension();
        $request->image->move(public_path('uploads/image'), $imageName);

        $Category = Category::create([
            'title' => $request->title,
            'slug' => $request->slug,
            'description' => $request->description,
            'status' => $request->status,
            'photo' => $imageName,
        ]);
        return response()->json($Category, 201);
    }
    public function show($id)
    {
        $Category = Category::findOrFail($id);
        return response()->json($Category);
    }
    public function update(Request $request, $id)
    {
        $Category = Category::findOrFail($id);

        $request->validate([
            'title' => 'required|string|max:255',
            'slug' => 'nullable|string',
            'description' => 'required|string',
            'status' => 'nullable|string',
            'photo' => 'nullable|photo|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        if ($request->hasFile('photo')) {
            if ($Category->photo) {
                Storage::delete('public/uploads/image/'.$Category->photo);
            }
            $imageName = time().'.'.$request->image->extension();
            $request->photo->move(public_path('uploads/image'), $imageName);
            $Category->photo = $imageName;
        }

        $Category->title = $request->title;
        $Category->slug = $request->slug;
        $Category->description = $request->description;
        $Category->status = $request->status;
        $Category->save();

        return response()->json($Category);
    }
    public function destroy($id)
    {
        $Category = Category::findOrFail($id);

        if ($Category->photo) {
            Storage::delete('public/uploads/image/'.$Category->photo);
        }
        $Category->delete();

        return response()->json(null, 204);
    }
}
