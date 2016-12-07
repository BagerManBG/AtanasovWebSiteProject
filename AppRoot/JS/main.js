$(document).ready(function(){

  DynamicNav();
  UserHandler();
});

function DynamicNav() {

  $(window).scroll(function() {

    if ($(document).scrollTop() > 160) 
    {
      $("ul").addClass("scroll");
      $("nav").addClass("nav-scroll");
    } 
    else 
    {
      $("ul").removeClass("scroll");
      $("nav").removeClass("nav-scroll");
    }
  });
}

function UserHandler() {

  $.ajax({
    url: 'Controllers/Account/getUserName.php',
    method: 'GET',
    success: function(result) {

      $('.dynamic').remove();

      var htmlToAdd;

      if(result == '')
      {
        htmlToAdd = "<li><a href='Resources/Templates/login_register.html' class='dynamic'>Register</a></li><li><a href='Resources/Templates/login_register.html' class='dynamic'>Log In</a></li>";
      }
      else
      {
        htmlToAdd = "<li><a href='Controllers/Account/logout.php' class='dynamic'>Log Out</a></li>";
        var userNameHTML = "<h1 class='dynamic'>Welcome, " + result + "</h1>";
        $('#username').prepend(userNameHTML);
      }

      $('#links').prepend(htmlToAdd);
    }
  });
}