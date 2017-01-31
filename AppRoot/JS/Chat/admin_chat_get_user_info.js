$(document).ready(function(){

	$('#typing').hide();

	$('#list_users').on('click', '.user', function(){

		$('#typing').show();

		var id = $(this).attr('id');

		$.ajax({
			url: '../../Controllers/Chat/getUserInfo.php',
			method: 'POST',
			data: {id: id},
			success: function(result) {
				if(result != 'error')
				{
					var data = JSON.parse(result);

					var name = data['first_name'] + ' ' + data['last_name'];
					
					$('.chatBody #typing #user_id').val(data['id']);
					$('.profileInfoContent #profilePic img').attr('src', '../Images/ProfilePics/profile_default_image.jpg');
					$('.profileInfoContent .description #Name').text(name);
					$('.profileInfoContent .description #email').text(data['email']);
					$('#selectedName').text(name);
				}
			}
		});
	});
});