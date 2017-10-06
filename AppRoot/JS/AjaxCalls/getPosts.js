$.ajax({
  type: "POST",
  url: "Controllers/Posts/getPosts.php",
  success: function(data) {
    var obj = JSON.parse(data);
    var count = obj.length
    var index = 0;
    var indices = [];

    for (var i = 0; i < obj.length; i++) {
      indices.push(obj[i]["post_index"]);
    }

    var zeroIndex = indices.indexOf('0');

    if (zeroIndex == -1) {
      zeroIndex = indices.length / 2;
    }

    for (var i = 0; i < zeroIndex; i++) {
      indices[i] = -(zeroIndex - i);
    }

    for (var i = 0; i < indices.length - zeroIndex; i++) {
      indices[i + zeroIndex] = i;
    }

    for (var i in obj) {
      index = indices[i];
      var post = obj[i];
      var postDiv = $('<div class="post slide" id="post_' + (index) + '"></div>');
      var links = $('<div class="links"><a href="#/posts/' + post["id"] + '/edit" class="btn btn-warning">Edit</a><button onclick="deletePost(' + post["id"] + ')" class="btn maika btn-danger">Delete</button></div>');
      var postElement = null;

      switch (post["type"]) {
        case "0":
          postElement = $('<p>' + post["content"] + '</p>');
          break;
        case "1":
          var src = post["content"].replace("watch?v=", "embed/");
          postElement = $('<iframe frameborder="0" allowfullscreen width="100%" height="100%" src="' + src + '"></iframe>');
          break;
        case "2":
          postElement = $('<img src="' + post["content"] + '" />');
          break;
        default:
          break;
      }

      postElement.attr('class', 'content');
      postDiv.append(postElement);
      postDiv.append(links);
      $('#posts').append(postDiv);
    }

    if (indices.length > 0 && location.href.endsWith("#/home")) {
      startSlideshow(indices);
    }
  }
});
