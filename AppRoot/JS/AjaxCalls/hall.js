var id = getQueryVariable("id");

function unbook(user_id) {
  if (confirm("Unbook student?")) {
    $.ajax({
      type: 'POST',
      url: 'Controllers/Lectures/lectures_controller.php',
      data: { "action": 'unbook', 'user_id': user_id, "lecture_id": id },
      success: function(data) {
        location.reload();
      }
    });
  }
}

$.ajax({
  type: "POST",
  url: "Controllers/Lectures/getTakenSeats.php?id=" + id,
  success: function(data) {
    var obj = JSON.parse(data);

    for (var index in obj) {
      seat = obj[index];
      var button = $('#seat-' + seat.seat_index + ' button');
      button.attr('disabled', false);
      button.html(seat.email + '<br />UNBOOK');
      button.on('click', function() {unbook(seat.user_id)});
    }
  }
});
