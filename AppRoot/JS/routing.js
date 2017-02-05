$(document).ready(function() {
  (function () {
      var router = Sammy(function() {
          var selector = '#view-content';
          var main = $(selector);
          path = 'Resources/Templates/';

          this.get('#/home', function() {
            $.get(path + 'home.html', function(templ) {
              bringBackHeader();
              main.html(templ);
            });
          });

          this.get('#/chat-admin', function() {
            $.get(path + 'chat_admin.html', function(templ) {
              addHeader();
              checkAdmin(templ);
            });
          });

          this.get('#/profile', function() {
            $.get(path + 'profile.html', function(templ) {
              addHeader();
              checkLogged(templ);
            });
          });

          this.get('#/courses', function() {
            $.get(path + 'courses/index.html', function(templ) {
              addHeader();
              main.html(templ);
            });
          });

          this.get('#/courses/:id/details', function() {
            sessionStorage.setItem('id', this.params['id']);
            $.get(path + 'courses/details.html', function(templ) {
              addHeader();
              main.html(templ);
            });
          });

          this.get('#/courses/:id/edit', function() {
            sessionStorage.setItem('id', this.params['id']);
            $.get(path + 'courses/edit.html', function(templ) {
              addHeader();
              checkAdmin(templ);
            });
          });

          this.get('#/courses/create', function() {
            $.get(path + 'courses/create.html', function(templ) {
              addHeader();
              checkAdmin(templ);
            });
          });

          this.get('#/online-courses', function() {
            $.get(path + 'online_courses/index.html', function(templ) {
              addHeader();
              main.html(templ);
            });
          });

          this.get('#/online-courses/create', function() {
            $.get(path + 'online_courses/create.html', function(templ) {
              addHeader();
              checkAdmin(templ);
            });
          });

          this.get('#/login', function() {
            $('#formContainer').show();
            $('#mask').show();
          });

          this.get('#/lectures', function() {
            $.get(path + 'Lectures/calendar.html', function(templ) {
              addHeader();
              checkAdmin(templ);
            });
          });

          function addHeader() {
              $('#header').attr('class', '');
              $('#header nav').attr('class', 'nav-scroll');
              $('#header nav ul').attr('class', 'scroll');
              main.attr('style', 'padding-top: 120px');
          }

          function bringBackHeader() {
            $('#header').attr('class', 'module parallax parallax-1');
            $('#header nav').attr('class', 'nav-scroll');
            $('#header nav ul').attr('class', 'scroll');
            main.attr('style', '');
          }

          function checkLogged(template) {
            $.ajax({
              url: 'Controllers/Account/checkLoggedIn.php',
              method: 'GET',
              success: function(result) {
                if (result == 'logged') {
                  main.html(template);
                } else {
                  main.html('<h3>Not authorized</h3>');
                }
              }
            });
          }

          function checkAdmin(template) {
            $.ajax({
              url: 'Controllers/Account/checkRole.php',
              method: 'GET',
              success: function(result) {
                if (result == 'admin') {
                  main.html(template);
                } else {
                  main.html('<h3>Not authorized</h3>');
                }
              }
            });
          }

          /*this.before({except:{path:'#\/(login\/|register\/)?'}}, function() {
              if(!sessionStorage['sessionId']) {
                  this.redirect('#/');
                  return false;
              }
          });

          this.before(function() {
              if(!sessionStorage['sessionId']) {
                  $('#menu-home').hide();
                  $('#menu-login').show();
              } else {
                  $('#menu-login').hide();
                  $('#menu-home').show();
              }
          });*/
        });
      router.run('#/');
  })();
});
