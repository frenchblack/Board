//console.log('Begin load comment.js');
var boardCd = scriptQuery();
addJavascript("/js/util/pagination.js");

var commMessage = {
  update : "수정한 댓글을 저장 하시겠습니까?"
, cnacel : "댓글 수정을 취소 하시겠습니까?"
, save : "작성한 댓글을 저장 하시겠습니까?"
, del : "댓글을 삭제 하시겠습니까?"
}

var pageInfo = {
  page : 1
, range : 1
}

//-------------------------------------------
//--------------------이벤트-----------------
//-------------------------------------------
//댓글 저장
$( '#btnCommentSave' ).click( function() {
  confirm(commMessage.save) ? saveComment('form') : false;
})

//READY 이벤트
$(document).ready(function() {
  getCommentList();
});

//-------------------------------------------
//--------------------함수-----------------
//-------------------------------------------
//댓글 수정
function fn_updateComment( idCd, content ) {
  let textarea = '';
  let button = '';
  let contTarget = '#content' + idCd;
  let buttonTarget = '#commBtn' + idCd;

  textarea += '<textarea name="comment_content" id="commCont' + idCd + '" class="form-control" rows="3">' + content + '</textarea>';

  button += '<button type="button" class="btn btn-sm btn-secondary" onclick="confirm(commMessage.update) ? saveComment(\'commForm' + idCd + '\') : false;">저장</button>';
  button += '<button type="button" class="btn btn-sm btn-secondary ml-1" onclick="confirm(commMessage.cnacel) ? fn_cancelComment(\'' + idCd + '\',\'' + content + '\') : false;">취소</button>';

  $(contTarget).html(textarea);
  $( '#commCont' + idCd ).focus(); 
  $( '#commCont' + idCd ).val($( '#commCont' + idCd ).val());
  $(buttonTarget).html(button);
}

//댓글 수정 취소
function fn_cancelComment( idCd, org_content ) {
  let div_cont = '';
  let button = '';
  let contTarget = '#content' + idCd;
  let buttonTarget = '#commBtn' + idCd;

  div_cont += org_content;

  button += '<button type="button" class="btn btn-sm btn-secondary" onclick="fn_updateComment(\'' + idCd + '\',\'' + org_content + '\')">수정</button>';
  button += '<button type="button" class="btn btn-sm btn-secondary ml-1" onclick="confirm(commMessage.del) ? delComment(\'commForm' + idCd + '\') : false;">삭제</button>';

  $(contTarget).html(div_cont);
  $(buttonTarget).html(button);
}

//댓글 HTML
function commetSuccess( result, blinkComm ) {
  let ptrHtml = "";
  let blicnkObj = {
    comment_cd : ""
  , comment_class : ""
  };

  if ( !isEmpty( blinkComm ) ) {
    blicnkObj.comment_cd = blinkComm.comment_cd;
    blicnkObj.comment_class = blinkComm.comment_class;
  }

  console.log(result);
  let commentList = result.commentList;

  if ( result.length < 1 ) {
    ptrHtml = "등록된 댓글이 없습니다.";
  } else {
    $(commentList).each(function() {
      //console.log(this.comment_cd + "/" + blicnkObj.comment_cd + "/" + blicnkObj.comment_class + "/"+ ((this.comment_cd == blicnkObj.comment_cd) && (this.comment_class == blicnkObj.comment_class)));
      let idCd = "_" + this.comment_cd + "_" + this.comment_class;

      ptrHtml += '<div class="comment_item border-bottom p-2' + ( (this.comment_cd == blicnkObj.comment_cd) && (this.comment_class == blicnkObj.comment_class) ? " blinking" : "" ) + '">';
      ptrHtml +=  '<form id="commForm' + idCd + '">';
      ptrHtml +=    '<input type="hidden" name="board_cd" value="' + this.board_cd + '"></input>'
      ptrHtml +=    '<input type="hidden" name="comment_cd" value="' + this.comment_cd + '"></input>'
      ptrHtml +=    '<input type="hidden" name="comment_class" value="' + this.comment_class + '"></input>'
      ptrHtml +=    '<div id="content' + idCd + '">' + this.comment_content + '</div>';
      ptrHtml +=  '</form>';
      ptrHtml +=  '<div class="row">';
      ptrHtml +=    '<div class="col-sm-6" style="font: 0.8rem grey;">' + this.user_id + '</div>';
      ptrHtml +=    '<div class="col-sm-6" style="text-align: right;font: 0.8rem grey;">' + this.in_date + '</div>';
      ptrHtml +=  '</div>';
      ptrHtml +=  '<div class="row justify-content-end">';
      ptrHtml +=    '<div class="col-sm-3">';
      ptrHtml +=      '<div class="float-right" id="commBtn' + idCd + '">';
      ptrHtml +=        '<button type="button" class="btn btn-sm btn-secondary" onclick="fn_updateComment(\'' + idCd + '\',\'' + this.comment_content + '\')">수정</button>';
      ptrHtml +=        '<button type="button" class="btn btn-sm btn-secondary ml-1" onclick="confirm(commMessage.del) ? delComment(\'commForm' + idCd + '\') : false;">삭제</button>';
      ptrHtml +=      '</div>';
      ptrHtml +=    '</div>';
      ptrHtml +=  '</div>';
      ptrHtml += '</div>';
    })

    ptrHtml += ptrPaginationToHtml(result.pagination, "/RestBoard/Free/getCommentList.do");
    pageInfo.page = result.pagination.page;
    pageInfo.range = result.pagination.range;
  }

  $('#replyList').html(ptrHtml);
  let focusTag = '#content' + "_" + blicnkObj.comment_cd + "_" + blicnkObj.comment_class;
  console.log($( focusTag ).attr("id") + "/" + focusTag );
  if ( !isEmpty( $( focusTag ).attr("id") ) ) {
    $( focusTag ).get(0).scrollIntoView({block:"center"});
  }
}

function pagingOnClick( url, page, range, location) {
  getCommentList( null, page, range );
}

//댓글 조회 함수
function getCommentList( blinkComm, page, range) {
  let url = "/RestBoard/Free/getCommentList.do";
  let params = { "board_cd" : boardCd.board_cd
               , "listSize" : 10
               , "rangeSize" : 5
               , "page" : page || 1 
               , "range" :  range || 1 
             };
  console.log(params);

  $.ajax({
      type: 'POST'
    , url: url
    , data: params
    , dataType: 'json'
    , success: function ( result ) {
      commetSuccess(result, blinkComm);
    }
  })
}

//댓글 저장 함수
function saveComment( fId ) {
  let url = "/RestBoard/Free/insertComment.do";
  let formId = '#' + fId;
  let params = JSON.stringify($(formId).serializeObject());

  $.ajax({
      type: 'POST'
    , url: url
    , data: params
    , dataType: 'json'
    , contentType : "application/json; charset=utf-8"
    , success: function (result) {
        switch(result.mode) {
          case 0 :
            getCommentList(result, -1, -1);
            break;
          case 1 :
            getCommentList(result, pageInfo.page, pageInfo.range);
            break;
        }
    }
    , error : function (xhr, status, error) {
      alert("댓글을 저장하지 못하였습니다.");
    }
  })
}

//댓글 삭제
function delComment( idCd ) {
  let url = "/RestBoard/Free/deleteComment.do";
  let formId = '#' + idCd;
  let params = JSON.stringify($(formId).serializeObject());

  $.ajax({
      type: 'POST'
    , url: url
    , data: params
    , dataType: 'json'
    , contentType : "application/json; charset=utf-8"
    , success: function (result) {
      //console.log(result);
        alert("댓글이 삭제 되었습니다.");
        getCommentList();
    }
    , error : function (xhr, status, error) {
      alert("댓글을 삭제하지 못하였습니다.");
    }
  })
}

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