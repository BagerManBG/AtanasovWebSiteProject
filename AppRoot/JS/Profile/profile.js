var data;

$(document).ready(function(){

  $( "#Edit" ).click(function() {

      $("input").prop('disabled', false);
  });

  $( "#Cancel" ).click(function() {

      $("input").prop('disabled', true);
      Refresh();
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

  $.ajax({
      url: 'Controllers/Account/getProfileData.php',
      method: 'GET',
      success: function(result) {

        if(result != null) {

            data = JSON.parse(result);

            Refresh();
        }
      }
  });
});

function Refresh() {

    $('input#first_name').val(data['first_name']);
    $('input#last_name').val(data['last_name']);
    $('input#email').val(data['email']);
}
