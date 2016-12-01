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
	var first_name = $('#connect #connectFirstName').val();
	var last_name = $('#connect #connectLastName').val();
	var email = $('#connect #connectEmail').val();

	var data = {
		first_name: first_name,
		last_name: last_name,
		email: email
	};

	$.ajax({

		url: '../../Controllers/Chat/postChatUserData.php',
		method: 'POST',
		data: {data: data},
		success: function() {
			$('#connect').fadeOut(200);

			setTimeout(function(){

				$('#content').fadeIn(200);
				$('#type').fadeIn(200);
			}, 200);

			setInterval(function(){

				$.ajax({
					url: '../../Controllers/Chat/updateUserLastOnlineTime.php',
					method: 'POST',
					data: {email: email}
				});
			}, 1000);
		}
	});
}