<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri = "http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="_csrf_header" content="${_csrf.headerName}" />
    <meta name="_csrf" content="${_csrf.token}" />

    <title>title</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/common/common.css">
    <link rel="stylesheet" type="text/css" href="/css/common/comment.css">
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
          <c:if test="${ath_user_id == boardContent.user_id}">
            <button type="button" class="btn btn-sm btn-primary" id="btnUpdate">수정</button>
            <button type="button" class="btn btn-sm btn-primary" id="btnDel">삭제</button>
          </c:if>
          <button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
        </div>
        <!-- 댓글 -->
        <%@ include file = "/layout/comment.jsp" %>
      </div>

      <%@ include file = "/layout/tail.jsp" %>
    </div>

    <script type="text/javascript" src="/js/common.js"></script>
    <script type="text/javascript" src="/js/util/util.js"></script>
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
    </script>
  </body>
</html>
