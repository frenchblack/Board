/**
 메뉴 객체
 */
var menu = {
	//경로, 파일명, 메뉴리스트 객체(메뉴명, 파일명)
	fLoc : "http://localhost/study/"
  , lLoc : ".html"
  , menuList : {
		"HTML" : "html"
	  , "CSS" : "css"
	  , "JAVA SCRIPT" : "javascript"
	}

	//메뉴생성
  , createMenu: function () {
		document.writeln('<ol>');
		for ( var menu in this.menuList ) {
			document.writeln('<li><a href="/study/html.html">' + this.menuList[menu] + '</a></li>');
		}
		document.writeln('</ol>');
	}

	//파일 정보 반환 (객체 파일 )
	//콜백 매개변수(text, status)
  , getFileInfo: function ( menuNm, callback ) {
		fetch(fLoc + this.menuList[menuNm] + lLoc).then(function(response) {
			callback(response.text(), response.status);
		})
	}
};