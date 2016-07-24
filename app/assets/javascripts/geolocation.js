$(function(){
  $('#find-nearby').on('click', function(){
    console.log('clicked')

    // Store the clicked element as 'button'
    var button = $(this);

    // Starting with 'button', get the parent form element and store as 'form'
    var form = button.parent();

    // Search the 'form' variable for an element with an id of 'quantity',
    // capture the value and store in 'quantity'
    var quantity = form.find('#quantity').val();

    // Create a new JavaScript object to store the data that we send to Rails.
    var data = {
      quantity: quantity
    };

    // Log out 'data' to confirm that it exists and is valid.
    console.log(data);

    // Submit AJAX request to '/transactions' endpoint.
    $.ajax({
      url: '/spaces',
      method: 'GET',
      data: data,
      dataType: 'html'
    }).done(function(responseData){
      console.log(responseData)
      $('.geolocation-list').html(responseData);
    })//end of AJAX



    // if("geolocation" in navigator){
    //   navigator.geolocation.getCurrentPosition(itWorked, itFailed);
    //
    // }else{
    //   alert("Geolocation not supported. Use a different computer!");
    // }//end of if
  })//end of click func

  function itWorked(position){ //What happens when getcurrentlocation works
    console.log("working")
    console.log(quantity);
    var lat = position.coords.latitude;
    var lon = position.coords.longitude;
    $.ajax({
      url: '/transactions',
      method: 'GET',
      data: {latitude :lat, longitude :lon},
      dataType: 'html'
    }).done(function(responseData){
      console.log(responseData)
      $('.geolocation-list').html(responseData);
    })//end of AJAX
  }//end of itWorked

  function itFailed(error){
    console.log("not working")
  }
});
