$(document).ready(function(){
  $( "#Edit" ).click(function() {
        $("input").prop('disabled', false);
        
});

  $( "#Cancel" ).click(function() {
        $("input").prop('disabled', true);


});
});