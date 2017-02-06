function getQueryVariable(variable)
{
  var item = sessionStorage.getItem(variable);
  if (item == null) {
    return(false);
  } else {
    sessionStorage.removeItem(variable);
    return item;
  }
}

function checkAdmin(htmlToAdd, parent) {
  $.ajax({
      url: 'Controllers/Account/checkRole.php',
      method: 'GET',
      success: function(result) {
        if (result == 'admin') {
          parent.append(htmlToAdd);
        }
      }
  });
}
