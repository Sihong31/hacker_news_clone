$(document).ready(function(){
  $(".new_post_form").on('submit',function(event){
    event.preventDefault();
    var $target = $(event.target)
    $.ajax({
      url: $target[0].action,
      data: $target.serialize()
    })
    .done(function(postForm){
      $("#new_post_button").toggle(false);
      $("#new_post_form").html(postForm);
    })
    .fail(function(error){
      console.log(error, "fail panda")
    });
  })
  $("body").on('submit',".new_post",function(event){
    event.preventDefault();
    var $target = $(event.target)
    $.ajax({
      url: $target[0].action,
      method: $target[0].method,
      data: $target.serialize()
    })
    .done(function(postPartial){
      $(".posts").prepend(postPartial)
      $(".new_post").remove();
      $("#new_post_button").toggle(true);
    })
    .fail(function(error){
      console.log(error, "smelly panda")
    });
  })
});
