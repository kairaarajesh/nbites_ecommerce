<?php

namespace App\Http\Controllers\Api;

class ApiResponse
{

    static function success(string $message = '', array $data = [], int $code = 200) {

        $response = [
            'message' => empty($message) ? 'Request successful' : $message,
            'data' => $data
        ];

        return response()->json($response, $code);
    }

    static function error(string $message = '', array $errors = [], int $code = 400) {

        $response = [
            'message' => empty($message) ? 'Request failed' : $message,
            'errors' => $errors
        ];

        return response()->json($response, $code);
    }


}
