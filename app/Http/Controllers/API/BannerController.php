<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Banner;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class BannerController extends Controller
{
    public function index()

    {

        $banners = Banner::all();
        return response()->json($banners);
    }
    public function store(Request $request)
    {

        $request->validate([
            'title' => 'required|string|max:255',
            'slug' => 'nullable|string',
            'description' => 'required|string',
            'photo' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        $imageName = time().'.'.$request->photo->extension();
        $request->photo->move(public_path('uploads/image'), $imageName);

        $banner = Banner::create([
            'title' => $request->title,
            'slug' => $request->slug,
            'description' => $request->description,
            'photo' => $imageName,
        ]);

        return response()->json($banner, 201);
    }
    public function show($id)
    {
        $banner = Banner::findOrFail($id);
        return response()->json($banner);
    }

    public function update(Request $request, $id)
    {
        $banner = Banner::findOrFail($id);

        $request->validate([
            'title' => 'required|string|max:255',
            'slug' => 'nullable|string',
            'description' => 'required|string',
            'photo' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        if ($request->hasFile('image')) {
            if ($banner->photo) {
                Storage::delete('public/uploads/image/'.$banner->photo);
            }
            $imageName = time().'.'.$request->photo->extension();
            $request->photo->move(public_path('uploads/image'), $imageName);
            $banner->photo = $imageName;
        }

        $banner->title = $request->title;
        $banner->slug = $request->slug;
        $banner->description = $request->description;
        $banner->save();

        return response()->json($banner);
    }
    public function destroy($id)
    {
        $banner = Banner::findOrFail($id);

        if ($banner->photo) {
            Storage::delete('public/uploads/image/'.$banner->photo);
        }

        $banner->delete();

        return response()->json(null, 204);
    }
}
