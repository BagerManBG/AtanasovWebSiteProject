$(document).ready(function() {

    $('input').bind('keyup focus blur', function() {

        var label = $(this).prev('label');
        var span = label.find('span');

        if ($(this).val() === '') {

            span.show();
            label.removeClass('active highlight');
        } else {

            span.hide();
            label.addClass('active highlight');
        }
    });
});