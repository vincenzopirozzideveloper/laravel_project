<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class ProxyController extends Controller
{
    public function fetchFromApi(Request $request)
    {
        $response = Http::withOptions([
            'verify' => false,
            'allow_redirects' => false // Disable redirects for testing
        ])->get('https://api.publicapis.org/entries');

        // $response = Http::withOptions(['verify' => false])->get('https://jsonplaceholder.typicode.com/posts');

        return response()->json($response->json());
    }
}
