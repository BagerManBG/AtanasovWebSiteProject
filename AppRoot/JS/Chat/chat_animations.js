$(document).ready(function(){

	$('#chatBox').hide();

	$('#quesitonBubble').click(function(){

		$('#quesitonBubble').hide();
		$('#chatBox').fadeIn(400);
	});

	$('#close').click(function(){

		CloseChat();
	});

	$(document).keydown(function(e) {

	    if (e.keyCode == 27) 
	    {
	        CloseChat();
	    }   
	});

	$('#chatBody #type input').bind('keyup focus blur', function(){

		CheckInput();
	});

	
});

function CloseChat() {

	$('#chatBox').animate({
		opacity: 0.25,
		bottom: '-100%'
	}, 300, function(){

		$('#chatBox').css("opacity", "1");
		$('#chatBox').hide();
		$('#chatBox').css("bottom", "0.2%");
		$('#quesitonBubble').fadeIn(400);
	});
}

function CheckInput() {

	var img = $('#chatBox').find('#chatBody #type #send');
	var input = $('#chatBody #type input');

	if (input.val() === '')
	{
		img.addClass('blurred');
	}
	else
	{
		img.removeClass('blurred');
	}
}