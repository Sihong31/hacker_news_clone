$(document).ready(function(){
  $(".post").on('submit', function(event){
    event.preventDefault();
    var divID = $(this).attr("id");
    var $target = $(event.target);
    $.ajax({
      url: $target[0].action,
      method: $target[0].method,
      data: $target.serialize(),
      dataType: 'json'
    })
    .done(function(voteData){
      console.log('hi')
      $("#vote_count" + divID).text(voteData.post_vote);
    })
    .fail(function(error){
      console.log(error, "fail panda");
    });
  })
});
