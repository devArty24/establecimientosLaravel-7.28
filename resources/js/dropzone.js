document.addEventListener("DOMContentLoaded",()=>{
    
    if(document.querySelector("#dropzone")){
        Dropzone.autoDiscover = false;

        const dropzone = new Dropzone('div#dropzone', {
            url: '/imagenes/store',
            dictDefaultMessage: 'Sube hasta 10 imágenes',
            maxFiles: 10,
            required: true,
            acceptedFiles: ".png,.jpg,.gif,.bmp,.jpeg",
            addRemoveLinks: true,
            dictRemoveFile: "Eliminar Imagen",
            headers: {
                'X-CSRF-TOKEN': document.querySelector('meta[name=csrf-token]').content
            },
            init: function(){
                const galeria = document.querySelectorAll(".galeria");
                if(galeria.length>0){
                    galeria.forEach(imagen => {
                        const imagenPublica = {};
                        imagenPublica.size = 1;
                        imagenPublica.name = imagen.value;
                        imagenPublica.nombreServidor = imagen.value;

                        this.options.addedfiles.call(this, imagenPublica);
                        this.options.thumbnail.call(this, imagenPublica, `/storage/${imagenPublica.name}`);

                        imagenPublica.previewElement.classList.add("dz-success");
                        imagenPublica.previewElement.classList.add("dz-complete");
                    });
                }
            },
            success: function(file, respuesta) {
                // console.log(file);
                console.log(respuesta);
                file.nombreServidor = respuesta.archivo;
            },
            sending: function(file, xhr, formData) {
                formData.append("uuid", document.querySelector("#uuid").value);
                console.log('enviando');
            },
            removedfile:function(file,respuesta){
                console.log(file);

                const params={
                    imagen: file.nombreServidor,
                    uuid: document.querySelector("#uuid").value
                }

                axios.post("/imagenes/destroy",params)
                    .then(respuesta=>{
                        console.log(respuesta);

                        /* Eliminar del DOM */
                        file.previewElement.parentNode.removeChild(file.previewElement);
                    })
            }
        });

    }
});