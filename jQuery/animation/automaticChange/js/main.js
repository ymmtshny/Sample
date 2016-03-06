$(function () {
	
	function photoChange(target) {

		var items = target.find('li');
		var current = 0;

		//1200ミリ秒かけてフェイドイン
		//完了1500ミリ秒後、change関数を呼ぶ
		function open() {
			$(items[current]).fadeIn(1200, 'easeInQuad', function() {
				setTimeout(change, 1500); });
		};

		function close() {
			$(items[current]).fadeOut(1200,'easeOutQuad');
		};

		//現在の画像をファードアウト
		//配列のインデックスを＋
		//次の画像をフェイドイン
		function change() {
			close();
			current = current + 1;
			current = current % items.length;
			console.log(current);
			open();
		}

		open();

	};

	photoChange($('#photo'));
	
});