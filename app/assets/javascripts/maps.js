
function initialise() {
  var mapOptions = {
    center: new google.maps.LatLng(51.5, -0.1),
    zoom: 14,
  };
  var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
  addMarker(map);

  new google.maps.InfoWindow();
};


function addMarker(map) {
  console.log("Showing marker from geocoder results.");
  var geocoder = new google.maps.Geocoder();
  var showMarkerFromGeocoderResults = function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      var icon = new google.maps.MarkerImage(
                  "/assets/marker.png", //url
                  new google.maps.Size(50, 50), //size
                  new google.maps.Point(0,0) //origin
          );
       var marker = new google.maps.Marker({
           position: results[0].geometry.location,
           map: map,
           icon: icon,
       });

      infoWindow = new google.maps.InfoWindow();
      google.maps.event.addListener(marker, 'click', function() {
        if(infoWindow != undefined) infoWindow.close();
        infoWindow.setContent("<p>yelp content goes there</p>");
        infoWindow.open(map,marker);
     });
      
      map.setCenter(results[0].geometry.location);

      styles: [{featureType:"road",elementType:"geometry",stylers:[{lightness:100},{visibility:"simplified"}]},{"featureType":"water","elementType":"geometry","stylers":[{"visibility":"on"},{"color":"#C6E2FF",}]},{"featureType":"poi","elementType":"geometry.fill","stylers":[{"color":"#C5E3BF"}]},{"featureType":"road","elementType":"geometry.fill","stylers":[{"color":"#D1D1B8"}]}]
    } 

  else {
      console.warn("coulnt geocod address.");
    }
  }

  $('address').each(function(i, el) {
    var geocoderOptions = { address: $(el).text() };
    geocoder.geocode(geocoderOptions, showMarkerFromGeocoderResults);
  });
}



 $(initialise)