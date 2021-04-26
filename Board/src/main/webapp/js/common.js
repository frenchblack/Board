/* 공통JS 파일*/
//공통변수
// var commonUrl = {
// 	freeList : "/Board/Free/getBoardList.do"
//   , freeContent : "/Board/Free/getBoardContent.do"
//   , freeWirte : "/Board/Free/writeBoard.do"
// };

function addJavascript(src, integrity, crossorigin) {
  let wStr = "<script type='text/javascript'";
  wStr += "src='" + src + "'";
  wStr += integrity ? " integrity='" + integrity + "'" : "";
  wStr += crossorigin ? " crossorigin='" + crossorigin + "'" : "";
  wStr += "></script>";

  document.write(wStr);
}

addJavascript("/js/jquery-3.5.1.min.js");
addJavascript("/js/popper.min.js");
addJavascript("/js/bootstrap.min.js");
addJavascript("/js/common/common.js");

//console.log("Load common.js");