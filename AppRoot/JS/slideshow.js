var animating = false;
var currPicNum = 1;
var currCirNum = 1;
var maxPics = 3;

$('#slideshow .arrow').hide();
$('#slideshow iframe').hide();
$('#slideshow iframe#vid_1').show();

$(document).ready(function(){

	$('body').on('click', '.arrow', function(){
		
		switch( $(this).attr('id') ) {

			case 'left_arr':
				MoveLeft(1000, currPicNum - 1);
				break;
			case 'right_arr':
				MoveRight(1000, currPicNum + 1);
				break;
			default:
				break;
		}
	});
});

function MoveRight(time, nextPicNum) {

	if(animating)
	{
		return;
	}

	animating = true;

	if(nextPicNum > maxPics) {

		nextPicNum = 1;
	}

	var currPicId = "#vid_" + currPicNum;
	var nextPicId =	"#vid_" + nextPicNum;

	$(currPicId).animate({left: '-100%'}, time, function(){

		$(this).css({left: '100%', 'visibility': 'hidden'});
		animating = false;
	});

	$(nextPicId).css({'left': '100%', 'visibility': 'visible'});
	$(nextPicId).animate({left: '0%'}, time);

	currPicNum = nextPicNum;
}

function MoveLeft(time, nextPicNum) {

	if(animating)
	{
		return;
	}

	animating = true;

	if(nextPicNum < 1) {

		nextPicNum = maxPics;
	}

	var currPicId = "#vid_" + currPicNum;
	var nextPicId =	"#vid_" + nextPicNum;

	$(currPicId).animate({left: '100%'}, time, function(){

		$(this).css({'left': '-100%', 'visibility': 'hidden'});
		animating = false;
	});

	$(nextPicId).css({'left': '-100%', 'visibility': 'visible'});
	$(nextPicId).animate({left: '0%'}, time);

	currPicNum = nextPicNum;
}