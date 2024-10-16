<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\organic;
use Illuminate\Support\Facades\Storage;

class organiccontroller extends Controller
{
    public function index()

    {

        $organics = organic::all();
        return response()->json($organics);
    }
    public function store(Request $request)
    {

        $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'required|string',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        $imageName = time().'.'.$request->image->extension();
        $request->image->move(public_path('uploads/image'), $imageName);

        $organic = organic::create([
            'title' => $request->title,
            'content' => $request->content,
            'image' => $imageName,
        ]);

        return response()->json($organic, 201);
    }

    // Show a specific organic
    public function show($id)
    {
        $organic = organic::findOrFail($id);
        return response()->json($organic);
    }

    // Update an existing organic
    public function update(Request $request, $id)
    {
        $organic = organic::findOrFail($id);

        $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'required|string',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        if ($request->hasFile('image')) {
            if ($organic->image) {
                Storage::delete('public/uploads/image/'.$organic->image);
            }
            $imageName = time().'.'.$request->image->extension();
            $request->image->move(public_path('uploads/image'), $imageName);
            $organic->image = $imageName;
        }

        $organic->title = $request->title;
        $organic->content = $request->content;
        $organic->save();

        return response()->json($organic);
    }

    // Delete a banner
    public function destroy($id)
    {
        $organic = organic::findOrFail($id);

        if ($organic->image) {
            Storage::delete('public/uploads/image/'.$organic->image);
        }

        $organic->delete();

        return response()->json(null, 204);
    }
}
