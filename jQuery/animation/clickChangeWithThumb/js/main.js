$(function () {
	
	function photoChange(target){
		
		//すべてのメイン画像を配列にいれます。
		var photoList = target.find('#photolist li');
		//サムネ画像をいれる配列
		var tnlist = []
		//現在表示中の画像のindex
		var current = 0;
		
		//サムネ画像すべてにクリックイベントを付与します。
		function init() {
			target.find('#tnlist li').each(function(index){
				
				tnlist[index] = $($(this).find('img'));
				$($(this).find('a')).on('click', function() {
					
					if(current != index){
						close();
						current = index;
						open();	
					};
					
					console.log(index);
				});
			});
		};
		
		function open() {
			$(photoList[current]).stop().fadeIn(1200, 'easeInQuad');
		};
		
		function close() {
		 	$(photoList[current]).stop().fadeOut(1200, 'easeOutQuad');
		}
		

	
		init();
		open();
		
	};
	
	photoChange($('#photoBox'));
	
});