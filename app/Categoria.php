<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Categoria extends Model
{
    /* Leer rutas por el slug */
    public function getRouteKeyName(){
         return 'slug';
    }

    /* Relacion 1:n para categorias y establecimientos */
    public function establecimientos(){
        return $this->hasMany(Establecimiento::class);
    }
}
