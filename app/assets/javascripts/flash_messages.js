function closeFlashMessage(fm) {
  $(fm).fadeOut('slow', function() {
    $(fm).remove();
  });
}

function buildFlashMessage(str, type) {
  var new_fm = $('<div class="flash_message ' + type + '">' +
    '<a href="#" class="close_message">x</a>' +
    str +
    '</div>');
  $('#flash_messages').append(new_fm);
  $(new_fm).fadeIn('slow');

  setTimeout(function () {
    closeFlashMessage(new_fm);
  }, 3000);
}

function showFlashMessage(str) {
  buildFlashMessage(str);
}

function showFlashError(str) {
  buildFlashMessage(str, "error");
}

function showFlashInfo(str) {
  buildFlashMessage(str, "info");
}

function showAjaxLoading() {
  $('#ajax-loading').show();
}

function hideAjaxLoading() {
  $('#ajax-loading').hide();
}

$(document).ready (function () {
  $('.flash_message > .close_message').live('click', function(evt) {
    evt.preventDefault();
    closeFlashMessage($(evt.target).parents('.flash_message'));
  });
})
