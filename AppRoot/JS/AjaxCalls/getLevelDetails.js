var id = getQueryVariable("id");

function deleteLevel() {
  if (confirm('Delete level?')) {
    $.ajax({
      type: "POST",
      url: "Controllers/Levels/difficulty_levels_controller.php",
      data: { 'action': 'delete', 'id': id },
      success: function(result) {
        // TO-DO: redirect
      }
    });
  }
}

$.ajax({
  type: "POST",
  url: "Controllers/Levels/getDifficultyLevelById.php?id=" + id,
  success: function(data){
    var obj = JSON.parse(data);
    $('#title').html(obj[0]["name"]);
    $('#edit-btn').attr("href", "#/levels/" + id + "/edit");
    $('#delete-btn').attr("href", "delete.html?id=" + id);
  }
});

$.ajax({
  type: "POST",
  url: "Controllers/Courses/getCoursesByLevel.php?level=" + id,
  success: function(data){
    var obj = JSON.parse(data);

    for (var i in obj) {
      var course = obj[i];
      var div = $('<div class="course">' + course["name"] + '</div>');
      var link = $('<a href="#/courses/' + course['id'] + '/details"></a>');
      link.append(div);
      $('#courses').append(link);
    }

    if (obj.length == 0) {
      $('#courses').append($('<p>No courses available yet!</p>'));
    }
  }
});

$.ajax({
  type: "GET",
  url: "Controllers/Account/checkRole.php",
  success: function(role){
    if (role == 'admin') {
      var adminActions = $('<hr /><div id="operations"><a class="btn btn-warning" href="#/levels/' + id + '/edit">Edit</a><button class="btn btn-danger" onclick="deleteLevel()">Delete</button></div>');
      $('.emo').append(adminActions);
    }
  }
});
