$( document ).ready(function() {
    console.log( "ready!" );
    $('.positionLeft').click(function(){
    	$('.regAction').hide()
    	$('.logAction').show()
    });
    $('.positionRight').click(function(){
    	$('.logAction').hide()
    	$('.regAction').show()
    });
});
