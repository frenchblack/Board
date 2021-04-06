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
          <center><h4><a href="/">자유게시판</a></h4></center>
        </div>
        <!--joinForm-->
        <div class="container col-6">
          <form:form name="form" id="form" role="form" modelAttribute="userVO" method="post" action="/User/join.do">
            <div class="mb-3 form-group">
              <label class="mr-2" for="user_id">ID</label>
              <div class="form-inline">
                <form:input path="user_id" type="text" class="form-control col-10 mr-2" name="user_id" id="user_id" placeholder="ID를 입력해 주세요"/>
                <button type="button" class="btn btn-sm btn-primary" id="chkDouble">중복확인</button>
              </div>
            </div>  
            <div class="mb-3 form-group">
              <label class="mr-2" for="user_pw">비밀번호</label>
              <form:input path="user_pw" type="password" class="form-control col-12 mr-2" name="user_pw" id="user_pw" placeholder="비밀번호를 입력해 주세요"/>
            </div>  
            <div class="mb-3 form-group">
              <label class="mr-2" for="user_pw_r">비밀번호 재확인</label>
              <input type="password" class="form-control col-12 mr-2" name="user_pw_r" id="user_pw_r" placeholder="비밀번호를 입력해 주세요"/>
            </div>
            <div class="mb-3 form-group">
              <label class="mr-2" for="user_nm">성명</label>
              <form:input path="user_nm" type="text" class="form-control col-12 mr-2" name="user_nm" id="user_nm" placeholder="성명을 입력해 주세요"/>
            </div> 
          </form:form>
          <div>
            <button type="button" class="btn btn-sm btn-primary col-12" id="btnJoin">가입</button>
          </div>
        </div>
      </div>
      <%@ include file = "/layout/tail.jsp" %>
    </div>

    <script type="text/javascript" src="/js/common.js"></script>
    <script type="text/javascript">
      //-------------------------------------------------------
      //사용자 정의 이벤트
    </script>
  </body>
</html>
