function vote(evt, vote) {
  var id = $(evt.currentTarget).data('id');
  var url = 'http://'+location.host+'/vote/';
  var data = {'vote': vote, 'id': id};

  $('.trust[data-id='+id+']').html(vote+'.0');

  $.post(url, data, function(response) {
    showFlashMessage(response);
  });
}

function voteUp(evt) {
  evt && evt.preventDefault();
  vote(evt, 1);
}

function voteDown(evt) {
  evt && evt.preventDefault();
  vote(evt, 0);
}

$(function() {
  $('.vote-up').click(voteUp);
  $('.vote-down').click(voteDown);
});

