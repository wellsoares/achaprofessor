<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html>
    <head>
        <title>Geolocation</title>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
        <meta charset="utf-8">
        <style>
            html, body {
                height: 100%;
                margin: auto auto;
            }
            #map {
                height: 70%;
                margin: auto auto;
            }
        </style>
        <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    </head>
    <body >
        <div id="map"></div>
        <script>
            // Note: This example requires that you consent to location sharing when
            // prompted by your browser. If you see the error "The Geolocation service
            // failed.", it means you probably did not give permission for the browser to
            // locate you.
            var map;
            function pontos() {
                $(function () {
                    $.ajax({
                        dataType: "json",
                        type: "GET",
                        url: "http://localhost:8089/achaprofessor/loadMarkers",
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log("ERROR");
                        },
                        success: function (dados, textStatus, jqXHR) {
                            setMarkers(dados);
                            console.log("Success: ", dados);
                            console.log("Success: ", textStatus);
                            console.log("Success: ", jqXHR);
                        }
                    });
                });
            }

            function setMarkers(dados) {

                var marcadores = dados.markers;
                for (var i = 0, length = marcadores.length; i < length; i++) {
                    var data = marcadores[i], latLng = new google.maps.LatLng(data.lat, data.lng);
                    // Creating a marker and putting it on the map
                    var marker = new google.maps.Marker({
                        position: latLng,
                        map: map,
                        title: data.title
                    });

                    console.log("Marcadores: ", marker);
                }

            }

            function initMap() {

                map = new google.maps.Map(document.getElementById('map'), {
                    center: {lat: -34.397, lng: 150.644},
                    zoom: 3
                });

                var infoWindow = new google.maps.InfoWindow({map: map});
                // Try HTML5 geolocation.
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(function (position) {
                        var pos = {
                            lat: position.coords.latitude,
                            lng: position.coords.longitude
                        };
                        infoWindow.setPosition(pos);
                        infoWindow.setContent('Location found.');
                        map.setCenter(pos);
                    }, function () {
                        handleLocationError(true, infoWindow, map.getCenter());
                    });
                } else {
                    // Browser doesn't support Geolocation
                    handleLocationError(false, infoWindow, map.getCenter());
                }

                pontos();
            }


            function handleLocationError(browserHasGeolocation, infoWindow, pos) {
                infoWindow.setPosition(pos);
                infoWindow.setContent(browserHasGeolocation ?
                        'Error: The Geolocation service failed.' :
                        'Error: Your browser doesn\'t support geolocation.');
            }

        </script>
        <script src="https://maps.googleapis.com/maps/api/js?signed_in=true&callback=initMap"
                async defer>
        </script>

    </body>
</html>