/* 공통JS 파일*/
function addJavascript(src, integrity, crossorigin) {
  let wStr = "<script type='text/javascript'";
  wStr += "src='" + src + "'";
  wStr += integrity ? " integrity='" + integrity + "'" : "";
  wStr += crossorigin ? " crossorigin='" + crossorigin + "'" : "";
  wStr += "></script>";

  document.write(wStr);
}

addJavascript("https://code.jquery.com/jquery-3.5.1.slim.min.js" ,"sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" ,"anonymous");
addJavascript("https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ,"sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" ,"anonymous");
addJavascript("https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ,"sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" ,"anonymous");