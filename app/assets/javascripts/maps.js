function initialise() {

  var mapOptions = {
    center: new google.maps.LatLng(51.5, -0.1),
    zoom: 15,
    styles: [{'featureType':'water','stylers':[{'visibility':'on'},{'color':'#acbcc9'}]},{'featureType':'landscape','stylers':[{'color':'#f2e5d4'}]},{'featureType':'road.highway','elementType':'geometry','stylers':[{'color':'#c5c6c6'}]},{'featureType':'road.arterial','elementType':'geometry','stylers':[{'color':'#e4d7c6'}]},{'featureType':'road.local','elementType':'geometry','stylers':[{'color':'#fbfaf7'}]},{'featureType':'poi.park','elementType':'geometry','stylers':[{'color':'#c5dac6'}]},{'featureType':'administrative','stylers':[{'visibility':'on'},{'lightness':33}]},{'featureType':'road'},{'featureType':'poi.park','elementType':'labels','stylers':[{'visibility':'on'},{'lightness':20}]},{},{'featureType':'road','stylers':[{'lightness':20}]}]
  };

  var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);

  addAllPins(map, address);

  new google.maps.InfoWindow();
};


function addMarker(map, position) {
  // var geocoder = new google.maps.Geocoder();

  var icon = new google.maps.MarkerImage(
    "/assets/marker.png", //url
    new google.maps.Size(50, 50), //size
    new google.maps.Point(0,0) //origin
  );

  var marker = new google.maps.Marker({
    position: position,
    map: map,
    title:"Hello World!",
    icon: icon
  });

  marker.setMap(map);
  map.setCenter(position);

  // var showMarker = function(results, status) {
  //     var icon = new google.maps.MarkerImage(
  //                 "/assets/marker.png", //url
  //                 new google.maps.Size(50, 50), //size
  //                 new google.maps.Point(0,0) //origin
  //         );
  //      var marker = new google.maps.Marker({
  //         position: position,
  //         map: map,
  //         icon: icon,
  //      });

  //      console.log(position);

  //     infoWindow = new google.maps.InfoWindow();
  //     google.maps.event.addListener(marker, 'click', function() {
  //       if(infoWindow != undefined) infoWindow.close();
  //       infoWindow.setContent("<p>yelp content goes there</p>");
  //       infoWindow.open(map,marker);
  //    });
      
  //     map.setCenter(position);
  // }

  // $('address').each(function(i, el) {
  //   var geocoderOptions = { address: $(el).text() };
  //   geocoder.geocode(geocoderOptions, showMarkerFromGeocoderResults);
  // });

}

function addAllPins(map, address) {
  for (i=0; i<address.length; i++){ 
    addMarker(map, address[i]);
    console.log(address[i]);
  }
}

$(document).ready(function() {
  initialise();
});