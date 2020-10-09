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
      <%@ include file = "/layout/header.jsp" %>

      <!-- 메인 컨테이너 -->
      <div class="container container-main">
        <div class="page-title">
          <h4> 자유게시판 </h4>
        </div>
        <div>
          <table class="table table-hover table-bordered">  
            <thead class="thead-dark">
              <tr class="table-tr">
                <th scope="col">글번호</th>
                <th scope="col">제목</th>
                <th scope="col">내용</th>
                <th scope="col">직성자</th>
                <th scope="col">작성일</th>
              </tr>
            </thead>
            <tbody>
              <c:choose>
                <c:when test="${empty boardList}">
                  <tr class="table-tr"><td colspan="5" align="center">데이터가 없습니다.</tr>
                </c:when>
                <c:when test="${!empty boardList}">
                  <c:forEach var="list" items="${boardList}">
                    <tr class="table-tr">
                      <td><c:out value="${list.board_cd}"/></td>
                      <td><c:out value="${list.title}"/></td>
                      <td><c:out value="${list.content}"/></td>
                      <td><c:out value="${list.user_id}"/></td>
                      <td><c:out value="${list.in_date}"/></td>
                    </tr>
                  </c:forEach>
                </c:when>  
              </c:choose>
            </tbody>
          </table>
          <div>
            <button type="button" class="btn btn-sm btn-primary" id="btnWriteForm">글쓰기</button>
          </div>
        </div>
      </div>

    <%@ include file = "/layout/tail.jsp" %>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

    <script type="text/javascript">
      $( '#btnWriteForm' ).click( function() {
        $( location ).attr( 'href', '/Board/Free/writeBoard.do' );
      });
    </script>
  </body>
</html>
