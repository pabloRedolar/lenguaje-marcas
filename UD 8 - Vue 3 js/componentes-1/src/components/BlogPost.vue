<script setup>
/* Importamos la función ref de Vue para crear referencias reactivas */
import { ref } from 'vue';

/* Definimos las propiedades esperadas por el componente */
defineProps({
    titulo: String,
    id: Number,
    body: {
        type: String,
        default: "Sin descripción",
    }
});

/* Definimos los eventos que el componente puede emitir */
const emit = defineEmits(['cambiarNombreFavorito']);
</script>


<template>
    <!-- Estructura del componente de tarjeta -->
    <div class="card">
        <div class="card-body">
            <!-- Mostramos el título y el cuerpo del post -->
            <h5>{{ id }} - {{ titulo }}</h5>
            <p>{{ body }}</p>
            
            <!-- Botón para marcar como favorito -->
            <button class="btn btn-outline-primary" @click="emit('cambiarNombreFavorito', titulo )">Favorito</button>
        </div>
    </div>
</template>
