<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri = "http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- 상단 navbar -->
<nav class="navbar fixed-top navbar-expand-sm navbar-dark bg-dark navbar-top">
	<a class="navbar-brand" href="/">Board</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	  <span class="navbar-toggler-icon">
	  </span>
	</button>
	<div class="collapse navbar-collapse es-12" id="navbarSupportedContent">
	  <ul class="navbar-nav mr-auto">
	    <li class="nav-item active">
	      <a class="nav-link" href="/Board/Free/getBoardList.do">자유게시판
	      </a>
	    </li>
	  </ul>
	  <ul class="navbar-nav navbar-right">
	  	<sec:authorize access="isAuthenticated()">
	  		<sec:authentication property="principal.user_id" var="ath_user_id"/>
	  		<sec:authentication property="principal.user_nm" var="ath_user_nm"/>
	  		<a class="nav-link">어서오세요 ${ath_user_nm}</a>
	  	</sec:authorize>
	    <li class="nav-item active">
	      <a class="nav-link" href="/User/getJoinForm.do">회원가입</a>
	    </li>
	    <sec:authorize access="isAnonymous()">
		    <li class="nav-item active">
		      <a class="nav-link" href="/User/getLoginForm.do">로그인
		      </a>
		    </li>
		</sec:authorize>
	    <sec:authorize access="isAuthenticated()">
		    <li class="nav-item active">
<!-- 			    <form action="/User/logout.do" method="POST">
			        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			        <button type="submit">LOGOUT</button>
		    	</form> -->
		      <a class="nav-link" onclick="document.getElementById('logout_form').submit();">로그아웃</a>
		      <form id="logout_form" action="/User/logout.do" method="POST">
		      	<sec:csrfInput/>
		      	<!-- <input type="hidden" name="name"> -->
		      </form> 
		    </li> 
		</sec:authorize>
	  </ul>
	</div>
	<!-- Login Modal -->
<!-- 	<div class="modal fade" id="loginModal" tabindex="-1" data-backdrop="false" aria-labelledby="loginModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="loginModalLabel">Login</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	          <form name="loginForm" id="loginForm" action="/User/login.do" method="POST">
	          	<sec:csrfInput/>
	            <div class="mb-3 form-group">
	              <label class="mr-2" for="user_id">ID</label>
	              <div class="form-inline">
	                <input  type="text" class="form-control col-12 mr-2" name="user_id" id="user_id" data-valid="[true, 'ID']" placeholder="ID를 입력해 주세요"/>
	              </div>
	            </div>  
	            <div class="mb-3 form-group">
	              <label class="mr-2" for="user_pw">비밀번호</label>
	              <input type="password" class="form-control col-12 mr-2" name="user_pw" id="user_pw" data-valid="[true, '비밀번호', 'password']" placeholder="비밀번호를 입력해 주세요"/>
	            </div>  
	          </form>
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-primary" id="loginBtn">로그인</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div> -->
</nav>