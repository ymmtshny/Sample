$(function () {
	
	var photo = $('#photo');

	function open() {
		photo.fadeIn(3000, 'easeInQuad', function(){ setTimeout(close, 3000)});
	};

	function close() {
		photo.fadeOut(1500, 'easeOutQuad', function(){ setTimeout(open, 1500)});
	};

	open();
	
})