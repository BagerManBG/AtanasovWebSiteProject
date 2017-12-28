$(document).ready(function() {
  var down = true;
  var time = 500;

  $("#header").on('click', function() {
    var list = $('#list_users');

    if (down) {
      list.slideUp(time);
      down = false;
    } else {
      list.slideDown(time);
      down = true;
    }
  });

    $('#chatBody #typing #message_input').bind('keyup focus blur', function(){

		CheckInput();
	});
});

function CheckInput() {

	var img = $('.showContent').find('#chatBody #typing #sendIcon');
	var input = $('#chatBody #typing #message_input');

	if (input.val() === '')
	{
		img.addClass('blurred');
	}
	else
	{
		img.removeClass('blurred');
	}
}
