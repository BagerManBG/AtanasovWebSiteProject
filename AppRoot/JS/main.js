$(document).ready(function() {

    DynamicNav();
    UserHandler();

    $('#formContainer').hide();
    $('#mask').hide();

    $('nav').on('click', '.account', function() {

        var tab = $(this).attr('id');
        OpenForm(tab);
    });

    $('#mask').click(function() {
        $('#formContainer').fadeOut(400);
        $('#mask').fadeOut(400);
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
            $('#registerTab').click();
            break;
        default:
            break;
    }

    $('#formContainer').fadeIn(400);
    $('#mask').fadeIn(400);
}

function DynamicNav() {

    $(window).scroll(function() {

        if ($(document).scrollTop() > 160) {
            $("ul").addClass("scroll");
            $("nav").addClass("nav-scroll");
        } else {
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

            if (result == '') {
                htmlToAdd = "<li><p class='dynamic account' id='reg'>Register</p></li><li><p class='dynamic account' id='log'>Log In</p></li>";
            } else {
                htmlToAdd = "<li><a href='Controllers/Account/logout.php' class='dynamic'>Log Out</a></li>";
                var userNameHTML = "<h1 class='dynamic'>Welcome, " + result + "</h1>";
                $('#username').prepend(userNameHTML);
            }

            $('#links').prepend(htmlToAdd);
        }
    });
}