var interval;
var id;

$(document).ready(function(){

	$('#list_users').on('click', '.user', function(){

		$('.chatBody #chatContent').empty();

		var messages = new Array();
		id = $(this).attr('id');
		
		setInterval(function(){

			$.ajax({
				url: '../../Controllers/Chat/getMessages.php',
				method: 'POST',
				data: {user_id: id},
				success: function(result) {
					
					if(result != '')
					{
						var data = JSON.parse(result);

						if(messages.length != data.length)
						{
							messages = data;
							$('.chatBody #chatContent').empty();

							for (var i = 0; i < data.length; i++) 
							{ 
								var msg = data[i]['message'];
								var sender = data[i]['sender_id'];
								var receiver = data[i]['receiver_id'];

								var target = null;

								if(sender == id)
								{
									target = 'otherMessage';
								}
								else if(receiver == id)
								{
									target = 'ownMessage';
								}

								var messageHTML = "<div class='" + target + "'><p class='messages'>" + msg + "</p></div>"

								$('.chatBody #chatContent').append(messageHTML);
							}

							ScrollBottom();
						}
					}
				}
			});
		}, 1000);
	});
});

function ScrollBottom() {

	var elem = document.getElementById('chatContent');
  	elem.scrollTop = elem.scrollHeight;
}