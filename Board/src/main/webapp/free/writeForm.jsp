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
  </head>
  <body>
    <div id="wrapper">
      <!-- 상단바 include-->
      <%@ include file = "/layout/header.jsp" %>

      <!-- 메인 컨테이너 -->
      <div class="container container-main">
        <div class="page-title">
          <h4> 글 작성 </h4>
        </div>
        <div>
          <form:form name="form" id="form" role="form" modelAttribute="boardVO" method="post" action="/Board/Free/insertBoard.do">
            <form:hidden path="board_cd"/>
            <input type="hidden" name="mode"/>

            <div class="mb-3">
              <label for="title">제목</label>
              <form:input path="title" type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요"/>
            </div>  
            <form:hidden id="user_id" path="user_id" value="${ath_user_id}"/>
            <div class="mb-3">
              <label for="content">내용</label>
              <form:textarea path="content" class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요"/> 
            </div>      
          </form:form>
          <div >
            <button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
            <button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
          </div>
        </div>
      </div>

      <%@ include file = "/layout/tail.jsp" %>
    </div>

    <script type="text/javascript" src="/js/common.js"></script>
    <script type="text/javascript">
      console.log($("#user_id").val());

      $( '#btnSave' ).click( function(e) {
        e.preventDefault();
        $("#form").submit();
      }); 

      $( '#btnList' ).click( function(e) {
        e.preventDefault(); 
        location.href = '/Board/Free/getBoardList.do';
      });

      $( document ).ready( function() {
        var mode = "<c:out value='${mode}'/>";

        if ( mode == 'update' ) {
          $( "#user_id" ).prop('readonly', true);
          $( "input:hidden[name='board_cd']" ).val('<c:out value="${boardContent.board_cd}"/>');
          $( "input:hidden[name='mode']" ).val('<c:out value="${mode}"/>');
          $( "#title" ).val('<c:out value="${boardContent.title}"/>');
          $( "#content" ).val('<c:out value="${boardContent.content}"/>');
        }
      });
    </script>
  </body>
</html>
