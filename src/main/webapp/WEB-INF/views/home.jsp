<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Insert title here</title>

        <script type="text/javascript"
        src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
        <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

        <style type="text/css">
            html, body, #map-canvas {
                height: 70%;
                margin: auto auto auto auto;
            }
        </style>

        <script type="text/javascript">
            var map;
            var geocoder;
            var centerChangedLast;
            var reverseGeocodedLast;
            var currentReverseGeocodeResponse;

            function initialize() {
                var latlng = new google.maps.LatLng(32.5468, -23.2031);
                var myOptions = {
                    zoom: 2,
                    center: latlng,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                map = new google.maps.Map(document.getElementById("map_canvas"),
                        myOptions);
                geocoder = new google.maps.Geocoder();

                setupEvents();
                centerChanged();
            }

            function setupEvents() {
                reverseGeocodedLast = new Date();
                centerChangedLast = new Date();

                setInterval(
                        function () {
                            if ((new Date()).getSeconds()
                                    - centerChangedLast.getSeconds() > 1) {
                                if (reverseGeocodedLast.getTime() < centerChangedLast
                                        .getTime())
                                    reverseGeocode();
                            }
                        }, 1000);

                google.maps.event.addListener(map, 'zoom_changed', function () {
                    document.getElementById("zoom_level").innerHTML = map.getZoom();
                });

                google.maps.event.addListener(map, 'center_changed', centerChanged);

                google.maps.event.addDomListener(document.getElementById('crosshair'),
                        'dblclick', function () {
                            map.setZoom(map.getZoom() + 1);
                        });

            }

            function getCenterLatLngText() {
                return '(' + map.getCenter().lat() + ', ' + map.getCenter().lng() + ')';
            }

            function centerChanged() {
                centerChangedLast = new Date();
                var latlng = getCenterLatLngText();
                document.getElementById('latlng').innerHTML = latlng;
                document.getElementById('formatedAddress').innerHTML = '';
                currentReverseGeocodeResponse = null;
            }

            function reverseGeocode() {
                reverseGeocodedLast = new Date();
                geocoder.geocode({
                    latLng: map.getCenter()
                }, reverseGeocodeResult);
            }

            function reverseGeocodeResult(results, status) {
                currentReverseGeocodeResponse = results;
                if (status == 'OK') {
                    if (results.length == 0) {
                        document.getElementById('formatedAddress').innerHTML = 'None';
                    } else {
                        document.getElementById('formatedAddress').innerHTML = results[0].formatted_address;
                    }
                } else {
                    document.getElementById('formatedAddress').innerHTML = 'Error';
                }
            }

            function geocode() {
                var address = document.getElementById("address").value;
                geocoder.geocode({
                    'address': address,
                    'partialmatch': true
                }, geocodeResult);
            }

            function geocodeResult(results, status) {
                if (status == 'OK' && results.length > 0) {
                    map.fitBounds(results[0].geometry.viewport);
                } else {
                    alert("Geocode was not successful for the following reason: "
                            + status);
                }
            }

            function addMarkerAtCenter() {
                var marker = new google.maps.Marker({
                    position: map.getCenter(),
                    map: map
                });

                var text = 'Lat/Lng: ' + getCenterLatLngText();
                if (currentReverseGeocodeResponse) {
                    var addr = '';
                    if (currentReverseGeocodeResponse.size == 0) {
                        addr = 'None';
                    } else {
                        addr = currentReverseGeocodeResponse[0].formatted_address;
                    }
                    text = text + '<br>' + 'address: <br>' + addr;
                }

                var infowindow = new google.maps.InfoWindow({
                    content: text
                });

                google.maps.event.addListener(marker, 'click', function () {
                    infowindow.open(map, marker);
                });
            }
        </script>


    </head>

    <body onLoad="initialize()">
        <h1 style="display: none;">APP Google Maps - Localizar Latitude /
            Longitude</h1>
        <div
            style="position: relative; width: 980px; left: 50%; margin-left: -490px; height: 90px;">
            <div style="position: absolute; left: 0px; top: 20px;">
                <a href="http://www.procriativo.com.br/" target="_blank"><img
                        src="../../images/geral/logo-procriativo.png" /></a>
            </div>

            <div style="position: absolute; right: 0px; top: 30px;">
                Localizar Região: <input type="text" class="form_contato"
                                         id="address" style="width: 300px; margin-right: 15px;" /> <input
                                         type="button" value="Procurar" onClick="geocode()"
                                         class="form_contato"> <input type="button"
                                         value="Adicionar ponto no mapa" onClick="addMarkerAtCenter()"
                                         class="form_contato" />
            </div>
        </div>
        <div
            style="background: url(../../images/geral/separacao_line.png) repeat-x; height: 2px;"></div>
        <div
            style="position: relative; width: 980px; left: 50%; margin-left: -490px; height: 40px; line-height: 40px; text-align: center;"
            class="Caecilia17">Para realizar a pesquisa digite no formulario
            acima o endereço desejado.</div>
        <div
            style="background: url(../../images/geral/separacao_line.png) repeat-x; height: 2px;"></div>
        <div style="background: #ffffff;">
            <div id="map">
                <div id="map_canvas" style="width: 100%; height: 400px"></div>

                <div id="crosshair"></div>
            </div>
        </div>
        <div
            style="background: url(../../images/geral/separacao_line.png) repeat-x; height: 2px;"></div>
        <div
            style="position: relative; width: 980px; left: 50%; margin-left: -490px; height: 90px; margin-top: 20px; line-height: 20px;"
            class="arial15cinza">
            Latitude / Longitude: <span id="latlng"></span><br /> Endereço: <span
                id="formatedAddress"></span><br /> Nivel do zoom: <span
                id="zoom_level"></span><br />
        </div>
    </body>
</html>