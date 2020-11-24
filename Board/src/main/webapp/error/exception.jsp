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
        <p>데이터를 처리 하는 과정에서 문제가 발생하였습니다.</p>
        <p>관리자에게 문의하여 주십시오.</p>
        <h3>${exception.getMessage()}</h3>
        <ul>
        <c:forEach items="${exception.getStackTrace()}" var="stack">
          <li>${stack.toString()}</li>
        </c:forEach>
        </ul>
      </div>

      <%@ include file = "/layout/tail.jsp" %>
    </div>

    <script type="text/javascript" src="/js/common.js"></script>
    <script type="text/javascript">
    </script>
  </body>
</html>
