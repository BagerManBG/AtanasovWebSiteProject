$.ajax({
  type: "POST",
  url: "Models/ViewModels/getPosts.php",
  success: function(data){
    var obj = JSON.parse(data);

    for (var i in obj) {
      var post = obj[i];
      var postDiv = $('<div class="post"></div>')
      var postElement = null;

      if (post["type"] == 0) {
        postElement = $('<p>' + post["content"] + '</p>');
      } else {
        postElement = $('<iframe frameborder="0" allowfullscreen width="100%" height="500px" src="' + post["content"] + '"></iframe>');
      }

      postDiv.append(postElement);
      $('#posts').append(postElement);
    }
  }
});
