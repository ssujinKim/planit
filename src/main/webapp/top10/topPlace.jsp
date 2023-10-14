<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- PLAN-IT Top 10 -->

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css">
  <title>Top 10 장소</title>
  <style>

    main {
      margin-top: -120px;
      height: 2100px;
      margin-left: 40px;
    }

    /* 이미지 타이틀 */
    .img-title {
      margin-top: 170px;
      margin-bottom: 10px;
    }
  
    .prod-list {
      list-style: none;
      padding: 0;  
    }

    .prod-list li {
      float: left;
      padding: 0;
      margin: 10px;
      overflow: hidden;
      position: relative;
    }
    
    .prod-list img {
      margin: 0px;
      padding: 0;
      float: left;
      z-index: 5;
    } 

    .prod-list .caption {
      position: absolute;
      top: 350px;  /* 기준 위치보다 200px 아래로 */
      width: 300px;
      height: 200px;
      padding-top: 13px;
      background:rgba(0,0,0,0.6);  /* 반투명한 검정 배경 */ 
      opacity: 0;  /* 화면에 보이지 않게 */ 
      transition: all 0.6s ease-in-out;  /* 나타날 때 부드럽게 트랜지션 추가 */
      z-index: 10;  /* 다른 요소보다 위에 있도록 */ 
    }

    .prod-list li:hover .caption {
      opacity: 1;  /* 설명글이 화면에 보이게 */ 
      transform: translateY(-200px);  /* 설명글이 위로 200px 이동하게 */
    }  

    .prod-list .caption h2 {
      color: #fff;
      text-align: center;
      font-size: 20px;
      padding-left: 30px;
    }      

    /* 라인 */
    .line {
      border-top: 1px solid white;
      margin: 1px -158px;
      padding-top: 200px;
      padding-bottom: 100px;
    }
  </style>
</head>

<body>
  <div id="container">
    <%@ include file="/header.jsp"%>

    <main>
      <ul class="prod-list">
        <div class = "img-title">
          <h4><b>인기 체험명소 Top 10</b></h4>
        </div>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
          <div class="caption">
            <h2>우도</h2>
          </div>
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
      </ul>

      <div class="line"></div>

      <ul class="prod-list">
        <div class = "img-title">
          <h4><b>인기 호텔 Top 10</b></h4>
        </div>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
      </ul>

      <div class="line"></div>

      <ul class="prod-list">
        <div class = "img-title">
          <h4><b>인기 맛집 Top 10</b></h4>
        </div>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
      </ul>

      <div class="line"></div>

      <ul class="prod-list">
        <div class = "img-title">
          <h4><b>인기 카페 Top 10</b></h4>
        </div>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
        <li>
          <img src="../images/03.jpg" height="200px" width= "200px">
        </li>
      </ul>
    </main>
    <%@ include file="/footer.jsp"%>
  </div>
</body>
</html>