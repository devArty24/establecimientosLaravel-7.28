<template>
    <div>
        <h2 class="mt-4">Galeria de imagenes</h2>
        <ul class="row list-untyled mt-4">
            <li class="col-md-4 mb-4" v-fore="imagen in imagenes" v-bind:key="imagen.id">
                <a :href='`/storage/${imagen.ruta_imagen}`' data-lightbox="imagenes" data-title="imagen Establecimiento">

                </a>
                <img class="img-fluid" :src='`/storage/${imagen.ruta_imagen}`'>
            </li>
        </ul>
    </div>
</template>

<script>
export default {
    computed: {
        imagenes() {
            return this.$store.getters.obtenerImagenes
        }
    }
}
</script>

<style scoped>
    @import 'https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/css/lightbox.min.css';
</style>