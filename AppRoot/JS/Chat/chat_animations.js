$(document).ready(function() {
    $('#chatBody textarea').bind('keyup focus', function() {
        CheckInput();
    });
});

function CheckInput() {

    var img = $('#chatBox').find('#chatBody #type #send');
    var input = $('#chatBody textarea');

    if (input.val() === '') {
        img.addClass('blurred');
    } else {
        img.removeClass('blurred');
    }
}
