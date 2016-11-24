$(document).ready(function(){

  $('input').bind('keyup focus blur', function(){

    var label = $(this).prev('label');
    if ($(this).val() === '') {
      label.removeClass('active highlight');
    } else {
      label.addClass('active highlight');
    }
  });
});
