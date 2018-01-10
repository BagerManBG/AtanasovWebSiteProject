var animating = false;

function startSlideshow(indices) {
	var max = indices[indices.length - 1];
	var min = indices[0];
	var currPicNum = 0;
	var currCirNum = 0;
	var time = 1000;

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

		$(document).keydown(function(event) {
			if (event.which == 37) {
				MoveLeft(currPicNum - 1);
		 	} else if (event.which == 39) {
				MoveRight(currPicNum + 1);
			}
		})
	});

	function MoveRight(nextPicNum) {

		if(nextPicNum > max) {
			return;
		}

		if(!animating) {
			
			animating = true;
			var currPicId = "#post_" + currPicNum;
			var nextPicId =	"#post_" + nextPicNum;

			$(nextPicId).css({'left': '100%', 'visibility': 'visible'});
			$(nextPicId).animate({left: '0%'}, time);

			$(currPicId).animate({left: '-100%'}, time, function(){

				$(this).css({left: '100%', 'visibility': 'hidden'});
				animating = false;
			});	

			currPicNum = nextPicNum;
		}
	}

	function MoveLeft(nextPicNum) {

		if (nextPicNum < min) {
			return;
		}

		if(!animating) {
			
			animating = true;
			var currPicId = "#post_" + currPicNum;
			var nextPicId =	"#post_" + nextPicNum;

			$(nextPicId).css({'left': '-100%', 'visibility': 'visible'});
			$(nextPicId).animate({left: '0%'}, time);

			$(currPicId).animate({left: '100%'}, time, function(){

				$(this).css({'left': '-100%', 'visibility': 'hidden'});
				animating = false;
			});

			currPicNum = nextPicNum;
		}
	}
}
