<?php

namespace App\Http\Controllers;

use App\Imagen;
use App\Categoria;
use App\Establecimiento;
use Illuminate\Http\Request;

class APIController extends Controller
{
    /* Metodo para obtener todos los establecimientos */
    public function index(){
        $establecimentos = Establecimiento::with("categoria")->get();

        return response()->json($establecimentos);
    }

    /* Metodo para obtener todas las categorias */
    public function categorias(){
        $categorias = Categoria::all();

        return response()->json($categorias);
    }

    /* Muestra los establecimeitnos de laa categoria en especifico */
    public function categoria(Categoria $categoria){
        $establecimentos = Establecimiento::where("categoria_id",$categoria->id)->with("categoria")->take(3)->get();

        return response()->json($establecimentos);
    }

    public function establecimientoscategoria(Categoria $categoria){
        $establecimentos = Establecimiento::where("categoria_id",$categoria->id)->with("categoria")->get();

        return response()->json($establecimentos);
    }

    /* Muestra un establecimientos en especifico */
    public function show(Establecimiento $establecimiento){
        $imagenes = Imagen::where("id_establecimiento",$establecimiento->uuid)->get();
        $establecimiento->imagenes = $imagenes;

        return response()->json($establecimiento);
    }
}
