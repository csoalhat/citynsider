// function initialise() {
//   var mapOptions = {
//     center: new google.maps.LatLng(51.5, -0.1),
//     zoom: 14,
//     styles: [{'featureType':'water','stylers':[{'visibility':'on'},{'color':'#acbcc9'}]},{'featureType':'landscape','stylers':[{'color':'#f2e5d4'}]},{'featureType':'road.highway','elementType':'geometry','stylers':[{'color':'#c5c6c6'}]},{'featureType':'road.arterial','elementType':'geometry','stylers':[{'color':'#e4d7c6'}]},{'featureType':'road.local','elementType':'geometry','stylers':[{'color':'#fbfaf7'}]},{'featureType':'poi.park','elementType':'geometry','stylers':[{'color':'#c5dac6'}]},{'featureType':'administrative','stylers':[{'visibility':'on'},{'lightness':33}]},{'featureType':'road'},{'featureType':'poi.park','elementType':'labels','stylers':[{'visibility':'on'},{'lightness':20}]},{},{'featureType':'road','stylers':[{'lightness':20}]}]
//   };
//   var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
//   addMarker(map);

//   new google.maps.InfoWindow();

// };

// function mapAddresses(addresses){
//     _(addresses).each(createMarkerForAddress)
//   }

// function createMarkerForAddress(address){
//     var latLng = new google.maps.LatLng(address.lat, address.lng);
//     var marker = new google.maps.Marker({
//       position: latLng,
//       map: map,
//       address_id: address.id
//     }) 

//     addInfoWindowForAddress(marker, address)
//   }

// $(function(){
//   var map, infowindow;
//   function addInfoWindowForAddress(marker, address){
//     google.maps.event.addListener(marker, 'click', function(){
//       if(infowindow != undefined) infowindow.close()
//       infowindow = new google.maps.InfoWindow({
//         content: '<p>Content goes here </p>'
//       })
  
//       map.setCenter(new google.maps.LatLng((marker.position.lat()), marker.position.lng())); 
//       map.setZoom(18);
//       infowindow.open(map, marker);
//     })
//   }