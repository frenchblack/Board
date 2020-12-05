/* 공통JS 파일*/
function addJavascript(src, integrity, crossorigin) {
  let wStr = "<script type='text/javascript'";
  wStr += "src='" + src + "'";
  wStr += integrity ? " integrity='" + integrity + "'" : "";
  wStr += crossorigin ? " crossorigin='" + crossorigin + "'" : "";
  wStr += "></script>";

  document.write(wStr);
}

addJavascript("/js/jquery-3.5.1.slim.min.js");
addJavascript("/js/popper.min.js");
addJavascript("/js/bootstrap.min.js");