var mapPlaceHolder = $('#map');
var latLong = {lat: mapPlaceHolder.data('latitude'), lng: mapPlaceHolder.data('longitude')};
var map;
function initMap(){
      map = new google.maps.Map(mapPlaceHolder[0], {
      center: latLong,
      zoom: 15
    });
};
