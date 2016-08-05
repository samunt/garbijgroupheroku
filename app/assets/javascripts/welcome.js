$(document).on('ready', function() {
var $animation_elements = [$('.when-you-sell'), $('.when-you-buy'), $('.signup-container'), $('.login-container')] ;
var $window = $(window);



function check_if_in_view() {
  var window_height = $window.height();
  var window_top_position = $window.scrollTop();
  var window_bottom_position = (window_top_position + window_height);

  $.each($animation_elements, function() {
    var $element = $(this);
    var element_height = $element.outerHeight();
    var element_top_position = $element.offset().top;
    var element_bottom_position = (element_top_position + element_height);

    //check to see if this current container is within viewport
    if ((element_bottom_position >= window_top_position) &&
        (element_top_position <= window_bottom_position)) {
        if ($($element).hasClass( "when-you-sell" )) {
          $element.addClass('fadeInLeftBig');
        }
        else if ($($element).hasClass( "when-you-buy" )) {
          $element.addClass('fadeInRightBig');
        }
        else if ($($element).hasClass( "signup-container" )) {
          $element.addClass('fadeInUpBig');
        }
        else if ($($element).hasClass( "login-container" )) {
          $element.addClass('fadeInUpBig');
        }
    }
  });
}

$window.on('scroll', check_if_in_view);
$window.trigger('scroll');

$('.btn-front').on('click', function (){

     $('.placeholder-info').hide();

     $('html, body').animate({
       scrollTop: $('.intro-form').offset().top }, 1000);

     });

     $('downward-scroll').on('click', function (){

          $('.placeholder-info').hide();

          $('html, body').animate({
            scrollTop: $('.container').offset().top }, 1000);

          });

});
