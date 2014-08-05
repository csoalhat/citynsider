function initialise(data) {

  if ((typeof data == 'undefined') && (typeof businesses_info == 'undefined')) {
    return false
  // avoid errors
  }

  data = data || businesses_info

  //map options 
  var mapOptions = {
    center: new google.maps.LatLng(51.5, -0.1),
    zoom: 15,
    strokeColor: "#49b8d4",
    styles: [{'featureType':'water','stylers':[{'visibility':'on'},{'color':'#acbcc9'}]},{'featureType':'landscape','stylers':[{'color':'#f2e5d4'}]},{'featureType':'road.highway','elementType':'geometry','stylers':[{'color':'#c5c6c6'}]},{'featureType':'road.arterial','elementType':'geometry','stylers':[{'color':'#e4d7c6'}]},{'featureType':'road.local','elementType':'geometry','stylers':[{'color':'#fbfaf7'}]},{'featureType':'poi.park','elementType':'geometry','stylers':[{'color':'#c5dac6'}]},{'featureType':'administrative','stylers':[{'visibility':'on'},{'lightness':33}]},{'featureType':'road'},{'featureType':'poi.park','elementType':'labels','stylers':[{'visibility':'on'},{'lightness':20}]},{},{'featureType':'road','stylers':[{'lightness':20}]}]
  };

  //create map
  var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);

  //run addAllpins
  addAllPins(map, data);

  // define waypoints for directions
  var firstDatum = data.shift();
  var start = firstDatum.address.lat + "," + firstDatum.address.lng;
  var end = start;
  calcRoute(map, start, end, data);

  
  new google.maps.InfoWindow();
};

function updateMap(location, keyword) {
  keyword = $(this).data("keyword");
  location = $('#location').val();

  console.log('This is your keyword: ' + keyword);
  console.log('This is your location: ' + location);

  //ajax call getting results returned from yelp
  $.ajax({
    data: { keyword: keyword, location: location}, 
    url: '/maps.json',
    type: "GET",
    dataType: "JSON",
    success: function(data, status, blah) { 
      console.log(data);
      console.log(status);
      initialise(data);
    }
  })
}

function setupEventHandlers() {
  $('.keyword').on("click", updateMap)
}


function addMarker(map, position, name, display_address) {
  //marker icon options
  var icon = new google.maps.MarkerImage(
    "http://i.imgur.com/N2ZEY5i.png", //url
    new google.maps.Size(32, 32), //size
    new google.maps.Point(0,0) //origin
  );

  var marker = new google.maps.Marker({
    position: position,
    map: map,
    icon: icon
  });

  // infoWindow information 
  infoWindow = new google.maps.InfoWindow();
    google.maps.event.addListener(marker, 'click', function() {
      if(infoWindow != undefined) infoWindow.close();
      infoWindow.setContent("<div .info>" + name + "<br>" + display_address + "</div>");
      infoWindow.open(map,marker);
   });

  marker.setMap(map);
  map.setCenter(position);

}

// getting all the details for each business returned by yelp
function addAllPins(map, businesses_info) {
  for (i=0; i<businesses_info.length; i++){ 
    addMarker(map, businesses_info[i].address, businesses_info[i].name, businesses_info[i].display_address);

    
  }
}

// directions 
function calcRoute(map, start, end, data) {
  var directionsDisplay;
  var directionsService = new google.maps.DirectionsService();
  var waypts = [];
  directionsDisplay = new google.maps.DirectionsRenderer();
  directionsDisplay.setMap(map);
  directionsDisplay.setOptions( { suppressMarkers: true, strokeColor: '#49b8d4' } );

  for (var i = 0; i < data.length; i++) {
    var location = data[i].address.lat + "," + data[i].address.lng;
    waypts.push({
        location:location,
        stopover:false});
  }

  var request = {
      origin: start,
      destination: end,
      waypoints: waypts,
      optimizeWaypoints: true,
      travelMode: google.maps.TravelMode.WALKING,
  };
  directionsService.route(request, function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(response);
    }
  });

}




$(document).ready(function() {
  initialise();
  setupEventHandlers();
});









