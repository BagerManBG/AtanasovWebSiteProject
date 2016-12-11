$(document).ready(function(){

	$('#sendIcon').click(function(){

		SendMessage();
	});

	$(document).keypress(function(e) {

	    if(e.which == 13) 
	    {
	        SendMessage();
	    }
	});
});

function SendMessage() {

	if ($('.chatBody #typing #message_input').val() != '') {

		var data = {
			message: $('.chatBody #typing #message_input').val(),
			sender_id: getId('admin'),
			receiver_id: getId('user')
		};

		$('.chatBody #typing #message_input').val('');
		$('#sendIcon').addClass('blurred');

		$.ajax({
			url: '../../Controllers/Chat/sendMessage.php',
			method: 'POST',
			data: {message_data: data}
		});
	}
}

function getId(person) {

	var id;

	if(person === 'user')
	{
		id = $('.chatBody #typing #user_id').val();
	}
	else if(person === 'admin')
	{
		$.ajax({
			url: '../../Controllers/Chat/getAdminId.php',
			method: 'GET',
			async: false,
			success: function(result) {

				id = result;
			}
		});
	}

	return id;
}