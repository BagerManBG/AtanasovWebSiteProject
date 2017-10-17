var formOpened = false;

$(document).ready(function() {

    DynamicNav();
    UserHandler();

    $('#formContainer').hide();
    $('#mask').hide();

    $('.nav').on('click', '#log.account', function() {
        var tab = $(this).attr('id');
        OpenForm(tab);
        formOpened = true;
    });

    $('#mask').click(function() {
        $('.loginForm').fadeOut(400);
        $('#mask').fadeOut(400);
        formOpened = false;
    });

    $(document).keyup(function(e) {
        if (e.keyCode == 27) {
            $('#mask').click();
        }
    });

    $('.tab a').on('click', function(e) {

        e.preventDefault();

        $(this).parent().addClass('active');
        $(this).parent().siblings().removeClass('active');

        target = $(this).attr('href');

        $('.tab-content > div').not(target).hide();

        $(target).fadeIn(400);

    });
});

function OpenForm(tab) {
    switch (tab) {
        case 'log':
            $('#logInTab').click();
            break;
        case 'reg':
            $('#logInTab').click();
            break;
        default:
            break;
    }

    $('#formContainer').fadeIn(400);
    $('#mask').fadeIn(400);
}

function DynamicNav() {

    // $(window).scroll(function() {
    //
    //     if ($(document).scrollTop() > 160) {
    //         $("ul").addClass("scroll");
    //         $("nav").addClass("nav-scroll");
    //     } else {
    //         $("ul").removeClass("scroll");
    //         $("nav").removeClass("nav-scroll");
    //     }
    // });
}

function UserHandler() {

    $.ajax({
        url: 'Controllers/Account/getUserName.php',
        method: 'GET',
        success: function(result) {

            $('.dynamic').remove();

            var htmlToAdd;

            if (result == '') {
                htmlToAdd = "<li><a href='#/register' class='dynamic account'>Register</a></li><li><a class='dynamic account' id='log'>Log In</a></li>";
                $('#links').prepend(htmlToAdd);

                $('#log').css("cursor", "pointer");
            } else {
                htmlToAdd = "<li><a href='Controllers/Account/logout.php' class='dynamic'>Log Out</a></li><li><a href='#/profile' class='dynamic'>Profile</a></li><li><a href='#/chat' class='dynamic'>Chat</a></li>";

                $.ajax({
                    url: 'Controllers/Account/checkRole.php',
                    method: 'GET',
                    success: function(result) {
                      if (result == 'admin') {
                        htmlToAdd += '<li><a href="#/admin" class="dynamic">Admin</a></li>';
                      }

                      $('#links').prepend(htmlToAdd);
                    }
                  });

                $('#formContainer').remove();
                $('#mask').remove();
            }
        }
    });
}
