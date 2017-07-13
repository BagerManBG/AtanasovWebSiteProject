$.ajax({
  type: "POST",
  url: "Controllers/Levels/getDifficultyLevels.php",
  success: function(data){
    var obj = JSON.parse(data);
    for (var i = 0; i < obj.length; i++) {
      $("#difficulty_level").append($('<option value=' + obj[i]["id"] + '>' + obj[i]["name"] + '</option>'));
    }
  }
});

$(document).ready(function () {
  var id = getQueryVariable("id");

  $.ajax({
    type: "POST",
    url: "Controllers/Courses/getCourseById.php?id=" + id,
    success: function(data) {
      var obj = JSON.parse(data);
      $("#id").attr('value', id)
      $("#name").attr('value', obj[0]["name"]);
      $('#description').html(obj[0]["description"]);
      $('#students_capacity').attr('value', obj[0]["students_capacity"]);
      $('#difficulty_level').val(obj[0]["level_id"]);
    }
  });
});
