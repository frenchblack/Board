<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="_csrf_header" content="${_csrf.headerName}" />
    <meta name="_csrf" content="${_csrf.token}" />
    <title>title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/common.css">
    <style type="text/css">
      @media (max-width: 768px) {
          .carousel-inner .carousel-item > div {
              display: none;
          }
          .carousel-inner .carousel-item > div:first-child {
              display: block;
          }
      }

      .carousel-inner .carousel-item.active,
      .carousel-inner .carousel-item-next,
      .carousel-inner .carousel-item-prev {
          display: flex;
      }

      /* display 4 */
      @media (min-width: 768px) {
          
          .carousel-inner .carousel-item-right.active,
          .carousel-inner .carousel-item-next {
            transform: translateX(25.000%);
          }
          
          .carousel-inner .carousel-item-left.active, 
          .carousel-inner .carousel-item-prev {
            transform: translateX(-25.000%);
          }
      }

      .carousel-inner .carousel-item-right,
      .carousel-inner .carousel-item-left{ 
        transform: translateX(0);
      }

      .card-height {
        height: 350px;
      }
    </style>
  </head>
  <body>
    <div id="wrapper">
      <%@ include file = "/layout/header.jsp" %>

      <!-- 메인 컨테이너 -->
      <div class="container container-main">

        <!--Carousel Wrapper-->
        <div id="multi-item-example" class="carousel slide carousel-multi-item v-2" data-ride="carousel">
          <!-- Controls -->
          <a class="carousel-control-prev w-auto" href="#multi-item-example" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon bg-dark border border-dark rounded-circle" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next w-auto" href="#multi-item-example" role="button" data-slide="next">
              <span class="carousel-control-next-icon bg-dark border border-dark rounded-circle" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
          </a>
         
          <!--Indicators-->
<!--           <ol class="carousel-indicators">
            <li class="bg-dark border border-dark" data-target="#multi-item-example" data-slide-to="0" class="active"></li>
            <li class="bg-dark border border-dark" data-target="#multi-item-example" data-slide-to="1"></li>
            <li class="bg-dark border border-dark" data-target="#multi-item-example" data-slide-to="2"></li>
            <li class="bg-dark border border-dark" data-target="#multi-item-example" data-slide-to="3"></li>
          </ol> -->

          <div id="homeCarousel" class="carousel-inner v-2" role="listbox">   
<!--             <div class="carousel-item active">
              <div class="col-12 col-md-3">
                <div class="card md-2" onclick="alert('클릭');">
                  <img src="" class="card-img-top" alt="Card image" onerror="this.src='/img/no_image.jpg'">
                  <div class="card-body">
                    <h5 class="card-title">1.Card title</h5>
                    <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                    <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                  </div>
                </div>
              </div>
            </div> -->
          </div>

        </div>
      </div>
      <%@ include file = "/layout/tail.jsp" %>
    </div>
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
    <script type="text/javascript">
      //READY 이벤트
      $(document).ready(function() {
        getNewList();
      });

      //게시판 최신글 조회
      function getNewList() {
        let url = "${pageContext.request.contextPath}/RestBoard/Home/getNewList.do";

        $.ajax({
            type: 'POST'
          , url: url
          , data: ''
          , dataType: 'json'
          , success: function ( result ) {
            console.log(result);
            setCarouselItem(result);
          }
        });
      }

      //캐러셀 아이템 셋팅
      function setCarouselItem( result ) {
        let carouselHTML = "";

        //게시물 개수 확인
        if ( result.length > 0 ) {
          $( result ).each(function(index) {
            let firstId = index==0?'id="carousel0" ':'';

            carouselHTML += '<div ' + firstId + 'class="carousel-item">';
            carouselHTML +=   '<div class="col-12 col-md-3" onclick="moveContent(' + this.board_cd + ');" style="cursor:pointer;">';
            carouselHTML +=     '<div class="card md-2 card-height">';
            carouselHTML +=       '<img src="" class="card-img-top" alt="Card image" onerror="this.src=\'' + this.thumbnail + '\'">';
            carouselHTML +=       '<div class="card-body">';
            carouselHTML +=         '<h5 class="card-title">' + this.title + '</h5>';
            carouselHTML +=       '</div>';
            carouselHTML +=     '</div>';
            carouselHTML +=   '</div>';
            carouselHTML += '</div>';
          });

          $('#homeCarousel').html(carouselHTML);
          $('#carousel0').addClass('active');
        } else {
          //아무글도 없을 때 등록된 게시글이 없습니다.
        }
        activeCarousel();
      }

      function activeCarousel() {
        $( '#multi-item-example' ).carousel ({
          interval: 10000
        });

        $( '.carousel .carousel-item' ).each ( function () {
          var minPerSlide = 4;
          var next = $(this).next();
          if ( !next.length ) {
          next = $(this).siblings(':first');
          }
          next.children(':first-child').clone().appendTo( $(this) );
          
          for ( var i = 0 ; i < minPerSlide ; i++ ) {
              next=next.next();
              if ( !next.length ) {
                next = $(this).siblings(':first');
              }
              
              next.children(':first-child').clone().appendTo($(this));
          }
        });
      }

      function moveContent(board_cd) {
        location.href = "${pageContext.request.contextPath}/Board/Free/getBoardContent.do?board_cd=" + board_cd;
      }
    </script>
  </body>
</html>
