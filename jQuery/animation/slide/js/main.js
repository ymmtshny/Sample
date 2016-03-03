$(function () {
	
	var photo = $('#photo');

	function slideToRight() {
		photo.animate({'left':356}, 3000, 'easeInOutQuad', function(){ setTimeout(slideToLeft, 3000); });
	};

	function slideToLeft() {
		photo.animate({'left':0}, 3000, 'easeInOutQuad', function() { setTimeout(slideToRight, 3000); });
	};

	slideToRight();
	
});