<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri = "http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="_csrf_parameterName" content="${_csrf.parameterName}" />
    <meta name="_csrf" content="${_csrf.token}" />
    <title>title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/common.css">
    <style type="text/css">
      .ck-editor__editable {
          min-height: 300px;
          max-height: 500px;
      }
    </style>
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
          <form:form name="form" id="form" role="form" modelAttribute="boardVO" method="post" action="${pageContext.request.contextPath}/Board/Free/insertBoard.do">
            <form:hidden path="board_cd"/>
            <form:hidden id="s_content" name="s_content" path="s_content"/>
            <form:hidden id="thumbnail" name="thumbnail" path="thumbnail"/>
            <input type="hidden" name="mode"/>

            <div class="mb-3">
              <label for="title">제목</label>
              <form:input path="title" type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요"/>
            </div>  
            <form:hidden id="user_id" path="user_id" value="${ath_user_id}"/>
            <div class="mb-3">
              <label for="content">내용</label>
              <form:textarea path="content" class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요"/> 
              <script>

              </script>
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
    <script src="https://cdn.ckeditor.com/ckeditor5/31.0.0/classic/ckeditor.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/uploadAdapter.js"></script>
    <script type="text/javascript">
      var contEditor;

      $( '#btnSave' ).click( function(e) {
        // console.log(contEditor.getData());
        // console.log(getThumbnail(contEditor.getData()));
        $('#thumbnail').val(getThumbnail(contEditor.getData()));
        $('#s_content').val(removeHTMLTag(contEditor.getData()));
        e.preventDefault();
        $("#form").submit();  
      }); 

      $( '#btnList' ).click( function(e) {
        e.preventDefault(); 
        location.href = '${pageContext.request.contextPath}/Board/Free/getBoardList.do';
      });

      $( document ).ready( function() {
        var mode = "<c:out value='${mode}'/>";

        if ( mode == 'update' ) {
          $( "#user_id" ).prop('readonly', true);
          $( "input:hidden[name='board_cd']" ).val('<c:out value="${boardContent.board_cd}"/>');
          $( "input:hidden[name='mode']" ).val('<c:out value="${mode}"/>');
          $( "#title" ).val('<c:out value="${boardContent.title}"/>');
          $( "#content" ).val('<c:out escapeXml="false" value="${boardContent.content}"/>');
        }

        ClassicEditor
            .create( document.querySelector( '#content' ), {
              extraPlugins: [ MyCustomUploadAdapterPlugin ]
            })
            .then( editor => {
              contEditor = editor;
            })
            .catch( error => {
                console.error( error );
            } );
      });

      //썸네일 찾기
      function getThumbnail(cont) {
        let f_index = -1;
        let l_index = -1;
        let no_image = "${pageContext.request.contextPath}/img/no_image.jpg";

        f_index = cont.indexOf("<img src=\"", 0) + 10;

        if ( f_index == -1 ) return no_image;

        l_index = cont.indexOf("\"", f_index); 

        if ( l_index == -1 ) {
          return no_image;
        } else {
          return cont.substring(f_index, l_index) + "&isThumb=true";
        } 
      }
    </script>
  </body>
</html>
