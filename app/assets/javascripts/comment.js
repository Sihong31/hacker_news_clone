$(document).ready(function(){
  $(".new_comment_form").on('submit', function(event){
    event.preventDefault();
    var $target = $(event.target);
  $.ajax({
    url: $target[0].action,
    method: $target[0].method,
    data: $target.serialize(),
  })
  .done(function(commentForm){
    $(".new_comment_form").toggle(false);
    $("#show_ajax_form").html(commentForm);
  })
  .fail(function(error){
    console.log(error, "obese panda");
  })
 })
  $("body").on('submit',".new_comment",function(event){
   event.preventDefault();
   var $target = $(event.target);
   $.ajax({
     url: $target[0].action,
     method: $target[0].method,
     data: $target.serialize()
   })
   .done(function(commentPartial){
     $("ol").append(commentPartial);
     $(".new_comment").remove();
     $(".new_comment_form").toggle(true);
   })
   .fail(function(error){
     console.log(error, "uncool panda");
   })
 })
})
