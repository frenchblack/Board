<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 상단 navbar -->
<nav class="navbar navbar-expand-sm navbar-dark bg-dark navbar-top">
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
	    <li class="nav-item active">
	      <a class="nav-link" href="/User/getJoinForm.do">회원가입
	      </a>
	    </li>
	    <li class="nav-item active">
	      <a class="nav-link" href="#">로그인
	      </a>
	    </li>
	  </ul>
	</div>
</nav>