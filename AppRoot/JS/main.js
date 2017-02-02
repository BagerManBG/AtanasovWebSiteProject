var formOpened = false;

$(document).ready(function() {

    DynamicNav();
    UserHandler();

    $('#formContainer').hide();
    $('#mask').hide();

    $('nav').on('click', '.account', function() {

        var tab = $(this).attr('id');
        OpenForm(tab);
        formOpened = true;
    });

    $('#mask').click(function() {
        $('#formContainer').fadeOut(400);
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
            $('#registerTab').click();
            break;
        default:
            break;
    }

    $('#formContainer').fadeIn(400);
    $('#mask').fadeIn(400);
}

function DynamicNav() {
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

                htmlToAdd = "<li><a href='Controllers/Account/logout.php' class='dynamic'>Log Out</a></li><li><a href='#/profile' class='dynamic'>Profile</a></li>";
                var userNameHTML = "<li class='dynamic-1'><h2  id='ivan'>Welcome, " + result + "</h2></li>";
                $('#username').prepend(userNameHTML);

                $('#formContainer').remove();
                $('#mask').remove();
            }

            $('#links').prepend(htmlToAdd);
        }
    });
}
