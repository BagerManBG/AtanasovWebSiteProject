$(document).ready(function() {

    $('#wrongLog').addClass('bgColor');

    $('#login input').bind('input', function() {

        $('#wrongLog').addClass('bgColor');
    });

    $('#loginButton').click(function() {

        var log_data = new Array(
            $('#login_email').val(),
            $('#login_password').val()
        );

        $.ajax({
            url: 'Controllers/Account/login.php',
            method: 'POST',
            datatype: 'json',
            data: { log_data: log_data },
            success: function(result) {

                if (result === 'OK') {
                    $('#formContainer').fadeOut(400);
                    location.reload();
                } else {
                    $('#wrongLog').removeClass('bgColor');
                }
            }
        });
    });

    $(document).keypress(function(e) {

        if (e.which === 13 && formOpened && $('#loginButton').is(':visible')) {
            $('#loginButton').click();
        }
    });
});