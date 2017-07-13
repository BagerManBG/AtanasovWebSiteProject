$.ajax({
  type: "POST",
  url: "Controllers/Courses/getCourses.php",
  success: function(data){
    var obj = JSON.parse(data);

    for (var i in obj) {
      var course = obj[i];
      var div = $('<div class="course"></div>');
      var link = $('<h4>' + course["name"] + '</h4><hr /><p>' + course["description"] + '</p><a class="button" href="#/courses/' + course["id"] + '/details">Learn more...</a>');
      div.append(link);
      $('#courses').append(div);
    }
  }
});
