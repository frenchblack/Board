/* 공통JS 파일*/
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

$.fn.extend({
  valid : function(obj, validData) {
    let $obj = $(obj);
    let objVal = $obj.val();

    nullchk = validData[0] || false;
    objNm = validData[1];
    validFlag = validData[2];

    //null 체크
    if ( nullchk ) {
      if ( objVal == "" ) {
        alert(objNm + "(을)를 입력하세요.");
        return false;
      }
    }

    switch ( validFlag ) {
      case 'password':
        
        break;
    }

    return true;
  }

  , chkValid : function() {
    let $this = $(this);

    console.log($this);
    $this.find("input").each( function(idx, el) {
      var validData = $(el).data("valid");
      //console.log(validData + "/" + typeof validData);

      if ( validData != "" ) {
        if ( !$this.valid(el, new Function("return " + validData)()) ) return false;
      }
    });

    return true;
  }
});

//console.log("Load common.js");