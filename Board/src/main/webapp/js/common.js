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

//js에서 get 파라미터 사용
function scriptQuery() {
    var script = document.getElementsByTagName('script');   
    //console.log(script[script.length-1].src);
    script = script[script.length-1].src  
       .replace(/^[^\?]+\?/, '')           
       .replace(/#.+$/, '')                      
       .split('&');                                   
     var queries = {}                             
       , query;
     //console.log(script);  
     while(script.length){                      
          query = script.shift().split('=');    
          queries[query[0]] = query[1];   
     }
     //console.log(queries);
     return queries;
}

//null체크
function isEmpty(str){        
    if(typeof str == "undefined" || str == null || str == "")
        return true;
    else
        return false ;
}  

addJavascript("/js/jquery-3.5.1.min.js");
addJavascript("/js/popper.min.js");
addJavascript("/js/bootstrap.min.js");
//console.log("Load common.js");