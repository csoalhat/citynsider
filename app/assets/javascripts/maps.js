function initialise() {

  // var directionsDisplay;
  // var directionsService = new google.maps.DirectionsService();
  // var map;

  var mapOptions = {
    center: new google.maps.LatLng(51.5, -0.1),
    zoom: 15,
    styles: [{'featureType':'water','stylers':[{'visibility':'on'},{'color':'#acbcc9'}]},{'featureType':'landscape','stylers':[{'color':'#f2e5d4'}]},{'featureType':'road.highway','elementType':'geometry','stylers':[{'color':'#c5c6c6'}]},{'featureType':'road.arterial','elementType':'geometry','stylers':[{'color':'#e4d7c6'}]},{'featureType':'road.local','elementType':'geometry','stylers':[{'color':'#fbfaf7'}]},{'featureType':'poi.park','elementType':'geometry','stylers':[{'color':'#c5dac6'}]},{'featureType':'administrative','stylers':[{'visibility':'on'},{'lightness':33}]},{'featureType':'road'},{'featureType':'poi.park','elementType':'labels','stylers':[{'visibility':'on'},{'lightness':20}]},{},{'featureType':'road','stylers':[{'lightness':20}]}]
  };

  // var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
  var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
  // directionsDisplay.setMap(map);

  addAllPins(map, address, names);

  new google.maps.InfoWindow();
};


function addMarker(map, position, name) {

  var icon = new google.maps.MarkerImage(
    "/assets/marker.png", //url
    new google.maps.Size(29, 50), //size
    new google.maps.Point(0,0) //origin
  );

  var marker = new google.maps.Marker({
    position: position,
    map: map,
    icon: icon
  });

  infoWindow = new google.maps.InfoWindow();
    google.maps.event.addListener(marker, 'click', function() {
      if(infoWindow != undefined) infoWindow.close();
      infoWindow.setContent("<p>" + name + "</p>");
      infoWindow.open(map,marker);
   });

  marker.setMap(map);
  map.setCenter(position);

}

function addAllPins(map, address, names) {
  for (i=0; i<address.length; i++){ 
    addMarker(map, address[i], names[i]);
    console.log(address[i]);
  }
}

// function calcRoute() {
//   var start = london;
//   var end = paris;
//   var request = {
//     origin:start,
//     destination:end,
//     travelMode: google.maps.TravelMode.WALKING
//   };
//   directionsService.route(request, function(result, status) {
//     if (status == google.maps.DirectionsStatus.OK) {
//       directionsDisplay.setDirections(result);
//     }
//   });
// }

$(document).ready(function() {
  initialise();
});