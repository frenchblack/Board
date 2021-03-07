<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri = "http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>title</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/common/common.css">
    <style type="text/css">
      .board-info {
      }

      .board-info * {
        display: inline;
      }

      .board-info .tail {
        float: right;
        text-align: right;
      }

      .content {
        margin-top: 30px;
        margin-bottom: 30px;
      }

      .div_comment_write {
        margin-top: 20px;
        padding-top: 20px; 
        border-top: 1px solid grey; 
      }
    </style>
    <script type="text/javascript">

    </script>
  </head>
  <body>
    <div id="wrapper">
      <!-- 상단바 include-->
      <%@ include file = "/layout/header.jsp" %>

      <!-- 메인 컨테이너 -->
      <div class="container container-main">
        <div class="page-title">
          <h4> <c:out value="${boardContent.title}"/></h4>
        </div>
        <div class="board-info">
          <div>
            <c:out value="${boardContent.board_cd}"/>
          </div>
          <div class="tail">
            <c:out value="${boardContent.user_id}"/>
            <c:out value="${boardContent.in_date}"/>
          </div>
        </div>
        <div class="content">
          <c:out value="${boardContent.content}"/>
        </div>
        <div>
          <button type="button" class="btn btn-sm btn-primary" id="btnUpdate">수정</button>
          <button type="button" class="btn btn-sm btn-primary" id="btnDel">삭제</button>
          <button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
        </div>
        <!-- 댓글 -->
        <%@ include file = "/layout/comment.jsp" %>
      </div>

      <%@ include file = "/layout/tail.jsp" %>
    </div>

    <script type="text/javascript" src="/js/common.js"></script>
    <script type="text/javascript" src="/js/comment.js?board_cd=${boardContent.board_cd}"></script>
    <script type="text/javascript">
      //-------------------------------------------
      //--------------------이벤트-----------------
      //-------------------------------------------
      //목록
      $( '#btnList' ).click( function(e) {
        e.preventDefault(); 
        location.href = '/Board/Free/getBoardList.do';
      });

      //글 수정
      $( '#btnUpdate' ).click( function() {
        let url = "/Board/Free/updateForm.do";
        url += "?board_cd=" + ${boardContent.board_cd};
        url += "&mode=update";

        location.href = url;
      });

      //글 삭제
      $( '#btnDel' ).click( function() {
        location.href = '/Board/Free/deleteBoard.do?board_cd=' + ${boardContent.board_cd};
      });

      // //댓글 저장
      // $( '#btnCommentSave' ).click( function() {
      //   saveComment('form');
      // })

      // //READY 이벤트
      // $(document).ready(function() {
      //   getCommentList();
      // });

      //-------------------------------------------
      //--------------------함수-----------------
      //-------------------------------------------
      //댓글 수정
      // function fn_updateComment( idCd, content ) {
      //   let textarea = '';
      //   let button = '';
      //   let contTarget = '#content' + idCd;
      //   let buttonTarget = '#commBtn' + idCd;

      //   textarea += '<textarea name="comment_content" id="commCont' + idCd + '" class="form-control" rows="3">' + content + '</textarea>';

      //   button += '<button type="button" class="btn btn-sm btn-secondary" onclick="saveComment(\'commForm' + idCd + '\')">저장</button>';
      //   button += '<button type="button" class="btn btn-sm btn-secondary ml-1" onclick="fn_cancelComment(\'' + idCd + '\',\'' + content + '\')">취소</button>';

      //   $(contTarget).html(textarea);
      //   $( '#commCont' + idCd ).focus(); 
      //   $( '#commCont' + idCd ).val($( '#commCont' + idCd ).val());
      //   $(buttonTarget).html(button);
      // }

      // //댓글 수정 취소
      // function fn_cancelComment( idCd, org_content ) {
      //   let div_cont = '';
      //   let button = '';
      //   let contTarget = '#content' + idCd;
      //   let buttonTarget = '#commBtn' + idCd;

      //   div_cont += org_content;

      //   button += '<button type="button" class="btn btn-sm btn-secondary" onclick="fn_updateComment(\'' + idCd + '\',\'' + org_content + '\')">수정</button>';
      //   button += '<button type="button" class="btn btn-sm btn-secondary ml-1" onclick="delComment(\'commForm' + idCd + '\')">삭제</button>';

      //   $(contTarget).html(div_cont);
      //   $(buttonTarget).html(button);
      // }

      // //댓글 HTML
      // function commetSuccess( result ) {
      //   let ptrHtml = "";

      //   if ( result.length < 1 ) {
      //     ptrHtml = "등록된 댓글이 없습니다.";
      //   } else {
      //     $(result).each(function() {
      //       let idCd = "_" + this.comment_cd + "_" + this.comment_class;

      //       ptrHtml += '<div class="comment_item border-bottom p-2">';
      //       ptrHtml +=  '<form id="commForm' + idCd + '">';
      //       ptrHtml +=    '<input type="hidden" name="board_cd" value="' + this.board_cd + '"></input>'
      //       ptrHtml +=    '<input type="hidden" name="comment_cd" value="' + this.comment_cd + '"></input>'
      //       ptrHtml +=    '<input type="hidden" name="comment_class" value="' + this.comment_class + '"></input>'
      //       ptrHtml +=    '<div id="content' + idCd + '">' + this.comment_content + '</div>';
      //       ptrHtml +=  '</form>';
      //       ptrHtml +=  '<div class="row">';
      //       ptrHtml +=    '<div class="col-sm-6" style="font: 0.8rem grey;">' + this.user_id + '</div>';
      //       ptrHtml +=    '<div class="col-sm-6" style="text-align: right;font: 0.8rem grey;">' + this.in_date + '</div>';
      //       ptrHtml +=  '</div>';
      //       ptrHtml +=  '<div class="row justify-content-end">';
      //       ptrHtml +=    '<div class="col-sm-3">';
      //       ptrHtml +=      '<div class="float-right" id="commBtn' + idCd + '">';
      //       ptrHtml +=        '<button type="button" class="btn btn-sm btn-secondary" onclick="fn_updateComment(\'' + idCd + '\',\'' + this.comment_content + '\')">수정</button>';
      //       ptrHtml +=        '<button type="button" class="btn btn-sm btn-secondary ml-1" onclick="delComment(\'commForm' + idCd + '\')">삭제</button>';
      //       ptrHtml +=      '</div>';
      //       ptrHtml +=    '</div>';
      //       ptrHtml +=  '</div>';
      //       ptrHtml += '</div>';
      //     })
      //   }
      //   $('#replyList').html(ptrHtml);
      // }

      // //댓글 조회 함수
      // function getCommentList() {
      //   let url = "/RestBoard/Free/getCommentList.do";
      //   let params = {"board_cd" : "${boardContent.board_cd}"};

      //   $.ajax({
      //       type: 'POST'
      //     , url: url
      //     , data: params
      //     , dataType: 'json'
      //     , success: function (result) {
      //       commetSuccess(result);
      //     }
      //   })
      // }

      // //댓글 저장 함수
      // function saveComment( fId ) {
      //   let url = "/RestBoard/Free/insertComment.do";
      //   let formId = '#' + fId;
      //   let params = JSON.stringify($(formId).serializeObject());

      //   $.ajax({
      //       type: 'POST'
      //     , url: url
      //     , data: params
      //     , dataType: 'json'
      //     , contentType : "application/json; charset=utf-8"
      //     , success: function (result) {
      //       console.log(result);
      //         getCommentList();
      //     }
      //     , error : function (xhr, status, error) {
      //       alert("댓글을 저장하지 못하였습니다.");
      //     }
      //   })
      // }

      // //댓글 삭제
      // function delComment( idCd ) {
      //   let url = "/RestBoard/Free/deleteComment.do";
      //   let formId = '#' + idCd;
      //   let params = JSON.stringify($(formId).serializeObject());

      //   $.ajax({
      //       type: 'POST'
      //     , url: url
      //     , data: params
      //     , dataType: 'json'
      //     , contentType : "application/json; charset=utf-8"
      //     , success: function (result) {
      //       console.log(result);
      //         alert("댓글이 삭제 되었습니다.");
      //         getCommentList();
      //     }
      //     , error : function (xhr, status, error) {
      //       alert("댓글을 삭제하지 못하였습니다.");
      //     }
      //   })
      // }

      // //serializeObject
      // $.fn.serializeObject = function() {
      //    let o = {};
      //    let a = this.serializeArray();
      //    $.each(a, function() {
      //        if (o[this.name]) {
      //            if (!o[this.name].push) {
      //                o[this.name] = [o[this.name]];
      //            }
      //            o[this.name].push(this.value || '');
      //        } else {
      //            o[this.name] = this.value || '';
      //        }
      //    });
      //    return o;
      // };
    </script>
  </body>
</html>
