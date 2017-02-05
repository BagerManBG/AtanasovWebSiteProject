$(document).ready(function(){

	setInterval(function(){
		$.ajax({
			url: 'Controllers/Chat/updateLastOnline.php',
			method: 'POST'
		});
	}, 1000);
});
