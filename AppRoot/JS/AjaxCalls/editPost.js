var id = getQueryVariable("id");

$.ajax({
  type: "POST",
  url: "Controllers/Posts/getPostsById.php?id=" + id,
  success: function(data){
    var obj = JSON.parse(data);
    $("#id").attr('value', obj[0]["id"]);
    $("#type").val(obj[0]["type"]);
    $("#index").val(obj[0]["post_index"]);
    $("#content").html(obj[0]["content"]);
  }
});
