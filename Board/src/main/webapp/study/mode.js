/**
 다크모드 변경 js
 */
var chnger = {
	chngMod: function ( btn ) {
		var body = document.querySelector('body');

		if ( btn.value == 'night' ) {
			body.style.backgroundColor = 'black';
			body.style.color = 'white';
			btn.value = 'day';
		} else {
			body.style.backgroundColor = 'initial';
			body.style.color = 'initial';
			btn.value = 'night';
		}
	}
}