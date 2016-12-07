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
$(function(){

    $('.file-input > input').on('change',function(){

        var inputValue = $(this).val();

        $('.input-value').html(inputValue);

    });

    $('.file-input > input').on('mouseenter',function(){

        $('.input-value').css("color","#FFCC00")
    });

     $('.file-input > input').on('mouseleave',function(){

        $('.input-value').css("color","#101010")
    });

});

/*$('.validation').keyup(function(){
    var $this = $(this);
    var data = {
        "value": $this.val(),
        "name": $this.attr("name")
    }
    
    $.ajax({
        url: "php/val.php",
        type: "POST",
        data: data,
        success: function(result){
            console.log("result: ", result);
            var result = $.parseJSON(result);
            $this.parents(".white_space").find("label").text(result.text).css('color', result.color);
            if(result.status == 1){
                $this.removeClass('correct');
            }
            else{
                $this.addClass('correct');
            }
        }
    })
});*/
