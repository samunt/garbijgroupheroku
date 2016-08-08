
$(function() {
  console.log("in function")
  $("form.new_space").on("ajax:success", function(event, data, status, xhr) {
    alert('created new space')
    console.log("created new space")
    $("#mynewpost").modal('hide');
    $(".post_title").val('');
    $(".post_content").val('');
    $("#container_posts").prepend('<%= j render @space %>');
    $("#post_<%= @space.id %>").hide().fadeIn(1000);
  });

  $("form.new_space").on("ajax:error", function(event, xhr, status, error) {
    console.log("exceeded limit of spaces")
    $('#mynewpost').modal('hide')
    alert('Sorry! You can only own 3 garbage spaces')
  });
});
