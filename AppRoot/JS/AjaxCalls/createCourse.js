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
