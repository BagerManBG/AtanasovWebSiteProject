var data;

$(document).ready(function(){

  $( "#Edit" ).click(function() {

      $("input").prop('disabled', false);
      $('#Edit').hide();
      $('#Save').show();
      $('#Cancel').show();
  });

  $( "#Cancel" ).click(function() {

      $("input").prop('disabled', true);
      $('#Save').hide();
      $('#Cancel').hide();
      $('#Edit').show();
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

        if(result != null && result != 'null') {
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
    $('input#skypeName').val(data['skype']);
    $('input#google_acc').val(data['gmail']);
}
