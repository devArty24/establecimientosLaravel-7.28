import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
    /* El state sirve como el data en cada archivo .vue, solo que este los maneja juntos y no componente por componente */
    state:{
        cafes:[],
        restaurantes: [],
        hoteles:[],
        establecimiento:{},
        establecimientos: [],
        categorias: [],
        categoria: '',
    },
    /* mutations se podria decir que es como un array de funciones js */
    mutations:{
        AGREGAR_CAFES(state,cafes){
            state.cafes = cafes;
        },
        AGREGAR_RESTAURANTES(state,restaurantes){
            state.restaurantes = restaurantes;
        },
        AGREGAR_HOTELES(state,hoteles){
            state.hoteles = hoteles;
        },
        AGREGAR_ESTABLECIMIENTO(state,establecimiento){
            state.establecimiento = establecimiento;
        },
        AGREGAR_ESTABLECIMIENTOS(state,establecimientos){
            state.establecimientos = establecimientos;
        },
        AGREGAR_CATEGORIAS(state,categorias){
            state.categorias = categorias;
        },
        SELECCIONAR_CATEGORIA(state,categoria){
            state.categoria = categoria;
        }
    },
    getters: {
        obtenerEstablecimiento: state => {
            return state.establecimiento
        },
        obtenerImagenes: state => {
            return state.establecimiento.imagenes;
        },
        obtenerEstablecimientos: state => {
            return state.establecimientos;
        },
        obtenerCategorias: state => {
            return state.categorias;
        },
        obtenerCategoria: state => {
            return state.categoria;
        }
    }
});