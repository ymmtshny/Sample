$(function() {
		
		var imageArray = $('img.thumbImages');
		var index = 0;
		var W_WRAP = 778;
		var H_WRAP = 600;
		var W_IMG = 1200;
		var H_IMG = 926;
		var zoomin = false;
		
		//サムネイルの画像をホバーしたときの動作ここから
		$('img.thumbImages').mouseover(function(){
			zoomout(0);
			var selectedSrc = $(this).attr('src');
			$("#mainImage").attr("src",selectedSrc);
			transparentImage($(this));
	
			index = $('img.thumbImages').index(this);
			showTextForImages(index);
			
		});
	
		//サムネイルの画像をホバーを解除したときの動作ここから
		$('img.thumbImages').mouseout(function(){
			
		});
	
		//矢印押した時の処理ここから
		$('#right').click(function(){
			zoomout(0);
			index ++;
			
			if(index == imageArray.length ) {
				index = 0;
			}
	
			changeImagesByClickingArrows(index);
			showTextForImages(index);
			
		});
		
		//矢印押した時の処理ここから
		$('#left').click(function(){
			zoomout(0);
			index --;
			if(index == -1) {
				index = imageArray.length - 1;
			}
			changeImagesByClickingArrows(index);
			showTextForImages(index);
			
		});
	
		//メイン画像がクリックされた時の処理、ズーム機能
		$('#mainImage').click(function(e) {
	
			if (zoomin) {
				zoomout(250);
			} else {
				var x = (e.pageX - $(this).offset().left) * (W_IMG / W_WRAP) - W_WRAP / 2;
				if (x < 0) x = 0;
				if (x > W_IMG - W_WRAP) x = W_IMG - W_WRAP;
				var y = (e.pageY - $(this).offset().top) * (H_IMG / H_WRAP) - H_WRAP / 2;
				if (y < 0) y = 0;
				if (y > H_IMG - H_WRAP) y = H_IMG - H_WRAP;
				$(this).animate({width: W_IMG, height: H_IMG, left: -x, top: -y}, 250);
				$(this).animate({width: W_IMG , height: H_IMG, left: -x, top: -y}, 250);
				zoomin = true;
			}
	
		});
	
		//この関数は、矢印が押された時、メイン画像を切り替える。
		function changeImagesByClickingArrows(index) {
			var imagesWillShown = $(imageArray[index]).attr('src');
			$('#mainImage').attr('src', imagesWillShown);
			transparentImage($(imageArray[index]));
		}
	
		//この関数は、画像が切り替わった時に、ズーム状態からデフォルト状態にもどす。
		function zoomout(duration) {
			$('#mainImage').animate({width: W_WRAP, height: H_WRAP, left: 0, top: 0}, duration);
			zoomin = false;
		}
	
		//この関数は、画像が切り替わった時に、画像の説明文を切り替える。
		function showTextForImages (index) {
			var textForImages = $('p.textForImages');
			$(textForImages).css({"display":"none"});
			$(textForImages[index]).css({"display":"block"});
		}
	
		function transparentImage (target) {
			$('img.thumbImages').css({"opacity":""});
			target.css({"opacity":"0.6"});
		}
	
		//この関数は、初期設定を行う。
		function init() {
			//画像の説明文の処理ここから
			showTextForImages(0);
		}
	
		init();
		
	
	});