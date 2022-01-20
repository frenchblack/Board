<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri = "http://www.springframework.org/tags/form" %> 

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/common.css">
    <style type="text/css">
      a:link {text-decoration: none; color: #333333;}
      a:visited {text-decoration: none; color: #333333;}
      a:active {text-decoration: none; color: #333333;}
      a:hover {text-decoration: none; color: #333333;}

      .search-group{
        display: inline;
      }

      #searchType {
        display: inline;
      }

      #keyword {
        display: inline;
      }
    </style>
  </head>
  <body>
    <div id="wrapper">
      <%@ include file = "/layout/header.jsp" %>

      <!-- 메인 컨테이너 -->
      <div class="container container-main">
        <div class="mt-4 mb-4">
          <center><h4><a href="/">Board</a></h4></center>
        </div>
        <!--joinForm-->
        <div class="container col-6">
          <form:form name="form" id="form" role="form" modelAttribute="userVO" method="post" action="${pageContext.request.contextPath}/User/login.do">
            <div class="mb-3 form-group">
              <label class="mr-2" for="user_id">ID</label>
              <div class="form-inline">
                <form:input path="user_id" type="text" class="form-control col-12 mr-2" name="user_id" id="user_id" data-valid="[true, 'ID']" placeholder="ID를 입력해 주세요"/>
              </div>
            </div>  
            <div class="mb-3 form-group">
              <label class="mr-2" for="user_pw">비밀번호</label>
              <form:input path="user_pw" type="password" class="form-control col-12 mr-2" name="user_pw" id="user_pw" data-valid="[true, '비밀번호', 'password']" placeholder="비밀번호를 입력해 주세요"/>
            </div>  
            <c:if test="${not empty ERRORMSG}">
              <font color="red">
                ${ERRORMSG}</p>
              </font>
            </c:if>
          </form:form>
          <div>
            <button type="button" class="btn btn-sm btn-primary col-12" id="btnLogin">로그인</button>
          </div>
        </div>
      </div>
      <%@ include file = "/layout/tail.jsp" %>
    </div>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/util/util.js"></script>
    <script type="text/javascript">
      //-------------------------------------------------------
      // 사용자 정의 이벤트
      $( "#btnLogin" ).click( function(){
        if ( !$("#form").chkValid() ) return;
        
        $("#form").submit();
      });
    </script>
  </body>
</html>
