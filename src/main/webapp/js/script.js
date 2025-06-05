// JavaScript para el Proyecto Final

// Función que se ejecuta cuando la página se carga completamente
document.addEventListener('DOMContentLoaded', function() {
    console.log('Proyecto Final - Lenguajes de Computación IV cargado correctamente');
    
    // Agregar interactividad básica
    const container = document.querySelector('.container');
    if (container) {
        container.addEventListener('click', function() {
            console.log('Container clickeado');
        });
    }
});

// Función de utilidad para mostrar mensajes
function mostrarMensaje(mensaje) {
    alert(mensaje);
}

