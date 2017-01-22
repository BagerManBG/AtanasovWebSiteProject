$(document).ready(function(){
  $( "#Edit" ).click(function() {
        $("input").prop('disabled', false);
        
});

  $( "#Cancel" ).click(function() {
        $("input").prop('disabled', true);


});

  $( ".password" ).hide();

   $( ".control_1" ).click(function() {
        $( ".password" ).fadeOut(300);
        $( ".names" ).delay(300).fadeIn(300);
    });

   $( ".control_2" ).click(function() {
        $( ".password" ).delay(300).fadeIn(300);
        $( ".names" ).fadeOut(300);
    });
});