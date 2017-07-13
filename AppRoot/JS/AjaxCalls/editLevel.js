var id = getQueryVariable("id");

$.ajax({
  type: "POST",
  url: "Controllers/Levels/getDifficultyLevelById.php?id=" + id,
  success: function(data){
    var obj = JSON.parse(data);
    $("#id").attr('value', obj[0]["id"]);
    $("#name").attr('value', obj[0]["name"]);
  }
});
