$(document).ready(function() {
  function changeType() {
    var type = $('#type');
    var content = $('#content').val();
    $('#content').remove();

    if (type.val() == 2 || type.find(':selected').val() == "2") {
      $('#content-div').append('<input type="file" class="form-control" style="resize: vertical;" name="content" id="content" value="' + content + '"/>');
    } else {
      $('#content-div').append('<textarea class="form-control" style="resize: vertical;" name="content" id="content">' + content + '</textarea>');
    }
  }

  changeType();

  $('#type').on('change', function() {
    changeType();
  });
});
