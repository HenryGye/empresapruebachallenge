<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PersonasLiquidadasController;

// Route::get('/', function () {
//     return view('welcome');
// });

// Route::get('/', [PersonasLiquidadasController::class, 'index']);
Route::get('/', [PersonasLiquidadasController::class, 'index']);
Route::post('listar', [PersonasLiquidadasController::class, 'listar'])->name('listar');
