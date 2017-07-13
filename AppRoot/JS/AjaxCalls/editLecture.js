// $.ajax({
//   type: "POST",
//   url: "Controllers/Courses/getCourses.php",
//   success: function(data){
//     var obj = JSON.parse(data);
//     for (var i = 0; i < obj.length; i++) {
//       $("#courseId").append($('<option value=' + obj[i]["id"] + '>' + obj[i]["name"] + '</option>'));
//     }
//   }
// });

var id = getQueryVariable("id");

$.ajax({
  type: "POST",
  url: "Controllers/Lectures/getLectureById.php?id=" + id,
  success: function(data){
    var obj = JSON.parse(data);
    $("#id").attr('value', id);
    $("#title").attr('value', obj[0]["title"]);
    $('#description').html(obj[0]["description"]);
    $('#date').attr('value', obj[0]["date"]);
    $("#date_end").attr('value', obj[0]["date_end"]);
    $('#start').attr('value', obj[0]["start"]);
    $('#end').attr('value', obj[0]["end"]);
    // $('#courseId').val(obj[0]["course_id"]);
  }
});
