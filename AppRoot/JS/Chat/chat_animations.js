$(document).ready(function(){

	$('.close').click(function(){

		var chat = $(this).parent().parent();
		CloseChat(chat);
	});

	$('.chatBody .type input').focus(function(){

		var chat = $(this).parent().parent().parent();

		$(document).keydown(function(e) {

		    if (e.keyCode == 27) 
		    {
		        CloseChat(chat);
		    }   
		});
	});

	$('.chatBody .type input').bind('keyup focus blur', function(){

		var chat = $(this).parent().parent().parent();
		var img = chat.find('.chatBody .type .send img');

		if ($(this).val() === '')
		{
			img.addClass('blurred');
		}
		else
		{
			img.removeClass('blurred');
		}
	});

	//Can't make this to work
	/*$('.chatHeader').click(function(){

		var chat = $(this).parent();
		chat.addClass('minimised');
	});*/
});

function CloseChat(chat) {

	chat.animate({
		opacity: 0.25,
		bottom: '-100%'
	}, 300, function(){
		chat.remove();
	});
}