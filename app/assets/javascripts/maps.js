
function initMap() {


  var map = new google.maps.Map(document.getElementById('map'), {
  center: {lat: 51.2538, lng: 85.3232},
  zoom: 8
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

    // Display multiple markers on a map
    //new variables initialized
    var infoWindow = new google.maps.InfoWindow(), marker, i;
    // Loop through our array of markers & place each one on the map
    for( i = 0; i < markers.length; i++ ) {
      var position = new google.maps.LatLng(markers[i][1], markers[i][2]);
      // bounds.extend(position);
      marker = new google.maps.Marker({
      position: position,
      map: map,
      // returns address on hover
      title: markers[i][0]
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
    var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function(event) {
      this.setZoom(14);
      google.maps.event.removeListener(boundsListener);
    });

}
