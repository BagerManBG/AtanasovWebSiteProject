var id = getQueryVariable("id");

$.ajax({
  type: "POST",
  url: "Controllers/Lectures/checkIfAlreadyBooked.php?id=" + id,
  success: function(data) {

    var obj = JSON.parse(data);
    if (obj.length > 0) {
      $('#hall').html('<p>Already booked a seat!</p>');
    }
  }
});

$.ajax({
  type: "POST",
  url: "Controllers/Lectures/getFreeSeats.php?id=" + id,
  success: function(data) {
    var obj = JSON.parse(data);
    if (obj.length == 0) {
      $('#hall').html('<p>No free seats</p>');
    } else {
      for (var index in obj) {
        seat = obj[index];
        var button = $('#seat-' + seat.seat_index + ' button');
        button.attr('disabled', false);
        button.html('Choose seat');
      }
    }
  }
});

function book(index) {
  $.ajax({
    type: 'POST',
    url: 'Controllers/Lectures/lectures_controller.php',
    data: { "action": 'book', 'seat_index': index, "lecture_id": id },
    success: function(data) {
      location.href = "#/lectures";
      location.reload();
    }
  });
}
