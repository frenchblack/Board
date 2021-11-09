<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>title</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/common/common.css">
    <style type="text/css">
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
        <div class="page-title">
          <h4> 자유게시판 </h4>
        </div>
        <div>
          <!--board-->
          <table class="table table-hover table-bordered">  
            <thead class="thead-dark">
              <tr class="table-tr">
                <th scope="col">글번호</th>
                <th scope="col">제목</th>
                <!-- <th scope="col">내용</th> -->
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
                      <td>
                        <a href="${uriParser.freeContent}${uriParser.parsingURI({'board_cd':list.board_cd})}" style="color: black;">
                          <c:out value="${list.title}"/>
                        </a>
                      </td>
                      <!-- <td><c:out value="${list.content}"/></td> -->
                      <td><c:out value="${list.user_id}"/></td>
                      <td><c:out value="${list.in_date}"/></td>
                    </tr>
                  </c:forEach>
                </c:when>  
              </c:choose>
            </tbody>
          </table>
          <!-- pagination -->
          <div id="paginationBox">
            <ul class="pagination justify-content-center">
              <c:if test="${pagination.prev}">
                <li class="page-item"><a class="page-link" href="${uriParser.freeList}${uriParser.parsingURI({'page' : pagination.startPage - 1, 'range' : pagination.range - 1}, searchVO)}">Previous</a></li>
              </c:if>      
              <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
                <c:choose>
                  <c:when test="${pagination.page == idx}">
                    <li class="page-item active"><span class="page-link">${idx}</span></li>
                  </c:when>
                  <c:otherwise>
                    <li class="page-item">
                       <a class="page-link" href="${uriParser.freeList}${uriParser.parsingURI({'page':idx, 'range':pagination.range}, searchVO)}">${idx} </a></li>
                  </c:otherwise>
                </c:choose>
              </c:forEach>      
              <c:if test="${pagination.next}">
                <li class="page-item"><a class="page-link" href="${uriParser.freeList}${uriParser.parsingURI({'page':pagination.endPage + 1, 'range':pagination.range + 1}, searchVO)}">Next</a></li>
              </c:if>
            </ul>
          </div>
          <div class="justify-content-center">
            <sec:authorize access="isAuthenticated()">
              <button type="button" class="btn btn-sm btn-primary" id="btnWriteForm">글쓰기</button>
            </sec:authorize>
            <div class="form-group search-group justify-content-center">
              <select class="form-control col-1" name="searchType" id="searchType">
                <option value="all">전체</option>
                <option value="title">제목</option>
                <option value="content">내용</option>
                <option value="in_id">작성자</option>
              </select>
              <input type="text" class="form-control col-4" name="keyword" id="keyword">
              <button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
            </div>
          </div>
        </div>
      </div>

      <%@ include file = "/layout/tail.jsp" %>
    </div>

    <script type="text/javascript" src="/js/common.js"></script>
    <script type="text/javascript">
      //이벤트 등록
      $( '#btnWriteForm' ).click( function() {
        location.href = "${uriParser.freeWirte}";
      });

      $( '#btnSearch' ).on( 'click', fn_exSearch );

      $( '#keyword' ).on( 'keydown', function( e ) {
        if ( e.keyCode == 13 ) {
          fn_exSearch();
        }
      });

      //-------------------------------------------------------
      //사용자 정의 이벤트

      //검색 함수
      function fn_exSearch() {
        var url = "${uriParser.freeList}";

        if ( $( '#keyword' ).val() == "" ) {
          location.href = url;
          return;
        }

        url += "?searchType=" + $( '#searchType' ).val() + "&keyword=" + $( '#keyword' ).val();

        location.href = url;
      }

    //   function fn_moveContent( board_cd ) {
    //     var url = "/Board/Free/getBoardContent.do";
    //     url = url + "?board_cd=" + board_cd;
    //     location.href = url;
    //   }

    // //이전 버튼 이벤트
    // function fn_prev(page, range, rangeSize) {
    //     var page = ((range - 2) * rangeSize) + Number(rangeSize);
    //     var range = range - 1;
        
    //     var url = "/Board/Free/getBoardList.do";
    //     url = url + "?page=" + page;
    //     url = url + "&range=" + range;
        
    //     location.href = url;
    //   }

    //   //페이지 번호 클릭
    //   function fn_pagination(page, range, rangeSize, searchType, keyword) {
    //     var url = "/Board/Free/getBoardList.do";
    //     url = url + "?page=" + page;
    //     url = url + "&range=" + range;

    //     location.href = url;  
    //   }

    //   //다음 버튼 이벤트
    //   function fn_next(page, range, rangeSize, a_obj) {
    //     var page = parseInt((range * rangeSize)) + 1;
    //     var range = parseInt(range) + 1;
      
    //     var url = "/Board/Free/getBoardList.do";
    //     url = url + "?page=" + page;
    //     url = url + "&range=" + range;
       

    //     location.href = url;  
    //     //a_obj.setAttribute('href', url);
    //   }
    </script>
  </body>
</html>
