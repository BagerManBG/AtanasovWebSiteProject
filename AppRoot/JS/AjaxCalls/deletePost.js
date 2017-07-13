function deletePost(id) {
  if (confirm('Delete post?')) {
    $.ajax({
      type: "POST",
      url: "Controllers/Posts/posts_controller.php",
      data: { 'action': 'delete', 'id': id },
      success: function(result) {
        location.reload();
      }
    });
  }
}
