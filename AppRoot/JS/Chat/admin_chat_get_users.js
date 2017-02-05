$(document).ready(function(){

	setInterval(function(){

		$.ajax({
			url: 'Controllers/Chat/getOnlineUsers.php',
			method: 'GET',
			success: function(result) {

				$('#list_users').empty();
				$('#list_users').append(result);
			}
		});
	}, 1000);
});
