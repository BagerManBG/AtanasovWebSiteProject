$(document).ready(function() {
  (function () {

      var router = Sammy(function() {
          var selector = '#view-content';
          var main = $(selector);
          path = 'Resources/Templates/';

          this.get('#/', function() {
            window.location = path + 'root.html';
          });

          this.get('#/home', function() {
            $.get(path + 'home.html', function(templ) {
              bringBackHeader();
              main.html(templ);
            });
          });

          this.get('#/contacts', function() {
            $.get(path + 'contacts.html', function(templ) {
              bringBackHeader();
              main.html(templ);
            });
          });

          this.get('#/register', function() {
            $.get(path + 'register.html', function(templ) {
              bringBackHeader();
              main.html(templ);
            });
          });

          this.get('#/chat', function() {
            $.get(path + 'chat.html', function(templ) {
              addHeader();
              checkLogged(templ);
            });
          });

          this.get('#/chat-admin', function() {
            $.get(path + 'chat_admin.html', function(templ) {
              addHeader();
              checkAdmin(templ);
            });
          });

          this.get('#/admin', function() {
            $.get(path + 'admin.html', function(templ) {
              addHeader();
              checkAdmin(templ);
            });
          });

          this.get('#/posts/create', function() {
            $.get(path + 'posts/create.html', function(templ) {
              addHeader();
              checkAdmin(templ);
            });
          });

          this.get('#/posts/:id/edit', function() {
            sessionStorage.setItem('id', this.params['id']);
            $.get(path + 'posts/edit.html', function(templ) {
              addHeader();
              checkAdmin(templ);
            });
          });

          this.get('#/posts', function() {
            $.get(path + 'posts/index.html', function(templ) {
              addHeader();
              checkAdmin(templ);
            });
          });

          this.get('#/users', function() {
            $.get(path + 'users.html', function(templ) {
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

          this.get('#/lectures', function() {
            $.get(path + 'lectures/calendar.html', function(templ) {
              addHeader();
              main.html(templ);
              $('.modal-backdrop.fade.in').hide();
              $('body').attr('class', '');
            });
          });

          this.get('#/lectures/:id/book', function() {
            sessionStorage.setItem('id', this.params['id']);
            $.get(path + 'lectures/seat-booking.html', function(templ) {
              removeMask();
              addHeader();
              checkLogged(templ);
            });
          });

          this.get('#/lectures/:id/hall', function() {
            sessionStorage.setItem('id', this.params['id']);
            $.get(path + 'lectures/hall.html', function(templ) {
              removeMask();
              addHeader();
              checkAdmin(templ);
            });
          });

          this.get('#/lectures/stats', function() {
            $.get(path + 'lectures/stats.html', function(templ) {
              addHeader();
              checkAdmin(templ);
            });
          });

          this.get('#/lectures/create', function() {
            $.get(path + 'lectures/create.html', function(templ) {
              addHeader();
              checkAdmin(templ);
            });
          });

          this.get('#/lectures/:id/edit', function() {
            sessionStorage.setItem('id', this.params['id']);
            $.get(path + 'lectures/edit.html', function(templ) {
              removeMask();
              addHeader();
              checkAdmin(templ);
            });
          });

          // this.get('#/levels', function() {
          //   $.get(path + 'difficulty_levels/index.html', function(templ) {
          //     addHeader();
          //     main.html(templ);
          //   });
          // });
          //
          // this.get('#/levels/:id/details', function() {
          //   sessionStorage.setItem('id', this.params['id']);
          //   $.get(path + 'difficulty_levels/details.html', function(templ) {
          //     addHeader();
          //     main.html(templ);
          //   });
          // });
          //
          // this.get('#/levels/create', function() {
          //   $.get(path + 'difficulty_levels/create.html', function(templ) {
          //     addHeader();
          //     checkAdmin(templ);
          //   });
          // });
          //
          // this.get('#/levels/:id/edit', function() {
          //   sessionStorage.setItem('id', this.params['id']);
          //   $.get(path + 'difficulty_levels/edit.html', function(templ) {
          //     addHeader();
          //     checkAdmin(templ);
          //   });
          // });
          //
          // this.get('#/courses', function() {
          //   $.get(path + 'courses/index.html', function(templ) {
          //     addHeader();
          //     main.html(templ);
          //   });
          // });
          //
          // this.get('#/courses/create', function() {
          //   $.get(path + 'courses/create.html', function(templ) {
          //     addHeader();
          //     checkAdmin(templ);
          //   });
          // });
          //
          // this.get('#/courses/:id/details', function() {
          //   sessionStorage.setItem('id', this.params['id']);
          //   $.get(path + 'courses/details.html', function(templ) {
          //     removeMask();
          //     addHeader();
          //     main.html(templ);
          //   });
          // });
          //
          // this.get('#/courses/:id/edit', function() {
          //   sessionStorage.setItem('id', this.params['id']);
          //   $.get(path + 'courses/edit.html', function(templ) {
          //     addHeader();
          //     checkAdmin(templ);
          //   });
          // });

          // this.get('#/online-courses', function() {
          //   $.get(path + 'online_courses/index.html', function(templ) {
          //     addHeader();
          //     main.html(templ);
          //   });
          // });
          //
          // this.get('#/online-courses/create', function() {
          //   $.get(path + 'online_courses/create.html', function(templ) {
          //     addHeader();
          //     checkAdmin(templ);
          //   });
          // });
          //
          // this.get('#/online-courses/:id/details', function() {
          //   sessionStorage.setItem('id', this.params['id']);
          //   $.get(path + 'online_courses/details.html', function(templ) {
          //     addHeader();
          //     main.html(templ);
          //   });
          // });
          //
          // this.get('#/online-courses/:id/edit', function() {
          //   sessionStorage.setItem('id', this.params['id']);
          //   $.get(path + 'online_courses/edit.html', function(templ) {
          //     addHeader();
          //     checkAdmin(templ);
          //   });
          // });
          //
          // this.get('#/online-lectures', function() {
          //   $.get(path + 'online_lectures/index.html', function(templ) {
          //     addHeader();
          //     main.html(templ);
          //   });
          // });
          //
          // this.get('#/online-lectures/create', function() {
          //   $.get(path + 'online_lectures/create.html', function(templ) {
          //     addHeader();
          //     checkAdmin(templ);
          //   });
          // });
          //
          // this.get('#/online-lectures/:id/details', function() {
          //   sessionStorage.setItem('id', this.params['id']);
          //   $.get(path + 'online_lectures/details.html', function(templ) {
          //     addHeader();
          //     main.html(templ);
          //   });
          // });
          //
          // this.get('#/online-lectures/:id/edit', function() {
          //   sessionStorage.setItem('id', this.params['id']);
          //   $.get(path + 'online_lectures/edit.html', function(templ) {
          //     addHeader();
          //     checkAdmin(templ);
          //   });
          // });

          // this.get('#/login', function() {
          //   $('#formContainer').show();
          //   $('#mask').show();
          // });

          function getIndex() {
            $.get('index.html', function(templ) {
              $(document.documentElement).html(templ);
            });
          }

          function removeMask() {
            $('.modal-backdrop.fade.in').hide();
            $('body').css('overflow-y', 'scroll');
          }

          function addHeader() {
              $('#header').attr('class', '');
              $('#header nav').attr('class', 'nav-scroll');
              $('#header nav ul').attr('class', 'scroll');
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
                  $.ajax({
                    url: 'Controllers/Account/checkRole.php',
                    method: 'GET',
                    success: function(result) {
                      if (result == 'banned') {
                        main.html('<h3 color="red">Banned</h3>');
                      } else {
                        main.html(template);
                      }
                    }
                  });
                } else {
                  location.href = "#/home";
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
                  location.href = "#/home";
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
