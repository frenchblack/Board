<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri = "http://www.springframework.org/tags/form" %> 
<!-- 댓글 -->
<div class="div_comment_write">
  <form:form name="form" id="form" modelAttribute="commentVO" method="post" action="/RestBoard/Free/insertComment.do">
    <form:hidden path="board_cd" value="${boardContent.board_cd}"/>
    <form:hidden path="comment_class"/>
    <div>
      <form:textarea path="comment_content" class="form-control" rows="3" name="comment_content" id="comment_content" placeholder="내용을 입력해 주세요."/>
    </div>
    <div class="row">
      <div class="col-sm-5">
        <form:input path="user_id" class="form-control" name="user_id" id="user_id" placeholder="작성자를 입력해 주세요."/>
      </div>
      <button type="button" class="btn btn-sm btn-primary" id="btnCommentSave">저장</button>
    </div>
  </form:form>
</div>
<div class="my-3 bg-white rounded shadow-sm" style="padding-top: 10px">
  <h6 class="border-bottom pb-2 mb-0">댓글</h6>
  <div id="replyList"></div>
</div>
