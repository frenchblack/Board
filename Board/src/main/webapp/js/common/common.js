/* 공통JS 파일*/
//csrf 토큰 설정
var c_token = $("meta[name='_csrf']").attr("content");
var c_header = $("meta[name='_csrf_header']").attr("content");

$(function() {
    $(document).ajaxSend(function(e, xhr, options) {
        if(c_token && c_header) {
            xhr.setRequestHeader(c_header, c_token);
        }
    });
});
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

//validation 체크
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
    let _validVal = true;

    console.log($this);
    $this.find("input").each( function(idx, el) {
      var validData = $(el).data("valid");
      console.log(validData + "/" + typeof validData); 

      if ( typeof validData != "undefined" && validData != "" && validData != null) {
        if ( !$this.valid(el, new Function("return " + validData)()) ) {
          _validVal = false;
          return false;
        }
      }
    });

    return _validVal;
  }
});

//serializeObject
$.fn.serializeObject = function() {
   let o = {};
   let a = this.serializeArray();
   $.each(a, function() {
       if (o[this.name]) {
           if (!o[this.name].push) {
               o[this.name] = [o[this.name]];
           }
           o[this.name].push(this.value || '');
       } else {
           o[this.name] = this.value || '';
       }
   });
   return o;
};

//login
$( "#loginBtn" ).click( function(){
  // var csrfParameter = $('meta[name="_csrf_parameter"]').attr('content');
  // var csrfHeader = $('meta[name="_csrf_header"]').attr('content');
  // var csrfToken = $('meta[name="_csrf"]').attr('content');

  // let url = "/User/login.do";
  // let obj = $("#loginForm").serializeObject();
  // console.log(obj);
  // let params = JSON.stringify(obj);
  // // let params = "user_id=AAA"//JSON.stringify(obj);

  // console.log(params);
  // if ( !$("#loginForm").chkValid() ) return;

  // $("#loginForm").submit();  

  // $.ajaxSetup({
  //     beforeSend: function(xhr) {
  //         xhr.setRequestHeader(csrfHeader, csrfToken);
  //     }  
  // })  

  // $.ajax({
  //     type: 'POST'
  //   , url: url
  //   , data: params
  //   , dataType: 'json'
  //   , contentType : "application/json; charset=utf-8"
  //   , success: function (result) {
  //     console.log(result)
  //   }
  //   , error : function (xhr, status, error) {
  //     alert("로그인에 실패하였습니다.");
  //   }
  // });
});

//console.log("Load common.js");