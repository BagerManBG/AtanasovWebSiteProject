$(document).ready(function(){

	$('#typing').hide();

	$('#list_users').on('click', '.user', function(){

		$('#typing').show();

		var id = $(this).attr('id');

		$.ajax({
			url: 'Controllers/Chat/getUserInfo.php',
			method: 'POST',
			data: {id: id},
			success: function(result) {
				if(result != 'error')
				{
					var data = JSON.parse(result);

					var name = data['first_name'] + ' ' + data['last_name'];

					$('.chatBody #typing #user_id').val(data['id']);
					$('#selectedName').text(name + " (" + data["email"] + ")");
				}
			}
		});
	});
});
