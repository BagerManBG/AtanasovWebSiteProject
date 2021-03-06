function deleteLecture(id) {
  if (confirm('Delete lecture?')) {
    $.ajax({
      type: "POST",
      url: "Controllers/Lectures/lectures_controller.php",
      data: { 'action': 'delete', 'id': id },
      success: function(result) {
        location.reload();
      }
    });
  }
}

$(document).ready(function() {

  $('#calendar').fullCalendar({
      events: 'Controllers/Lectures/getLectures.php',
      header: {
        left: 'prev,next today addEvent',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      weekNumbers: true,
      eventClick: function(event) {
        $('#events-modal').modal();
        $('#title').html("&nbsp;" + event.title);
        $('#start').html('<i class="fa fa-calendar-plus-o"></i>&nbsp;<b>Start</b>: ' + event.date + ' ' + event.startTime);
        $('#end').html('<i class="fa fa-calendar-plus-o"></i>&nbsp;<b>End</b>: ' + event.date_end + ' ' + event.endTime);
        $('#description').html('<i class="fa fa-calendar-check-o"></i>&nbsp;<b>Description</b>: ' + event.description);
        //$('#course').html('<i class="fa fa-calendar-check-o"></i>&nbsp;<b>Course</b>: <a href="#/courses/' + event.courseId + '/details">' + event.name + '</a>');
        $('#book').attr('href', '#/lectures/' + event.id + '/book');

        var now = moment();
        if (now.isAfter(event.end)) {
          $('#book').hide();
        }

        $.ajax({
          type: "GET",
          url: "Controllers/Account/checkRole.php",
          success: function(role){
            if (role == 'admin') {
              var admin = $('#admin-ops');
              admin.html('');
              var adminActions = $('<div class="modal-footer"><a class="btn btn-default" href="#/lectures/' + event.id + '/hall">Manage seats</a><a class="btn btn-warning" href="#/lectures/' + event.id + '/edit">Edit</a><button class="btn btn-danger" onclick="deleteLecture(' + event.id + ')">Delete</button></div>');
              admin.append(adminActions);
            }
          }
        });

        $.ajax({
          type: "GET",
          url: "Controllers/Lectures/checkIfAlreadyBooked.php?id=" + event.id,
          success: function(data) {
            if (JSON.parse(data).length > 0) {
              $('#book').hide();
            }
          }
        });

        $('#editLecture').attr('href', '#/lectures/' + event.id + '/edit');
      }
  });

  var date = getQueryVariable('date');

  if (date)
  {
    $('#calendar').fullCalendar('gotoDate', date);
  }
});
