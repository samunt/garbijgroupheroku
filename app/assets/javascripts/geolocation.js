$(function(){
  $('#find-nearby').on('click', function(){
    console.log('clicked')
    if("geolocation" in navigator){
      navigator.geolocation.getCurrentPosition(itWorked, itFailed);
    }else{
      alert("Geolocation not supported. Use a different computer!");
    }//end of if
  })//end of click func

  function itWorked(position){ //What happens when getcurrentlocation works
    console.log("working")
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
