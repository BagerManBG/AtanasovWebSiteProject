$(document).ready(function() {

    $('.chatBody #typing input').bind('keyup focus blur', function(){

		CheckInput();
	});
});

function CheckInput() {

	var img = $('.showContent').find('.chatBody #typing #sendIcon');
	var input = $('.chatBody #typing input');

	if (input.val() === '')
	{
		img.addClass('blurred');
	}
	else
	{
		img.removeClass('blurred');
	}
}