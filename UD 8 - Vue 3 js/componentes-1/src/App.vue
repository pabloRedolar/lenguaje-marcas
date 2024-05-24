<script setup>
/* Importamos las funciones reactivas de Vue */
import { ref } from 'vue';

/* Importamos los componentes que se usarán en este componente principal */
import BlogPost from './components/BlogPost.vue';
import ButtonCounter from './components/ButtonCounter.vue';
import PaginatePost from './components/PaginatePost.vue';
import LoadingSpinner from './components/LoadingSpinner.vue';

/* Creamos una referencia reactiva para almacenar los posts */
const posts = ref([]);

/* Definimos una constante para el número de posts por página (no reactiva) */
const postXPagina = 10;

/* Definimos referencias reactivas para el inicio y el fin de la paginación */
const inicio = ref(0);
const fin = ref(postXPagina);

/* Definimos una referencia reactiva para el estado de carga */
const loading = ref(true);

/* Definimos una referencia reactiva para almacenar el post favorito */
const favorito = ref('');

/* Definimos una función para cambiar el post favorito */
const cambiarFavorito = (post) => {
  favorito.value = post;
}

/* Definimos funciones para la lógica de paginación */
const siguiente = () => {
  inicio.value = inicio.value + postXPagina;
  fin.value = fin.value + postXPagina;
};

const anterior = () => {
  inicio.value = inicio.value - postXPagina;
  fin.value = fin.value - postXPagina;
};

/* Realizamos una solicitud para obtener los posts y los almacenamos en la referencia 'posts' */
fetch('https://jsonplaceholder.typicode.com/posts')
  .then(res => res.json())
  .then((data) => posts.value = data)
  .finally(() => {
    /* Simulamos una carga retrasada para mostrar el spinner */
    setTimeout(() => {
      loading.value = false;
    }, 1000);
  });
</script>


<template>
  <!-- Mostramos el componente LoadingSpinner mientras 'loading' sea true -->
  <LoadingSpinner v-if="loading" />
  
  <!-- Una vez la carga ha terminado, mostramos el contenido principal -->
  <div class="container" v-else>
    <h1>Componentes</h1>
    <h2>Mi Post Favorito: {{ favorito }}</h2>

    <!-- Componente de paginación. Pasamos métodos y datos como props -->
    <PaginatePost class="mb-2" @siguiente="siguiente" @anterior="anterior" :inicio="inicio" :fin="fin" :tamanio="posts.length" />
    
    <!-- Mostramos los posts paginados usando v-for y slice para cortar el array -->
    <BlogPost 
      v-for="post in posts.slice(inicio, fin)" 
      :key="post.id" 
      :titulo="post.title" 
      :id="post.id" 
      :body="post.body" 
      @cambiarNombreFavorito="cambiarFavorito" 
    />
  </div>
</template>
