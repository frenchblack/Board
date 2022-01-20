<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri = "http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
          <form:form name="form" id="form" role="form" modelAttribute="userVO" method="post" action="${pageContext.request.contextPath}/User/join.do">
            <div class="mb-3 form-group">
              <label class="mr-2" for="user_id">ID</label>
              <div class="form-inline">
                <form:input path="user_id" type="text" class="form-control col-12 mr-2" name="user_id" id="user_id" data-valid="[true, 'ID']" placeholder="ID를 입력해 주세요"/>
                <!-- <button type="button" class="btn btn-sm btn-primary" id="chkDouble">중복확인</button> -->
              </div>
            </div>  
            <div class="mb-3 form-group">
              <label class="mr-2" for="user_pw">비밀번호</label>
              <form:input path="user_pw" type="password" class="form-control col-12 mr-2" name="user_pw" id="user_pw" data-valid="[true, '비밀번호', 'password']" placeholder="비밀번호를 입력해 주세요"/>
            </div>  
            <div class="mb-3 form-group">
              <label class="mr-2" for="user_pw_r">비밀번호 재확인</label>
              <input type="password" class="form-control col-12 mr-2" name="user_pw_r" id="user_pw_r" data-valid="[true, '재확인 비밀번호', 'password']" placeholder="비밀번호를 입력해 주세요"/>
            </div>
            <div class="mb-3 form-group">
              <label class="mr-2" for="user_nm">성명</label>
              <form:input path="user_nm" type="text" class="form-control col-12 mr-2" name="user_nm" id="user_nm" data-valid="[true, '성명']" placeholder="성명을 입력해 주세요"/>
            </div> 
          </form:form>
          <div>
            <button type="button" class="btn btn-sm btn-primary col-12" id="btnJoin">가입</button>
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
      $( "#btnJoin" ).click( function(){
        let url = "${pageContext.request.contextPath}/RestUser/join.do";
        let obj = $("#form").serializeObject();
        let params = JSON.stringify(obj);

        if ( !$("#form").chkValid() ) return;

        if ( $("#user_pw").val() != $("#user_pw_r").val() ) {
          alert("비밀번호와 재입력 비밀번호가 일치하지 않습니다.");
          return;
        }

        $.ajax({
            type: 'POST'
          , url: url
          , data: params
          , dataType: 'json'
          , contentType : "application/json; charset=utf-8"
          , success: function (result) {
              switch(result) {
                case 1 : alert("회원가입이 완료되었습니다.");
                  history.back();
                  break;
               default : alert("회원가입에 실패하였습니다.");
                  break;
              }
          }
          , error : function (xhr, status, error) {
            alert("회원가입에 실패하였습니다.");
          }
        });
      });
    </script>
  </body>
</html>
