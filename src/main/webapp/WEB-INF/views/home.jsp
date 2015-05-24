<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>

   
   	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	
  	<style type="text/css">
      html, body, #map-canvas { height: 70%; margin: auto auto auto auto;}
    </style> 

	<script type="text/javascript">
		function initialize() {
			var mapOptions = {
				center : {
					lat : -34.397,
					lng : 150.644
				},
				zoom : 8
			};
			var map = new google.maps.Map(document.getElementById('map-canvas'),
					mapOptions);
		}
		google.maps.event.addDomListener(window, 'load', initialize);
	</script>


</head>

	<body>
		<div id="map-canvas"></div>
	</body>
</html>