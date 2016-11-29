$(document).ready(function(){

	$('#chatBox').hide();

	$('#content').hide();
	$('#type').hide();

	$('#connectButton').click(function(){

		ConnectToChat();
	});

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

function ConnectToChat() {

	var errorName = false;
	var errorMessage = false;
	var name = $('#connect #connectName').val();
	var message = $('#connect #connectMessage').val();
	var RegExpression = /^[a-zA-Z\s]*$/;

	if(!RegExpression.test(name))
	{
		name = '';
	}

	if(name.length < 3)
	{
		errorName = true;
	}

	if(message.length == '')
	{
		errorMessage = true;
	}

	if(errorName)
	{
		$('#connect #connectName').val('');
		$('#connect #connectName').attr('placeholder', 'Short, empty or had non letters');
	}
	else if(errorMessage)
	{
		$('#connect #connectMessage').val('');
		$('#connect #connectMessage').attr('placeholder', 'Empty');
	}
	else 
	{
		//send message here

		$('#connect').fadeOut(200);

		setTimeout(function(){

			$('#content').fadeIn(200);
			$('#type').fadeIn(200);
		}, 200);
	}
}