$(document).ready(function() {

    $('#send_button').click(function(){
      SendMessage();
    });

    $('#chatBody textarea').keypress(function(e) {

        if (e.which == 13) {
            SendMessage();
            e.preventDefault();
        }
    });
});

function SendMessage() {
    var area = $('#chatBody textarea');

    if (area.val() != '') {

        var data = {
            message: area.val(),
            sender_id: getId('user'),
            receiver_id: getId('admin')
        };

        area.val('');

        $.ajax({
            url: 'Controllers/Chat/sendMessage.php',
            method: 'POST',
            data: { message_data: data }
        });
    }
}

function getId(person) {

    var id;

    if (person === 'user') {
        var url = 'Controllers/Chat/getLoggedUserId.php';
    } else if (person === 'admin') {
        var url = 'Controllers/Chat/getAdminId.php';
    }

    $.ajax({
        url: url,
        method: 'GET',
        async: false,
        success: function(result) {

            id = result;
        }
    });

    return id;
}
