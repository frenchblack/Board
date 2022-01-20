/* 공통JS 파일*/
//공통변수
// var commonUrl = {
// 	freeList : "/Board/Free/getBoardList.do"
//   , freeContent : "/Board/Free/getBoardContent.do"
//   , freeWirte : "/Board/Free/writeBoard.do"
// };
function getContextPath() {
	return sessionStorage.getItem("contextpath");
}

// const ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
const ctx = getContextPath();

function addJavascript(src, integrity, crossorigin) {
  let wStr = "<script type='text/javascript'";
  wStr += "src='" + src + "'";
  wStr += integrity ? " integrity='" + integrity + "'" : "";
  wStr += crossorigin ? " crossorigin='" + crossorigin + "'" : "";
  wStr += "></script>";

  document.write(wStr);
}

addJavascript(ctx + "/js/jquery-3.5.1.min.js");
addJavascript(ctx + "/js/popper.min.js");
addJavascript(ctx + "/js/bootstrap.min.js");
addJavascript(ctx + "/js/common/common.js");

//console.log("Load common.js");