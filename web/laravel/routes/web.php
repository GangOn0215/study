<?php

use App\Http\Controllers\PostController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/hello', function () {
    return 'Hello, World!';
});

Route::get('/user/{name}', function ($name) {
    return 'Hello ' . $name  .' !';
});

Route::get('/posts', [PostController::class, 'index']);
