<script setup>
/* Importamos las propiedades que el componente va a recibir del componente padre.
   En este caso, las propiedades son 'inicio', 'fin' y 'tamanio'. */
defineProps(['inicio', 'fin', 'tamanio']);

/* Definimos los eventos que el componente emitirá.
   En este caso, los eventos son 'siguiente' y 'anterior'. */
const emit = defineEmits(['siguiente', 'anterior']);

/* Definimos una función llamada 'activarSiguiente' que se encargará de emitir el evento 'siguiente'.
   Esta función puede ser llamada desde el template para notificar al componente padre que se ha
   pulsado el botón "Siguiente". */
const activarSiguiente = () => {
    //console.log("Pulsaste en Siguiente!!!!!");
    emit('siguiente');  // Emitimos el evento 'siguiente'.
}
</script>


<template>
    <!-- Definimos un grupo de botones con la clase 'btn-group' y un rol de 'group' para accesibilidad. -->
    <div class="btn-group" role="group" aria-label="Basic example">
        <!-- Botón "Anterior": Al hacer clic, se emite el evento 'anterior'. 
             El botón se deshabilita si 'inicio' es menor o igual a 0. -->
        <button @click="emit('anterior')" type="button" class="btn btn-outline-primary" :disabled="inicio <= 0">Anterior
        </button>

        <!-- Botón "Siguiente": Al hacer clic, se llama a la función 'activarSiguiente'. 
             El botón se deshabilita si 'fin' es mayor o igual a 'tamanio'. -->
        <button @click="activarSiguiente" type="button" class="btn btn-outline-primary" :disabled="fin >= tamanio">Siguiente </button>
    </div>
</template>
