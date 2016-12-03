alert(9);
$(document).ready(function(){
  $( "#Edit" ).click(function() {
        $("input").removeAttr('disabled');
});

  $( "#Cancel" ).click(function() {
        $("input").val('');
        $("input").prop('disabled', true);

});
});