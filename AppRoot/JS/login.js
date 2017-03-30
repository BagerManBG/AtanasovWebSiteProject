$( document ).ready(function() {
    console.log( "ready!" );
    $('.positionLeft').click(function(){
    	$('.regAction').hide()
    	$('.logAction').show()
    });
    $('.positionRight').click(function(){
    	$('.logAction').hide()
    	$('.regAction').show()
    });
});

$('#coverButton').click(function(){
    $('#image').click();
});

$(function(){

    $('#image').on('change',function(){

        var inputValue = $(this).val();

        $('#coverButton').attr('value', inputValue);

    });

});

$(function(){

    $( "input[name='email']" ).on('click change',function(){

        var inputValue = $(this).val();

        $('#email_span').html("email: " + inputValue);

    });

});

$(function(){

    $( "input[name='first_name']" ).on('click change',function(){

        var inputValue = $(this).val();

        $('#first_name_span').html("First Name: " + inputValue);

    });

});

$(function(){

    $( "input[name='last_name']" ).on('click change',function(){

        var inputValue = $(this).val();

        $('#last_name_span').html("Last Name: " + inputValue);

    });

});

$(function(){

    $( "input[name='email']" ).on('click change',function(){

        var inputValue = $(this).val();

        $('#email_reg').html("email: " + inputValue);

    });

});

$(function(){

    $( "input[name='secret_question']" ).on('click change',function(){

        var inputValue = $(this).val();

        $('#question_reg').html("Question: " + inputValue);

    });

});

$(function(){

    $( "input[name='secret_answer']" ).on('click change',function(){

        var inputValue = $(this).val();

        $('#answer_reg').html("Answer: " + inputValue);

    });

});

/*!
 * classie - class helper functions
 * from bonzo https://github.com/ded/bonzo
 *
 * classie.has( elem, 'my-class' ) -> true/false
 * classie.add( elem, 'my-new-class' )
 * classie.remove( elem, 'my-unwanted-class' )
 * classie.toggle( elem, 'my-class' )
 */

/*jshint browser: true, strict: true, undef: true */
/*global define: false */

( function( window ) {

'use strict';

// class helper functions from bonzo https://github.com/ded/bonzo

function classReg( className ) {
  return new RegExp("(^|\\s+)" + className + "(\\s+|$)");
}

// classList support for class management
// altho to be fair, the api sucks because it won't accept multiple classes at once
var hasClass, addClass, removeClass;

if ( 'classList' in document.documentElement ) {
  hasClass = function( elem, c ) {
    return elem.classList.contains( c );
  };
  addClass = function( elem, c ) {
    elem.classList.add( c );
  };
  removeClass = function( elem, c ) {
    elem.classList.remove( c );
  };
}
else {
  hasClass = function( elem, c ) {
    return classReg( c ).test( elem.className );
  };
  addClass = function( elem, c ) {
    if ( !hasClass( elem, c ) ) {
      elem.className = elem.className + ' ' + c;
    }
  };
  removeClass = function( elem, c ) {
    elem.className = elem.className.replace( classReg( c ), ' ' );
  };
}

function toggleClass( elem, c ) {
  var fn = hasClass( elem, c ) ? removeClass : addClass;
  fn( elem, c );
}

var classie = {
  // full names
  hasClass: hasClass,
  addClass: addClass,
  removeClass: removeClass,
  toggleClass: toggleClass,
  // short names
  has: hasClass,
  add: addClass,
  remove: removeClass,
  toggle: toggleClass
};

// transport
if ( typeof define === 'function' && define.amd ) {
  // AMD
  define( classie );
} else {
  // browser global
  window.classie = classie;
}

})( window );
