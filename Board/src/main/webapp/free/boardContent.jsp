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
        <div class="div_comment_write">
          <form:form name="form" id="form" modelAttribute="commentVO" method="post" action="/RestBoard/Free/insertComment.do">
            <form:hidden path="board_cd" value="${boardContent.board_cd}"/>
            <form:hidden path="comment_class"/>
            <div>
              <form:textarea path="comment_content" class="form-control" rows="3" name="comment_content" id="comment_content" placeholder="내용을 입력해 주세요."/>
            </div>
            <div class="row">
              <div class="col-sm-5">
                <form:input path="user_id" class="form-control" name="user_id" id="user_id" placeholder="작성자를 입력해 주세요."/>
              </div>
              <button type="button" class="btn btn-sm btn-primary" id="btnCommentSave">저장</button>
            </div>
          </form:form>
        </div>
        <div class="my-3 bg-white rounded shadow-sm" style="padding-top: 10px">
          <h6 class="border-bottom pb-2 mb-0">댓글</h6>
          <div id="replyList"></div>
        </div> 
      </div>

      <%@ include file = "/layout/tail.jsp" %>
    </div>

    <script type="text/javascript" src="/js/common.js"></script>
    <script type="text/javascript">
      $( '#btnList' ).click( function(e) {
        e.preventDefault(); 
        location.href = '/Board/Free/getBoardList.do';
      });

      $( '#btnUpdate' ).click( function() {
        var url = "/Board/Free/updateForm.do";
        url += "?board_cd=" + ${boardContent.board_cd};
        url += "&mode=update";

        location.href = url;
      });

      $( '#btnDel' ).click( function() {
        location.href = '/Board/Free/deleteBoard.do?board_cd=' + ${boardContent.board_cd};
      });

      $( '#btnCommentSave' ).click( function() {
        $("#form").submit();
      })

      function commetSuccess(result) {
        var ptrHtml = "";

        if(result.length < 1) {
          ptrHtml = "등록된 댓글이 없습니다.";
        } else {
          $(result).each(function(){
            ptrHtml += this.board_cd + "/" + this.comment_content;
          })
        }
        $('#replyList').html(ptrHtml);
      }

      function getCommentList() {
        var url = "/RestBoard/Free/getCommentList.do";
        var params = {"board_cd" : "${boardContent.board_cd}"};

        $.ajax({
            type: 'POST'
          , url: url
          , data: params
          , dataType: 'json'
          , success: function (result) {
            commetSuccess(result);
          }
        })
      }

      $(document).ready(function() {
        getCommentList();
      });
    </script>
  </body>
</html>
