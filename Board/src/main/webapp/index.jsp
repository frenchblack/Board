<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>title</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/common/common.css">
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
          <ol class="carousel-indicators">
            <li class="bg-dark border border-dark" data-target="#multi-item-example" data-slide-to="0" class="active"></li>
            <li class="bg-dark border border-dark" data-target="#multi-item-example" data-slide-to="1"></li>
            <li class="bg-dark border border-dark" data-target="#multi-item-example" data-slide-to="2"></li>
            <li class="bg-dark border border-dark" data-target="#multi-item-example" data-slide-to="3"></li>
          </ol>

          <div class="carousel-inner v-2" role="listbox">
            
            <div class="carousel-item active">
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
            </div>
            <div class="carousel-item">
              <div class="col-12 col-md-3">
                <div class="card md-2">
                  <img src="" class="card-img-top" alt="Card image" onerror="this.src='/img/no_image.jpg'">
                  <div class="card-body">
                    <h5 class="card-title">2.Card title</h5>
                    <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
                    <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                  </div>
                </div>
              </div>
            </div>
            <div class="carousel-item">
              <div class="col-12 col-md-3">
                <div class="card md-2">
                  <img src="" class="card-img-top" alt="Card image" onerror="this.src='/img/no_image.jpg'">
                  <div class="card-body">
                    <h5 class="card-title">3.Card title</h5>
                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
                    <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                  </div>
                </div>
              </div>
            </div>
            <div class="carousel-item">
              <div class="col-12 col-md-3">
                <div class="card md-2">
                  <img src="" class="card-img-top" alt="Card image" onerror="this.src='/img/no_image.jpg'">
                  <div class="card-body">
                    <h5 class="card-title">4.Card title</h5>
                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
                    <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                  </div>
                </div>
              </div>
            </div>
            <div class="carousel-item">
              <div class="col-12 col-md-3">
                <div class="card md-2">
                  <img src="" class="card-img-top" alt="Card image" onerror="this.src='/img/no_image.jpg'">
                  <div class="card-body">
                    <h5 class="card-title">5.Card title</h5>
                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
                    <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                  </div>
                </div>
              </div>
            </div>  

          </div>

        </div>
      </div>

<!--         <div class="card-deck">
  <div class="card" onclick="alert('클릭');">
    <img src="" class="card-img-top" alt="Card image" onerror="this.src='https://thumbs.dreamstime.com/b/no-image-available-icon-photo-camera-flat-vector-illustration-132483097.jpg'">
    <div class="card-body">
      <h5 class="card-title">Card title</h5>
      <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
  <div class="card">
    <img src="" class="card-img-top" alt="Card image" onerror="this.src='https://thumbs.dreamstime.com/b/no-image-available-icon-photo-camera-flat-vector-illustration-132483097.jpg'">
    <div class="card-body">
      <h5 class="card-title">Card title</h5>
      <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
  <div class="card">
    <img src="" class="card-img-top" alt="Card image" onerror="this.src='https://thumbs.dreamstime.com/b/no-image-available-icon-photo-camera-flat-vector-illustration-132483097.jpg'">
    <div class="card-body">
      <h5 class="card-title">Card title</h5>
      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
  <div class="card">
    <img src="" class="card-img-top" alt="Card image" onerror="this.src='https://thumbs.dreamstime.com/b/no-image-available-icon-photo-camera-flat-vector-illustration-132483097.jpg'">
    <div class="card-body">
      <h5 class="card-title">Card title</h5>
      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
</div>
      </div>
    </div> -->

      <%@ include file = "/layout/tail.jsp" %>
    </div>
    
    <script type="text/javascript" src="/js/common.js"></script>
    <script type="text/javascript">
      $( '#multi-item-example' ).carousel ({
        interval: 10000
      })

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
    </script>
  </body>
</html>
