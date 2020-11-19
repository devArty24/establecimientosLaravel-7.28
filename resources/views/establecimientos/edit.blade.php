@extends('layouts.app')

@section('styles')
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" crossorigin=""/>
    <link rel="stylesheet" href="https://unpkg.com/esri-leaflet-geocoder/dist/esri-leaflet-geocoder.css"/>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.7.2/dropzone.min.css" crossorigin="anonymous" />
@endsection

@section('content')
    <div class="container">
        <h1 class="text-center mt-4">Editar establecimiento</h1>

        <div class="mt-5 row justify-content-center">
            <form action="{{route("establecimiento.update",["establecimiento"=>$establecimiento->id])}}" method="POST" enctype="multipart/form-data" class="col-md-9 col-xs-12 card card-body">
                @csrf
                @method("PUT")
                <fieldset class="border p-4">
                    <legend class="text-primary">Nombre, categoria e imagen principal</legend>
                    <div class="form-group">
                        <label for="nombre">Nombre establecimiento</label>
                        <input type="text" id="nombre" class="form-control @error("nombre") is-invalid @enderror" placeholder="Nombre establecimiento" name="nombre" value="{{$establecimiento->nombre}}">
                        @error('nombre')
                            <div class="invalid-feedback">{{$message}}</div>
                        @enderror
                    </div>

                    <div class="form-group @error('categoria_id') is-invalid @enderror">
                        <label for="categoria">Categoria</label>
                        <select name="categoria_id" id="categoria" class="form-control">
                            <option value="" selected disabled>--Seleccione--</option>

                            @foreach ($categorias as $categoria)
                                <option value="{{$categoria->id}}" {{$establecimiento->categoria_id == $categoria->id?"selected":""}}>{{$categoria->nombre}}</option>
                            @endforeach
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="imagen_principal">Imagen principal</label>
                        <input type="file" id="imagen_principal" class="form-control @error("imagen_principal") is-invalid @enderror" name="imagen_principal" value="{{old("imagen_principal")}}">
                        @error('imagen_principal')
                            <div class="invalid-feedback">{{$message}}</div>
                        @enderror

                        <img src="/storage/{{$establecimiento->imagen_principal}}" alt="" style="width:200px;margin-top:20px;">
                    </div>
                </fieldset>

                <fieldset class="border p-4 mt-5">
                    <legend class="text-primary">Ubicacion</legend>
                    <div class="form-group">
                        <label for="formbuscador">Coloca la direccion de tu establecimento</label>
                        <input type="text" id="formbuscador" class="form-control" placeholder="Calle del negocio">
                        <p class="text-secondary mt-5 mb-3 text-center">El asistenete colocara una ubicacion aproximada o mueve el PIN hacia el lugar correcto</p>
                    </div>

                    <div class="form-group">
                        <div id="mapa" style="height:400px;"></div>
                    </div>

                    <p class="informacion">Confirma que los siguientes campos son correctos</p>

                    <div class="form-group">
                        <label for="direccion">Direccion</label>
                        <input type="text" name="direccion" id="direccion" class="form-control @error('direccion') is-invalid @enderror" placeholder="Direccion" value="{{$establecimiento->direccion}}">
                        @error('direccion')
                            <div class="invalid-feedback">{{$message}}</div>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label for="colonia">Colonia</label>
                        <input type="text" name="colonia" id="colonia" class="form-control @error('colonia') is-invalid @enderror" placeholder="Colonia" value="{{$establecimiento->colonia}}">
                        @error('colonia')
                            <div class="invalid-feedback">{{$message}}</div>
                        @enderror
                    </div>
                    <input type="hidden" id="lat" name="lat" value="{{$establecimiento->lat}}">
                    <input type="hidden" id="lng" name="lng" value="{{$establecimiento->lng}}">
                </fieldset>

                <fieldset class="border p-4 mt-5">
                    <legend  class="text-primary">Información Establecimiento: </legend>
                        <div class="form-group">
                            <label for="nombre">Teléfono</label>
                            <input 
                                type="tel" 
                                class="form-control @error('telefono')  is-invalid  @enderror" 
                                id="telefono" 
                                placeholder="Teléfono Establecimiento"
                                name="telefono"
                                value="{{ $establecimiento->telefono }}"
                            >
    
                                @error('telefono')
                                    <div class="invalid-feedback">
                                        {{$message}}
                                    </div>
                                @enderror
                        </div>
    
                        <div class="form-group">
                            <label for="nombre">Descripción</label>
                            <textarea
                                class="form-control  @error('descripcion')  is-invalid  @enderror" 
                                name="descripcion"
                            >{{ $establecimiento->descripcion }}</textarea>
    
                                @error('descripcion')
                                    <div class="invalid-feedback">
                                        {{$message}}
                                    </div>
                                @enderror
                        </div>
    
                        <div class="form-group">
                            <label for="nombre">Hora Apertura:</label>
                            <input 
                                type="time" 
                                class="form-control @error('apertura')  is-invalid  @enderror" 
                                id="apertura" 
                                name="apertura"
                                value="{{ $establecimiento->apertura }}"
                            >
                            @error('apertura')
                                <div class="invalid-feedback">
                                    {{$message}}
                                </div>
                            @enderror
                        </div>
    
                        <div class="form-group">
                            <label for="nombre">Hora Cierre:</label>
                            <input 
                                type="time" 
                                class="form-control @error('cierre')  is-invalid  @enderror" 
                                id="cierre" 
                                name="cierre"
                                value="{{ $establecimiento->cierre }}"
                            >
                            @error('cierre')
                                <div class="invalid-feedback">
                                    {{$message}}
                                </div>
                            @enderror
                        </div>
                </fieldset>

                <fieldset class="border p-4 mt-5">
                    <legend  class="text-primary">Imagenes Establecimiento: </legend>
                    <div class="form-group">
                        <label for="imagenes">Imagenes</label>
                        <div class="dropzone form-control" id="dropzone"></div>
                    </div>
                    @if(count($imagenes)>0)
                        @foreach ($imagenes as $imagen)
                            <input type="hidden" class="galeria" value="{{$imagen->ruta_imagen}}">
                        @endforeach
                    @else
                        
                    @endif
                </fieldset>

                <input type="hidden" id="uuid" name="uuid" value="{{$establecimiento->uuid}}">
                <input type="submit" class="btn btn-primary mt-3 d-block" value="Guardar cambios">
            </form>
        </div>
    </div>
@endsection

@section('scripts')
    <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
    <script src="https://unpkg.com/esri-leaflet" defer></script>
    <script src="https://unpkg.com/esri-leaflet-geocoder" defer></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.7.2/dropzone.min.js" defer></script>
@endsection