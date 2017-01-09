$(document).ready(function(){
  $( "#Edit" ).click(function() {
        $("input").prop('disabled', false);
        
});

  $( "#Cancel" ).click(function() {
        $("input").prop('disabled', true);


});

  $( ".password" ).hide();
  $( ".control_2" ).click(function() {
        $( ".password" ).show();
        $( ".names" ).hide();

    });

   $( ".control_1" ).click(function() {
        $( ".password" ).hide();
        $( ".names" ).show();
    });
});


   