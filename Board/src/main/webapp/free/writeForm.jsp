<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
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
          <form name="form" id="form" role="form" method="post" action="/Board/Free/insertBoard.do">
            <div class="mb-3">
              <label for="title">제목</label>
              <input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요">
            </div>  
            <div class="mb-3">
              <label for="user_id">작성자</label>
              <input type="text" class="form-control" name="user_id" id="user_id" placeholder="이름을 입력해 주세요">
            </div>           
            <div class="mb-3">
              <label for="content">내용</label>
              <textarea class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요" ></textarea>
            </div>      
          </form>
          <div >
            <button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
            <button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
          </div>
        </div>
      </div>

    <%@ include file = "/layout/tail.jsp" %>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

    <script type="text/javascript">
      $( '#btnSave' ).click( function(e) {
        e.preventDefault();
        $("#form").submit();
      }); 

      $( '#btnList' ).click( function(e) {
        e.preventDefault(); 
        $( location ).attr('href', '/Board/Free/getBoardList.do')
      });
    </script>
  </body>
</html>
