$('.count').each(function () {
    $(this).prop('Counter',0).animate({
        Counter: $(this).text()
    }, {
        duration: 4000,
        easing: 'swing',
        step: function (now) {
            $(this).text(Math.ceil(now));
      }
    });
});

// $(function() {
//   $("form.new_space").on("ajax:success", function(event, data, status, xhr) {
//     alert('created new space')
//     console.log("created new space")
    // var fulladdress;
    // $("form.new_building")[0].reset();
    // $('#new-building-modal').modal('hide');
    // fulladdress = data.address + " (" + data.name + ", " + data.city + ", " + data.zip + ")";
    // $('#tour_building_tokens').tokenInput("add", {
    //   id: data.id,
    //   address: fulladdress
    // });
    // return $('#error_explanation').hide();
  // });
  // return $("form.new_space").on("ajax:error", function(event, xhr, status, error) {
  //   $('#mynewpost').modal('hide')
  //   alert('Sorry! You can only own 3 garbage spaces')
    // var e, errorcount, errors, i, len;
    // errors = jQuery.parseJSON(xhr.responseText);
    // errorcount = errors.length;
    // $('#error_explanation').empty();
    // if (errorcount > 1) {
    //   $('#error_explanation').append('<div class="alert alert-error">The form contains ' + errorcount + ' errors.</div>');
    // } else {
    //   $('#error_explanation').append('<div class="alert alert-error">The form contains 1 error</div>');
    // }
    // $('#error_explanation').append('<ul>');
    // for (i = 0, len = errors.length; i < len; i++) {
    //   e = errors[i];
    //   $('#error_explanation').append('<li>' + e + '</li>');
    // }
    // $('#error_explanation').append('</ul>');
    // return $('#error_explanation').show();
  // });
// });

// ---
// generated by coffee-script 1.9.2
