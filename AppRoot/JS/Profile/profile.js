var data;

$(document).ready(function(){
  var passwordMode = false;

  $( "#Edit" ).click(function() {

      $("input").prop('disabled', false);
      $('#Edit').hide();
      $('#ChangePass').hide();
      $('#Save').show();
      $('#Cancel').show();
  });

  $( "#Cancel" ).click(function() {
    console.log(passwordMode);
    if (passwordMode) {
      $( ".names" ).delay(300).fadeIn(300);
      $( ".password" ).fadeOut(300);
      passwordMode = false;
    }

    $("input").prop('disabled', true);
    $('#Save').hide();
    $('#Cancel').hide();
    $('#Edit').show();
    $('#ChangePass').show();
    Refresh();
  });

  $("#ChangePass").click(function() {
      passwordMode = true;
      $( ".password" ).delay(300).fadeIn(300);
      $( ".names" ).fadeOut(300);
      $('.password input').attr('disabled', false);
      $('#ChangePass').hide();
      $('#Edit').hide();
      $('#Cancel').show();
      $('#Save').show();
  })

  $( ".password" ).hide();

  $( ".control_1" ).click(function() {

      $(".password" ).fadeOut(300);
      $( ".names" ).delay(300).fadeIn(300);
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
