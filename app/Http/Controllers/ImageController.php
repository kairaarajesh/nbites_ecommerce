<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use CloudinaryLabs\CloudinaryLaravel\Facades\Cloudinary;

class ImageController extends Controller
{
    public function uploadPhoto(Request $request)
    {
        $request->validate([
            'photo' => 'image|mimes:jpeg,png,jpg,gif,svg,webp|max:5120',
        ]);

        try {
            // Step 2: Get the uploaded file and upload to Cloudinary
            $file = $request->file('photo');
            $uploadedFileUrl = Cloudinary::uploadFile($file->getRealPath(), [
                'folder' => 'your-folder-name',
            ])->getSecurePath();

            // Step 3: Return success response with the uploaded URL
            return response()->json([
                'message' => 'Image uploaded successfully!',
                'url' => $uploadedFileUrl,
            ]);

        } catch (\Exception $e) {
            // Step 4: Return error response
            return response()->json([
                'error' => 'Upload failed: ' . $e->getMessage(),
            ], 500);
        }
    }
}

