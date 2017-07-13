var id = getQueryVariable("id");

function deleteCourse() {
  if (confirm('Delete course?')) {
    $.ajax({
      type: "POST",
      url: "Controllers/Courses/courses_controller.php",
      data: { 'action': 'delete', 'id': id },
      success: function(result) {
        // TO-DO: redirect
      }
    });
  }
}

$.ajax({
  type: "POST",
  url: "Controllers/Courses/getCourseById.php?id=" + id,
  success: function(data) {
    var obj = JSON.parse(data);
    $('#name').html(obj[0]["name"]);
    $('#description').html(obj[0]["description"] + ")");
    $('#difficulty_level').html("(" + obj[0]["difficulty"] + ")");

    $('#edit-btn').attr("href", '#/courses/' + id + "/edit");
  }
});

$.ajax({
  type: "POST",
  url: "Controllers/Lectures/getLecturesByCourse.php?course=" + id,
  success: function(data){
    var obj = JSON.parse(data);
    for (var i in obj) {
      var lecture = obj[i];
      var div = $('<div class="lecture"></div>');
      var link = $('<div><h3><strong>' + lecture["title"] + '</strong></h3><p>' + lecture["description"] + '</p>');
      div.append(link);
      $('#lectures').append(div);
    }

    if (obj.length == 0) {
      $('#lectures').append($('<p>No lectures available yet!</p>'));
    }
  }
});

$.ajax({
  type: "GET",
  url: "Controllers/Account/checkRole.php",
  success: function(role){
    if (role == 'admin') {
      var adminActions = $('<hr /><div id="operations"><a class="btn btn-warning" href="#/courses/' + id + '/edit">Edit</a><button class="btn btn-danger" onclick="deleteCourse()">Delete</button></div>');
      $('.emo').append(adminActions);
    }
  }
});
