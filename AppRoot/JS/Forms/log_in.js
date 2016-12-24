$(document).ready(function() {

    $('#loginButton').click(function() {

        var log_data = new Array(
            $('#login_email').val(),
            $('#login_password').val()
        );

        console.log(log_data);

        $.ajax({
            url: 'Controllers/Account/login.php',
            method: 'POST',
            datatype: 'json',
            data: { log_data: log_data },
            success: function(result) {

                if (result === 'OK') {
                    $('#formContainer').fadeOut(400);
                    location.reload();
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