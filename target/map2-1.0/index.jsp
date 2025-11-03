<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mapa</title>
        <style>
            /* Estilos para el contenedor del mapa */
            #map {
                height: 400px;
                /* Altura del mapa */
                width: 100%;
                /* Ancho del mapa */
            }
        </style>
    </head>

    <body>
        <h1>Mapa</h1>

        <!-- Div para contener el mapa -->
        <div id="map"></div>

        <script>
            // Función para inicializar el mapa
            function initMap() {
                // Coordenadas del punto inicial
                var puntoInicial = { lat: 5.6652957, lng: -72.9289882 };

                // Crea un nuevo mapa en el elemento con id "map"
                var map = new google.maps.Map(document.getElementById('map'), {
                    center: puntoInicial, // Centra el mapa en el punto inicial
                    zoom: 18 // Nivel de zoom inicial
                });

                // Crea un marcador en el mapa
                var marker = new google.maps.Marker({
                    position: puntoInicial, // Posición del marcador
                    map: map, // Mapa al que se añade el marcador
                    title: 'Ubicación actual' // Título del marcador
                });

                var marker2 = new google.maps.Marker({
                    position: { lat: 5.7223889, lng: -72.9137606 },
                    map: map,
                    title: 'Segundo punto'
                });
            }
        </script>

        <!-- Incluye la API de Google Maps con tu clave de API -->
        <script
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBDaeWicvigtP9xPv919E-RNoxfvC-Hqik&callback=initMap"
            async defer></script>
    </body>

    </html>