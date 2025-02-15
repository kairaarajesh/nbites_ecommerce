<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Banner;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\File;
use CloudinaryLabs\CloudinaryLaravel\Facades\Cloudinary;

class BannerController extends Controller

{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $banner=Banner::orderBy('id','DESC')->paginate(10);
        return view('backend.banner.index')->with('banners',$banner);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.banner.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // Validate the incoming request data
        $this->validate($request, [
            'title' => 'string|required|max:50',
            'description' => 'string|nullable',
            'photo' => 'required|image|mimes:jpeg,png,jpg,gif,svg,webp|max:5120',
            'status' => 'required|in:active,inactive',
        ]);

        try {
            $uploadedFileUrl = Cloudinary::upload($request->file('photo')->getRealPath())->getSecurePath();
        } catch (\Exception $e) {
            // Handle the exception if upload fails
            request()->session()->flash('error', 'Failed to upload image to Cloudinary: ' . $e->getMessage());
            return redirect()->route('banner.index');
        }

        // Prepare the data for saving
        $data = $request->all();
        $data['photo'] = $uploadedFileUrl;

        // Generate a unique slug
        $slug = Str::slug($request->title);
        $count = Banner::where('slug', $slug)->count();
        if ($count > 0) {
            $slug = $slug . '-' . date('ymdis') . '-' . rand(0, 999);
        }
        $data['slug'] = $slug;

        // Create the banner
        $status = Banner::create($data);

        if ($status) {
            request()->session()->flash('success', 'Banner successfully added');
        } else {
            request()->session()->flash('error', 'Error occurred while adding banner');
        }

        return redirect()->route('banner.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $banner=Banner::findOrFail($id);
        return view('backend.banner.edit')->with('banner',$banner);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $banner=Banner::findOrFail($id);
        $this->validate($request,[
            'title'=>'string|required|max:50',
            'description'=>'string|nullable',
            // 'photo' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg,webp|max:5120',
            'photo' => 'image|mimes:jpeg,png,jpg,gif,svg,webp|max:5120',
            'status'=>'required|in:active,inactive',
        ]);
        $data=$request->all();
        if ($request->hasFile('photo')) {
            try {
                $uploadedFileUrl = Cloudinary::upload(
                    $request->file('photo')->getRealPath()
                )->getSecurePath();
                $data['photo'] = $uploadedFileUrl;
            } catch (\Exception $e) {
                // Handle the exception if the upload fails
                request()->session()->flash('error', 'Failed to upload image to Cloudinary: ' . $e->getMessage());
                return redirect()->route('banner.index');
            }
        }
        $status=$banner->fill($data)->save();
        if($status){
            request()->session()->flash('success','Banner successfully updated');
        }
        else{
            request()->session()->flash('error','Error occurred while updating banner');
        }
        return redirect()->route('banner.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $banner=Banner::findOrFail($id);
        $status=$banner->delete();
        if($status){
            request()->session()->flash('success','Banner successfully deleted');
        }
        else{
            request()->session()->flash('error','Error occurred while deleting banner');
        }
        return redirect()->route('banner.index');
    }
}
