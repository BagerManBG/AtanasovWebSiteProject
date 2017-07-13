$.ajax({
  type: "POST",
  url: "Controllers/Levels/getDifficultyLevels.php",
  success: function(data){
    var obj = JSON.parse(data);

    for (var i in obj) {
      var level = obj[i];
      var div = $('<div class="level">' + level["name"] + '</div>');
      var link = $('<a href="#/levels/' + level['id'] + '/details"></a>');
      link.append(div);
      $('#levels').append(link);
    }
  }
});
