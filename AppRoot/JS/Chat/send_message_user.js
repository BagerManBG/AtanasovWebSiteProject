$(document).ready(function(){

	$('#send').click(function(){

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

	var data = {
		message: $('#chatBody #type input').val(),
		sender_id: getId('user'),
		receiver_id: getId('admin')
	};

	$('#chatBody #type input').val('');
	$('#send').addClass('blurred');

	$.ajax({
		url: '../../Controllers/Chat/sendMessage.php',
		method: 'POST',
		data: {message_data: data}
	});

}

function getId(person) {

	var id;

	if(person === 'user')
	{
		var url = '../../Controllers/Chat/getLoggedUserId.php';
	}
	else if(person === 'admin')
	{
		var url = '../../Controllers/Chat/getAdminId.php';
	}

	$.ajax({
		url: url,
		method: 'GET',
		async: false,
		success: function(result) {

			id = result;
		}
	});

	return id;
}