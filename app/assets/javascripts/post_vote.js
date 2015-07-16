$(document).ready(function(){
  $(".up_vote").on('submit', function(event){
    event.preventDefault();
    var $target = $(event.target);
    $.ajax({
      url: $target[0].action,
      method: "put",//$target[0].method,
      data: $target.serialize(),
      dataType: 'json'
    })
    .done(function(voteData){
      console.log('hi')
      $(".vote_count").text(voteData.post_vote)
    })
    .fail(function(error){
      console.log(error, "fail panda")
    });
  })
});
