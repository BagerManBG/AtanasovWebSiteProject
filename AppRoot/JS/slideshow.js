function startSlideshow(indices) {
	var max = indices[indices.length - 1];
	var min = indices[0];
	var animating = false;
	var currPicNum = 0;
	var currCirNum = 0;
	var time = 1000;
	console.log(indices);

	$(document).ready(function() {
		$('body').on('click', '.arrow', function(){

			switch( $(this).attr('id') ) {

				case 'left_arr':
					MoveLeft(currPicNum - 1);
					break;
				case 'right_arr':
					MoveRight(currPicNum + 1);
					break;
				default:
					break;
			}
		});
	});

	function MoveRight(nextPicNum) {

		if(animating)
		{
			return;
		}

		if(nextPicNum > max) {
			return;
		}

		animating = true;
		var currPicId = "#post_" + currPicNum;
		var nextPicId =	"#post_" + nextPicNum;

		$(currPicId).animate({left: '-100%'}, time, function(){

			$(this).css({left: '100%', 'visibility': 'hidden'});
			animating = false;
		});

		$(nextPicId).css({'left': '100%', 'visibility': 'visible'});
		$(nextPicId).animate({left: '0%'}, time);

		currPicNum = nextPicNum;
	}

	function MoveLeft(nextPicNum) {
		if(animating) {
			return;
		}

		if (nextPicNum < min) {
			return;
		}

		animating = true;
		var currPicId = "#post_" + currPicNum;
		var nextPicId =	"#post_" + nextPicNum;

		$(currPicId).animate({left: '100%'}, time, function(){

			$(this).css({'left': '-100%', 'visibility': 'hidden'});
			animating = false;
		});

		$(nextPicId).css({'left': '-100%', 'visibility': 'visible'});
		$(nextPicId).animate({left: '0%'}, time);

		currPicNum = nextPicNum;
	}
}
