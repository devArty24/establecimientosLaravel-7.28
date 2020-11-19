<?php

namespace App\Http\Controllers;

use App\Imagen;
use App\Establecimiento;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Intervention\Image\Facades\Image;

class ImagenController extends Controller
{


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        /* Leer la imagen */
        $ruta_imagen = $request->file("file")->store("establecimientos","public");

        /* Ajustar tamaño a la imagen */
        $imagen = Image::make(public_path("storage/{$ruta_imagen}"))->fit(800,400);
        $imagen->save();

        /* Almacenar en la DB con el modelo */
        $imagenDB = new Imagen;
        $imagenDB->id_establecimiento = $request["uuid"];
        $imagenDB->ruta_imagen = $ruta_imagen;
        $imagenDB->save();

        /* Retornar respuesta */
        $respuesta = ["archivo"=>$ruta_imagen];
        return response()->json($respuesta);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Imagen  $imagen
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        /* Imagen a eliminar */
        $imagen = $request->get("imagen");
        $uuid = $request->get("uuid");

        $establecimiento = Establecimiento::where("uuid",$uuid)->firts();
        $this->authorize("delete",$establecimiento);

        if(File::exists("storage/".$imagen)){
            /* Eliminar del servidor */
            File::delete("storage/".$imagen);

            /* Eliminar de la DB */
            Imagen::where("ruta_imagen",$imagen)->delete();
            
            $respuesta= [
                "mensaje"=> "Imagen eliminada",
                "imagen"=> $imagen
            ];
        }


        return response()->json($respuesta);
    }

}
