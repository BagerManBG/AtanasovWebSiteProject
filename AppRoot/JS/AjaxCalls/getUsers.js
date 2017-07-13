$.ajax({
  type: "POST",
  url: "Controllers/Account/getUsers.php",
  success: function(data){
    var obj = JSON.parse(data);
    
    for (var i = 0; i < obj.length; i++) {
      var user = obj[i];
      var htmlToAdd = '<div class="user"><p>' + user.email + '</p><hr /><p>Full Name: ' + user.first_name + ' ' + user.last_name + '</p><p>Google Account: ' +
                user.google_acc + '</p><p>Skype: ' + user.skype + '</p><hr />';

      if (user["role_id"] == 3) {
        htmlToAdd += '<form action="Controllers/Account/unban.php" method="post"><input name="id" type="hidden" value="'
                   + user.id + '"/><input type="submit" class="btn btn-warning" value="UNBAN"/></form></div>';
      } else {
        htmlToAdd += '<form action="Controllers/Account/ban.php" method="post"><input name="id" type="hidden" value="'
                 + user.id + '"/><input type="submit" class="btn btn-danger" value="BAN"/></form></div>';
      }

      $('#users').append(htmlToAdd);
    }
  }
});
