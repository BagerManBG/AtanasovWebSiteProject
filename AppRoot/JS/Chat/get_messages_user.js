$(document).ready(function() {

    $('#quesitonBubble').click(function() {

        var messages = new Array();
        var id;

        $.ajax({
            url: 'Controllers/Chat/getLoggedUserId.php',
            method: 'GET',
            async: false,
            success: function(result) {

                if (result != 'error') {
                    id = result;

                    setInterval(function() {

                        $.ajax({
                            url: 'Controllers/Chat/getMessages.php',
                            method: 'POST',
                            data: { user_id: id },
                            success: function(result) {

                                if (result != '') {
                                    var data = JSON.parse(result);

                                    if (messages.length != data.length) {
                                        messages = data;
                                        $('#chatBody #content').empty();

                                        for (var i = 0; i < data.length; i++) {
                                            var msg = data[i]['message'];
                                            var sender = data[i]['sender_id'];
                                            var receiver = data[i]['receiver_id'];

                                            var target = null;

                                            if (sender == id) {
                                                target = 'myMessage';
                                            } else if (receiver == id) {
                                                target = 'hisMessage';
                                            }

                                            var messageHTML = "<div class='" + target + "'><p class='message'>" + msg + "</p></div>"

                                            $('#chatBody #content').append(messageHTML);
                                        }

                                        ScrollBottom();
                                    }
                                }
                            }
                        });
                    }, 1000);
                }
            }
        });
    });
});

function ScrollBottom() {

    var elem = document.getElementById('content');
    elem.scrollTop = elem.scrollHeight;
}