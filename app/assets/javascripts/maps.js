
// var map;
function initMap(){

  var mapPlaceHolder = $('#map');

     var latLong = {lat: mapPlaceHolder.data('latitude'), lng: mapPlaceHolder.data('longitude')};
      map = new google.maps.Map(mapPlaceHolder[0], {
      center: latLong,
      zoom: 7
    });

    // var arrayLat =


  var Xname = mapPlaceHolder.data('name')


  var marker = new google.maps.Marker({
    position: latLong,
    map: map,
    title: Xname
  });

};
//
// var markers = [
//         ['<%= @spaces[0].title %>', '<%= @spaces[0].latitude %>','<%= @spaces[0].longitude %>'],
//         ['<%= @spaces[1].title %>', '<%= @spaces[1].latitude %>','<%= @spaces[1].longitude %>'],
//         ['<%= @spaces[2].title %>', '<%= @spaces[2].latitude %>','<%= @spaces[2].longitude %>'],
//         ['<%= @spaces[3].title %>', '<%= @spaces[3].latitude %>','<%= @spaces[3].longitude %>'],
//         ['<%= @spaces[4].title %>', '<%= @spaces[4].latitude %>','<%= @spaces[4].longitude %>']
//       ];
