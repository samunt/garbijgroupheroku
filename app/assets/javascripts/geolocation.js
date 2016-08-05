$(function(){



  $('#find-nearby').on('click', function(){
    console.log('clicked')

    if("geolocation" in navigator){
      navigator.geolocation.getCurrentPosition(itWorked, itFailed);

    }else{
      alert("Geolocation not supported. Use a different computer!");
    }//end of if
});

function getQuantity(){
  // var button = $(this);
  // var form = button.parent();
  var quantity = $('#quantity').val();
  // var quantity = form.find('#quantity').val();
  quantity = parseInt(quantity);
  return quantity;
}

  function itWorked(position){ //What happens when getcurrentlocation works
    var quantity = getQuantity();
    console.log("working")
    var lat = position.coords.latitude;
    var lon = position.coords.longitude;
    $.ajax({
      url: '/spaces',
      method: 'GET',
      data: {latitude : lat, longitude : lon, 'quantity' : quantity},
      dataType: 'html'
    }).done(function(responseData){
      console.log(responseData)
      $('.geolocation-list').html(responseData);
    })//end of AJAX
  }//end of itWorked

  function itFailed(error){
    console.log("not working")
  }

// This is where the AJAx is going to go. The button is on the /user/:id page
//It will take data from the /user/id/spaces/id page
//Data will transplant to the
    $('.sell_link').on('click', function(e){
      console.log("BUTTON CLICK OMG")
      e.preventDefault();
      $.ajax({
        url: $(this).attr('href'),
        method: 'get',
        data: { },
        dataType: 'html'
      }).done(function(responseData){
        console.log(responseData)
        $('#dropsellspacehere').html(responseData);
      });
    });








});

// $(function(){
//   $("#geo-input-address").geocomplete()
// });

function initialize() {

var input = document.getElementById('searchTextField');
var autocomplete = new google.maps.places.Autocomplete(input);
}

google.maps.event.addDomListener(window, 'load', initialize);
