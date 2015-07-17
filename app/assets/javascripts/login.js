$(document).ready(function(){
  $("#login").on('click', function(event){
    event.preventDefault();
    var $target = $(event.target)
    $.ajax({
      url: "/login",
      data: $target.serialize()
    })
    .done(function(loginForm){
      $("#login").toggle(false)
      $("body").prepend(loginForm)
    })
    .fail(function(error){
      console.log(error, "fail panda")
    });
  })
});
