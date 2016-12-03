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
					$('.profileInfoContent').empty();
					$('.profileInfoContent').append(result);
				}
			}
		});
	});
});