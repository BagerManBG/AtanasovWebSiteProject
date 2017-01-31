var data = [];
var err = [];
var responce = [];

$(document).ready(function() {

    for (var i = 1; i <= 7; i++) {
        $('span#' + i).fadeOut(1);
    }

    $('#signup input#first_name').bind("input", function() {

        data['first_name'] = $('#signup #first_name').val();
        responce[0] = CheckName(data['first_name']);
        DisplayValidations();
    });

    $('#signup input#last_name').bind("input", function() {

        data['last_name'] = $('#signup #last_name').val();
        responce[1] = CheckName(data['last_name']);
        DisplayValidations();
    });

    $('#signup input#email').bind("input", function() {

        data['email'] = $('#signup #email').val();
        CheckEmail(data['email']);
        DisplayValidations();
    });

    $('#signup input#password').bind("input", function() {

        data['password'] = $('#signup #password').val();
        responce[3] = CheckPassword(data['password']);
        DisplayValidations();
    });

    $('#signup input#password_confirm').bind("input", function() {

        data['password_confirm'] = $('#signup #password_confirm').val();
        responce[4] = CheckPasswordConfirm(data['password'], data['password_confirm']);
        DisplayValidations();
    });

    $('#signup input#secret_question').bind("input", function() {

        data['secret_question'] = $('#signup #secret_question').val();
        responce[5] = CheckSecretInfo('q', data['secret_question']);
        DisplayValidations();
    });

    $('#signup input#secret_answer').bind("input", function() {

        data['secret_answer'] = $('#signup #secret_answer').val();
        responce[6] = CheckSecretInfo('a', data['secret_answer']);
        DisplayValidations();
    });

    $('#registerButton').click(function() {

        data['first_name'] = $('#signup #first_name').val();
        data['last_name'] = $('#signup #last_name').val();
        data['email'] = $('#signup #email').val();
        data['password'] = $('#signup #password').val();
        data['password_confirm'] = $('#signup #password_confirm').val();

        responce[0] = CheckName(data['first_name']);
        responce[1] = CheckName(data['last_name']);
        CheckEmail(data['email']);
        responce[3] = CheckPassword(data['password']);
        responce[4] = CheckPasswordConfirm(data['password'], data['password_confirm']);

        DisplayValidations();

        if (CheckOK(responce)) {

            $('#signup #first_name').val('');
            $('#signup #last_name').val('');
            $('#signup #email').val('');
            $('#signup #password').val('');
            $('#signup #password_confirm').val('');

            var reg_data = new Array(
                data['first_name'],
                data['last_name'],
                data['email'],
                data['password'],
                data['password_confirm'],
                data['secret_question'],
                data['secret_answer']
            );

            $.ajax({
                url: 'Controllers/Account/register.php',
                method: 'POST',
                datatype: 'json',
                data: { reg_data: reg_data },
                success: function(result) {

                    if (result === 'OK') {
                        $('#formContainer').fadeOut(400);
                        location.reload();
                    }
                }
            });
        }
    });

    $(document).keypress(function(e) {

        if (e.which === 13 && formOpened && $('#registerButton').is(':visible')) {
            $('#registerButton').click();
        }
    });
});

function DisplayValidations() {

    responce.forEach(function(value, index, array) {

        if (value !== 'OK') {

            err[index] = value;

            $('span#' + (index + 1)).fadeIn(400);
            $('span#' + (index + 1)).text(value);

            $('span#' + (index + 1)).parent().parent().find('input').addClass('errorField');
        } else {

            $('span#' + (index + 1)).fadeOut(200);

            $('span#' + (index + 1)).parent().parent().find('input').removeClass('errorField');
        }
    });
}

function CheckOK(arr) {

    for (var i = 0; i < arr.length; i++) {

        if (arr[i] !== 'OK') {
            return false;
        }
    }

    return true;
}

function CheckName(name) {

    var regex = /^[a-zA-Z]+$/;

    if (name.length < 3) {
        return 'too short';
    }

    if (name.length > 21) {
        return 'too long';
    }

    if (!regex.test(name)) {
        return 'invalid format';
    }

    return 'OK';
}

function CheckEmail(email) {

    var regex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

    if (!regex.test(email)) {
        responce[2] = 'invalid email format';
    } else {

        $.ajax({
            url: 'Controllers/Account/checkEmailTaken.php',
            method: 'POST',
            data: { email: email },
            async: false,
            success: function(result) {

                if (result === 'OK') {
                    responce[2] = 'OK';
                } else {
                    responce[2] = 'email taken';
                }
            }
        });
    }
}

function CheckPassword(password) {

    var regex = /^[a-zA-Z1-9]+$/;

    if (password.length < 4) {
        return 'too short';
    }

    if (password.length > 30) {
        return 'too long';
    }

    if (!regex.test(password)) {
        return 'invalid password';
    }

    return 'OK';
}

function CheckPasswordConfirm(password, password_confirm) {

    if (password !== password_confirm) {
        return 'passwords don\'t match';
    }

    return 'OK';
}

//function CheckSecretInfo(type, str) {
//
//    var regex, symbol;
//
//    switch (type) {
//        case 'q':
//            symbol = '?';
//            regex = /^([a-zA-Z1-9][a-zA-Z1-9\s]*[a-zA-Z1-9]*[?])?$/;
//            break;
//        case 'a':
//            symbol = '!';
//            regex = /^([a-zA-Z1-9][a-zA-Z1-9\s]*[a-zA-Z1-9]*[!])?$/;
//            break;
//    }
//
//    if (!regex.test(str)) {
//        return 'invalid format or no ' + symbol + ' at end';
//    }
//
//    return 'OK';
//}