<!-- 이미지 추천 페이지 4 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" />
	<script src="https://kit.fontawesome.com/9c2237f8ea.js" crossorigin="anonymous"></script>
	<link href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css" rel="stylesheet" type="text/css" />
	<title>이미지 기반 추천4</title>
	
    <style>
      * {
        font-family: 'Spoqa Han Sans Neo', 'sans-serif';
      }

      main {
        height: 630px;
        background-color: rgb(232, 232, 232);
        margin-bottom: 70px;
      }

      .box {
        padding-top: 30px;
      }

      .main_box {
        margin-left: 30px;
        margin-right: 30px;
        background-color: white;
        height: 570px;
      }

      .title h2 {
        padding-top: 50px;
      }

      .prod-list {
        list-style: none;
        padding: 0;
        margin-top: -15px;
        margin-left: 120px;
      }

      .prod-list li {
        padding: 0;
        margin: 27px;
        overflow: hidden;
        position: relative;
        display: inline-block;
      }

      .prod-list img {
        float: left;
        z-index: 5;
        margin-bottom: 15px;
        border-radius: 0px;
      }

      .prod-list .caption h2 {
        margin-left: 65px;
        font-size: 20px;
      }

      .prod-list .caption h6 {
        text-align: center;
      }

      .image-list {
        list-style: none;
        margin-left: 600px;
      }

      .img-title {
        margin-top: -570px;
        margin-left: 650px;
        margin-bottom: -10px;
      }

      .image-list li {
        float: left;
        padding: 0;
        margin: 10px;
        overflow: hidden;
        position: relative;
      }

      .image-list img {
        z-index: 5;
        border-radius: 5px;
      }

      .image-list2 {
        list-style: none;
        margin-left: 600px;
      }

      .img-title2 {
        margin-top: 170px;
        margin-left: 650px;
        margin-bottom: -10px;
      }

      .image-list2 li {
        float: left;
        padding: 0;
        margin: 10px;
        overflow: hidden;
        position: relative;
      }

      .image-list2 img {
        z-index: 5;
        border-radius: 5px;
      }

      .image-list3 {
        list-style: none;
        margin-left: 600px;
      }

      .img-title3 {
        margin-top: 170px;
        margin-left: 650px;
        margin-bottom: -10px;
      }

      .image-list3 li {
        float: left;
        padding: 0;
        margin: 10px;
        overflow: hidden;
        position: relative;
      }

      .image-list3 img {
        z-index: 5;
        border-radius: 5px;
      }
    </style>
	</head>
	<body>
	  <div id="container">
	  <%@ include file="/header.jsp"%>
	    <main>
	      <div class="box">
	        <div class="main_box">
	          <div class="title">
	            <h2></h2>
	          </div>
	          <div class="prod">
	            <ul class="prod-list">
	              <li>
	                <img src="./../images/협재.jpg" height="390px" width="290px" />
	                <div class="caption">
	                  <h2>
	                    <p><i class="fa-solid fa-location-dot"></i><b> 협재 해수욕장</b></p>
	                  </h2>
	                  <h6>제주특별자치도 제주시 한림읍 협재리</h6>
	                </div>
	              </li>
	            </ul>
	            <div class="img-title">
	              <h5><b>주변 식당</b></h5>
	            </div>
	            <ul class="image-list">
	              <li>
	                <img src="./../images/식당1.png" height="120px" width="116px" />
	              </li>
	              <li>
	                <img src="./../images/식당2.png" height="120px" width="116px" />
	              </li>
	              <li>
	                <img src="./../images/식당3.png" height="120px" width="116px" />
	              </li>
	              <li>
	                <img src="./../images/식당4.png" height="120px" width="116px" />
	              </li>
	              <li>
	                <img src="./../images/식당5.png" height="120px" width="116px" />
	              </li>
	              <!-- <li>
	                <img src="./../../images/식당6.png" height="134px" width="130px" />
	              </li> -->
	            </ul>
	            <div class="img-title2">
	              <h5><b>주변 카페</b></h5>
	            </div>
	            <ul class="image-list2">
	              <li>
	                <img src="./../images/카페1.png" height="120px" width="116px" />
	              </li>
	              <li>
	                <img src="./../images/카페2.png" height="120px" width="116px" />
	              </li>
	              <li>
	                <img src="./../images/카페3.png" height="120px" width="116px" />
	              </li>
	              <li>
	                <img src="./../images/카페4.png" height="120px" width="116px" />
	              </li>
	              <li>
	                <img src="./../images/카페5.png" height="120px" width="116px" />
	              </li>
	              <!-- <li>
	                <img src="./../../images/카페6.png" height="120px" width="130px" />
	              </li> -->
	            </ul>
	            <div class="img-title3">
	              <h5><b>주변 명소</b></h5>
	            </div>
	            <ul class="image-list3">
	              <li>
	                <img src="./../images/명소1.png" height="120px" width="116px" />
	              </li>
	              <li>
	                <img src="./../images/명소2.png" height="120px" width="116px" />
	              </li>
	              <li>
	                <img src="./../images/명소3.png" height="120px" width="116px" />
	              </li>
	              <li>
	                <img src="./../images/명소4.png" height="120px" width="116px" />
	              </li>
	              <li>
	                <img src="./../images/명소5.png" height="120px" width="116px" />
	              </li>
	              <!-- <li>
	                <img src="./../../images/명소6.png" height="120px" width="130px" />
	              </li> -->
	            </ul>
	          </div>
	        </div>
	      </div>
	    </main>
	  <%@ include file="/footer.jsp"%>
	  </div>
	</body>
</html>
