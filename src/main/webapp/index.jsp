<!-- PLAN-IT 웹 홈페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
int midx = 0;

//Session을 받을때는 값이 null로 올때를 생각해서 조건문을 사용한다.
if (session.getAttribute("midx") != null) {
  //세션의 값을 가져오기
  midx = (int)session.getAttribute("midx");
}
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.min.js"></script>
  
    <title>Main Homepage</title>

    <style>

      * {
        margin: 0; /* 마진값 초기화 */
        padding: 0; /* 패딩값 초기화 */
      }

      ul {
        list-style: none;
      }

      #container {
        margin: 0px auto;  /* 화면 테두리와 제목 간격 0px */
        width: 1200px; /* width를 1200px/100% 중 뭘해야하지 ,,, */
      }
      
      header {
        width: 100%;
        height: 80px;
      }

      /* 로고 */
      #logo {
        color: #002C7F;
        float: left;
        margin-left: -50px; /* 왼쪽에서 30px 띄워라 */
        margin-top : 12px; 
      }

      /* 사용자 nav */
      #topMenu-user {
        float: right;
        margin-top: 40px;
        margin-right: -50px;
      }

      #topMenu-user li {
        float: left;
        padding-left: 30px; /*nav 간격*/
      }

      #topMenu-user a {
        text-decoration: none;
        color: #002C7F;
        font-weight: bold;
        font-size: 0.9em;
      }

      #topMenu-user a:hover {
        color: red; /* 마우스 포인터 올리면 색상 변화*/
      }

      main {
        margin-left: -50px;
        margin-right: -50px;
        margin-bottom: 100px;
      }

      /* nav */
      #topMenu-menu {
        float: left;
        margin: -35px auto;
        /* padding: -1000px; */
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
        margin: 1px -100px;
        padding-top: 50px;
      }

      footer {
        margin-left: -159px;
        margin-right: -159px;
        height: 80px;
        border-top: 1px solid lightgray;
        background-color: #f8f9fa;
        padding: 1.8em 0;
        /* margin: 3em 0; */
        margin-bottom: 0;
        text-align: center;
      }

      .footer-copyright {
        font-size: 0.9rem;
        color: #545e6f;
      }

    </style>

  </head>

  <body>
    <div id="container">
      <header>
    <!-- 홈페이지 로고 -->
        <div id="logo">
          <h1>Plan-it</h1>
        </div>
        
    <!-- 메뉴(내비게이션) 영역 -->
    <!-- 로그인 전 화면 -->
    <%if (midx == 0) {%>
        <nav>
          <ul id="topMenu-user">
            <li><a href="./login.jsp">로그인</a></li>
            <li><a href="./signUp.jsp">회원가입</a></li>
            <li><a href="./mypage.jsp">마이페이지</a></li>
            <li><a href="#">커뮤니티 채팅방</a></li>
          </ul>
          
    <!--로그인 후 화면  -->
	<%} else if (midx > 0) {%>
		  <ul id="topMenu-user">
            <li><a href="./logout.jsp">로그아웃</a></li>
            <li><a href="#">마이페이지</a></li>
            <li><a href="#">커뮤니티 채팅방</a></li>
          </ul>
        </nav>
    <%};%>
        
      </header>

      <main>

        <div class="line"></div>

        <nav>
          <ul id="topMenu-menu">
            <li><a href="#">이미지 기반 추천</a></li>
            <li><a href="#">테마별 추천</a></li>
            <li><a href="#">Top 10</a></li>
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
      <footer>
        <div class="inner">
          <div class="footer-copyright">@copyright 2023. All Rights Reserved</div>
        </div>
      </footer>
    </div>
  </body>
</html>