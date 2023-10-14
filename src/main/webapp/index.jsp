<!-- PLAN-IT 웹 홈페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.min.js"></script>
  
    <title>Main Homepage</title>

    <style>
    
    main {
      margin-left: -50px;
      margin-right: -50px;
      margin-bottom: 100px;
    }

    /* nav */
    #topMenu-menu {
      float: left;
      margin: -35px auto;
      margin-left: -63px;
    }

    #topMenu-menu li {
      float: left;
      padding-left: 30px; /*nav 간격*/
    }

    #topMenu-menu a {
      text-decoration: none;
      color: #002C7F;
      font-weight: bold;
      font-size: 1.0em;
    }

    #topMenu-menu a:hover { 
      color: orange; /* 마우스 포인터 올리면 색상 변화*/
    }

    /* 라인 */
    .line {
      border-top: 1px solid lightgray;
      margin: 1px -109px;
      padding-top: 50px;
    }
    
    </style>

  </head>

  <body>
    <div id="container">
      <%@ include file="/header.jsp"%>
      <main>

      <div class="line"></div>

      <nav>
        <ul id="topMenu-menu">
          <li><a href="#">이미지 기반 추천</a></li>
          <li><a href="./theme/theme.jsp">테마별 추천</a></li>
          <li><a href="./top10/top10.jsp">Top 10</a></li>
          <li><a href="#">인기 검색 순위</a></li>
          <li><a href="#">사용방법</a></li>
        </ul>
      </nav>


      <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="./images/03.jpg" class="d-block w-100" height= "550px"  alt="...">
          </div>
          <div class="carousel-item">
            <img src="./images/06.jpg" class="d-block w-100" height= "550px" alt="...">
          </div>
          <div class="carousel-item">
            <img src="./images/16.jpg" class="d-block w-100" height= "550px"  alt="...">
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
      
      </main>
      <%@ include file="/footer.jsp"%>
    </div>
  </body>
</html>