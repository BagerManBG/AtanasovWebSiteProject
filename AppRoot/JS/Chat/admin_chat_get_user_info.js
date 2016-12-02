$(document).ready(function(){

	$('#list_users').on('click', '.user', function(){

		var id = $(this).attr('id');

		$.ajax({
			url: '../../Controllers/Chat/getUserInfo.php',
			method: 'POST',
			data: {id: id},
			success: function(result) {
				if(result != 'error')
				{
					$('.profileInfoContent').empty();
					$('.profileInfoContent').append(result);
				}
			}
		});
	});
});