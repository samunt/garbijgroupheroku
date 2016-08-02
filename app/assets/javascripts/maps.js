
function makeMap(){
  console.log("new function");
  var map = new google.maps.Map(document.getElementById('map'), {
  center: {lat: 43.7184039, lng: -79.518143},
  zoom: 10
  });


  var markers=[];
  var infoWindowContent=[];

    $.each(window.spaces, function(index) {

      markers.push([spaces[index]['address'], spaces[index]['latitude'],spaces[index]['longitude']]);
      infoWindowContent.push(['<div class="info_content" >' +
      '<h3 style="color: rgb(<%= rand(0..200)%>,<%= rand(0..200)%> ,<%= rand(0..200)%>);">'+spaces[index]['address']+'</h3>' +'</br>'+
      '</div>']);

    });

    // var bounds = new google.maps.LatLngBounds();

    var infoWindow = new google.maps.InfoWindow(), marker, i;
    // var iconBase = 'https://maps.google.com/mapfiles/kml/shapes/';
    // Loop through our array of markers & place each one on the map
    for( i = 0; i < markers.length; i++ ) {
      var position = new google.maps.LatLng(markers[i][1], markers[i][2]);
      // bounds.extend(position);
      var marker = new google.maps.Marker({
      position: position,
      // returns address on hover
      title: markers[i][0],
      icon: '/assets/garbage-marker-22px.png',
      map: map
      });

    // Allow each marker to have an info window
    //no clue what these lines do????
    google.maps.event.addListener(marker, 'click', (function(marker, i) {
      return function() {
      infoWindow.setContent(infoWindowContent[i][0]);
      infoWindow.open(map, marker);

      }
    })(marker, i));

    // Automatically center the map fitting all markers on the screen
    // map.fitBounds(bounds);

    }


    // Override our map zoom level once our fitBounds function runs (Make sure it only runs once) WUT?
    // var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function(event) {
    //   this.setZoom(7);
    //   google.maps.event.removeListener(boundsListener);
    // });

    var placeSearch, autocomplete;
    var componentForm = {
      street_number: 'short_name',
      route: 'long_name',
      locality: 'long_name',
      administrative_area_level_1: 'short_name',
      country: 'long_name',
      postal_code: 'short_name'
    };




};
