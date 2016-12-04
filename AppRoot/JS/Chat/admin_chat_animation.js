$(document).ready(function() {

    $('.chatBody #typing #message_input').bind('keyup focus blur', function(){

		CheckInput();
	});
});

function CheckInput() {

	var img = $('.showContent').find('.chatBody #typing #sendIcon');
	var input = $('.chatBody #typing #message_input');

	if (input.val() === '')
	{
		img.addClass('blurred');
	}
	else
	{
		img.removeClass('blurred');
	}
}