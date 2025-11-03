<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mapa</title>
        <style>
            /* Estilos para el contenedor del mapa */
            #map {
                height: 800px;
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
            // Función para inicializar el mapa
            function initMap() {
                // Coordenadas del punto inicial
                var puntoInicial = { lat: 5.6652957, lng: -72.9289882 };

                // Coordenadas del punto final
                var puntoFinal = { lat: 5.7223889, lng: -72.9137606 };

                // Crea un nuevo mapa en el elemento con id "map"
                var map = new google.maps.Map(document.getElementById('map'), {
                    center: puntoInicial, // Centra el mapa en el punto inicial
                    zoom: 14 // Nivel de zoom inicial
                });

                // Crea un marcador en el mapa para el punto inicial
                var markerInicio = new google.maps.Marker({
                    position: puntoInicial, // Posición del marcador
                    map: map, // Mapa al que se añade el marcador
                    title: 'Ubicación inicial' // Título del marcador
                });

                // Crea un marcador en el mapa para el punto final
                var markerFinal = new google.maps.Marker({
                    position: puntoFinal, // Posición del marcador
                    map: map, // Mapa al que se añade el marcador
                    title: 'Ubicación final' // Título del marcador
                });

                // Definir las aristas que conectan los nodos
                var aristas = [
                    { inicio: puntoInicial, fin: { lat: 5.7142417, lng: -72.9368016 } },
                    { inicio: { lat: 5.7142417, lng: -72.9368016 }, fin: puntoFinal }
                ];

                //Dibujar las aristas en el mapa
                var map = new google.maps.Map(document.getElementById('map'), {
                    center: puntoInicial, // Centra el mapa en el punto inicial
                    zoom: 14 // Nivel de zoom inicial
                });

                //Crea una solicitud de dirección entre el punto inicial y el punto final
                var directionsService = new google.maps.DirectionsService();
                var directionsDisplay = new google.maps.DirectionsRenderer();
                directionsDisplay.setMap(map);

                var request = {
                    origin: puntoInicial, // Punto de inicio
                    destination: puntoFinal, // Punto de fin
                    //travelMode: 'DRIVING' // Modo de viaje (DRIVING, WALKING, BICYCLING o TRANSIT)
                };

                // Obtiene la ruta y la muestra en el mapa
                directionsService.route(request, function (result, status) {
                    if (status == 'OK') {
                        directionsDisplay.setDirections(result);
                    }
                });
            }


        </script>

        <!-- Incluye la API de Google Maps con tu clave de API -->
        <script
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBDaeWicvigtP9xPv919E-RNoxfvC-Hqik&callback=initMap"
            async defer></script>
    </body>

    </html>