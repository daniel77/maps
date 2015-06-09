<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <style>
      #map-canvas {
        width: 500px;
        height: 400px;
      }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js"></script>
        <script>
      function initialize() {
        var mapCanvas = document.getElementById('map-canvas');
        var mapOptions = {
          center: new google.maps.LatLng(${point.lat}, ${point.lng}),
          zoom: 16,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        var map = new google.maps.Map(mapCanvas, mapOptions)
        var marker = new google.maps.Marker({
            position: new google.maps.LatLng(${point.lat}, ${point.lng}),
            title: 'Hello World!',
            map: map
          });
               
      }
      google.maps.event.addDomListener(window, 'load', initialize);
    </script>
  </head>
<body>
    <div id="map-canvas"></div>
    
    <form action="./geocodeTest">
    <input type="text" name="address" id="address"> 
    
    <input type="submit" />
    </form>
  </body>
</html>
