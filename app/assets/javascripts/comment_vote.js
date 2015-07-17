$(document).ready(function(){
  $(".comment").on('submit', function(event){
    event.preventDefault();
    var divID = $(this).attr('id');
    var $target = $(event.target);
    $.ajax({
      url: $target[0].action,
      method: $target[0].method,
      data: $target.serialize(),
      dataType: 'json'
    })
    .done(function(voteData){
      $("#span" + divID).text(voteData.vote_count);
    })
    .fail(function(error){
      console.log(error, "obnoxious panda");
    });
  })
});
