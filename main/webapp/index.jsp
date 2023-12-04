<!-- PLAN-IT 웹 홈페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/mainTheme.css" />
    <link rel="stylesheet" href="./css/mainTop10.css" />
    <link href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.min.js"></script>
  
    <title>Plan-it</title>
	<style>
		* {
		     font-family: 'Spoqa Han Sans Neo', 'sans-serif';
		}
      
		main {
		  margin-left: -50px;
		  margin-right: -50px;
		  margin-bottom: 100px;
		}
		
		#topMenu-menu {
		  float: left;
		  margin: -35px auto;
		  margin-left: -63px;
		}
	
		#topMenu-menu li {
		  float: left;
		  padding-left: 30px;
		}
		
		#topMenu-menu a {
		  text-decoration: none;
		  color: #002c7f;
		  font-weight: bold;
		  font-size: 1em;
		}
		
		#topMenu-menu a:hover {
		  color: orange;
		}
		
		.line {
		  border-top: 1px solid lightgray;
		  margin: 1px -109px;
		  padding-top: 50px;
		}
		
		.carousel-inner .carousel-caption {
		  top: 20px;
		  right: -650px;
		}
		
		.carousel-inner .carousel-caption h3 {
		  font-size: 30px;
		  font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
		}
		
		.carousel-inner .carousel-caption p {
		  font-size: 18px;
		  padding-right: 10px;
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
          <li><a href="./image/image1.jsp">이미지 기반 추천</a></li>
          <li><a href="./theme/theme.jsp">테마별 추천</a></li>
          <li><a href="./top10/top10.jsp">Top 10</a></li>
          <li><a href="#">인기 검색 순위</a></li>
          <li><a href="#">사용방법</a></li>
        </ul>
      </nav>
        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
          <div class="carousel-indicators">
            <button
              type="button"
              data-bs-target="#carouselExampleIndicators"
              data-bs-slide-to="0"
              class="active"
              aria-current="true"
              aria-label="Slide 1"
            ></button>
            <button
              type="button"
              data-bs-target="#carouselExampleIndicators"
              data-bs-slide-to="1"
              aria-label="Slide 2"
            ></button>
            <button
              type="button"
              data-bs-target="#carouselExampleIndicators"
              data-bs-slide-to="2"
              aria-label="Slide 3"
            ></button>
          </div>
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img src="./images/제주도 행사_981억새바당.png" class="d-block w-100" height="550px" alt="..." />
              <div class="carousel-caption">
                <h3>9.81파크 &lt981 억새 바당&gt</h3>
                <p>2023.10.04 ~ 2023.11.30</p>
              </div>
            </div>
            <div class="carousel-item">
              <img src="./images/제주도 행사_마노르블랑.png" class="d-block w-100" height="550px" alt="..." />
              <div class="carousel-caption">
                <h3>&lt마노르블랑 핑크뮬리축제&gt</h3>
                <p>2023.09.15 ~ 2023.11.30</p>
              </div>
            </div>
            <div class="carousel-item">
              <img src="./images/제주도 행사_휴애리동백축제.png" class="d-block w-100" height="550px" alt="..." />
              <div class="carousel-caption">
                <h3>&lt휴애리 동백 축제&gt</h3>
                <p>2023.11.14 ~ 2024.01.31</p>
              </div>
            </div>
          </div>
          <button
            class="carousel-control-prev"
            type="button"
            data-bs-target="#carouselExampleIndicators"
            data-bs-slide="prev"
          >
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button
            class="carousel-control-next"
            type="button"
            data-bs-target="#carouselExampleIndicators"
            data-bs-slide="next"
          >
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>

        <!-- Top 10 -->
        <br />
        <br />
        <br />
        <h2>인기 장소</h2>
        <div class="top10">
          <div class="tabs">
            <div class="tab">
              <input type="radio" name="css-tabs" id="tab-1" checked class="tab-switch" />
              <label for="tab-1" class="tab-label">명소</label>
              <div class="tab-content">
                <ul class="prod-list">
                  <li>
                    <img src="./images/우도2.png" height="310px" width="230px" />
                    <!-- 우도 -->
                    <div class="caption">
                      <h2><b>우도</b></h2>
                    </div>
                  </li>
                  <li>
                    <img src="./images/한라산1.png" height="310px" width="230px" />
                    <!-- 한라산 국립공원 -->
                    <div class="caption">
                      <h2><b>한라산 국립공원</b></h2>
                    </div>
                  </li>
                  <li>
                    <img src="./images/아쿠아플라넷1-1.png" height="310px" width="230px" />
                    <!-- 아쿠아플라넷 -->
                    <div class="caption">
                      <h2><b>아쿠아플라넷</b></h2>
                    </div>
                  </li>
                  <li>
                    <img src="./images/산굼부리1.jpg" height="310px" width="230px" />
                    <!-- 산굼부리 -->
                    <div class="caption">
                      <h2><b>산굼부리</b></h2>
                    </div>
                  </li>
                  <li>
                    <img src="./images/용머리해안1.jpg" height="310px" width="230px" />
                    <!-- 더 알아보기 -->
                    <div class="form_button">
                      <a href="./A01Top10.html">
                        <button type="submit" class="select_button">더 알아보기</button>
                      </a>
                    </div>
                  </li>
                </ul>
              </div>
            </div>
            <div class="tab">
              <input type="radio" name="css-tabs" id="tab-2" class="tab-switch" />
              <label for="tab-2" class="tab-label">호텔</label>
              <div class="tab-content">
                <ul class="prod-list">
                  <li>
                    <img src="./images/JW메리어트제주.png" height="310px" width="230px" />
                    <!-- JW 메리어트 제주 리조트 앤 스파 -->
                    <div class="caption">
                      <h2>
                        <b>JW 메리어트 제주 <br />리조트 앤 스파</b>
                      </h2>                    
                    </div>
                  </li>
                  <li>
                    <img src="./images/핀크스포도1.png" height="310px" width="230px" />
                    <!-- 포도호텔 -->
                    <div class="caption">
                      <h2><b>포도호텔</b></h2>
                    </div>
                  </li>
                  <li>
                    <img src="./images/파르나스1.png" height="310px" width="230px" />
                    <!-- 파르나스 호텔 제주 -->
                    <div class="caption">
                      <h2><b>파르나스 호텔 제주</b></h2>
                    </div>
                  </li>
                  <li>
                    <img src="./images/엠버퓨어힐1.png" height="310px" width="230px" />
                    <!-- 엠버 퓨어힐 호텔 & 리조트 -->
                    <div class="caption">
                      <h2><b>엠버 퓨어힐 호텔</b></h2>
                    </div>
                  </li>
                  <li>
                    <img src="./images/그랜드조선제주1.png" height="310px" width="230px" />
                    <!-- 더 알아보기 -->
                    <div class="form_button">
                      <a href="./A01Top10.html">
                        <button type="submit" class="select_button">더 알아보기</button>
                      </a>
                    </div>
                  </li>
                </ul>
              </div>
            </div>
            <div class="tab">
              <input type="radio" name="css-tabs" id="tab-3" class="tab-switch" />
              <label for="tab-3" class="tab-label">맛집</label>
              <div class="tab-content">
                <ul class="prod-list">
                  <li>
                    <img src="./images/우진해장국1.png" height="310px" width="230px" />
                    <!-- 우진해장국 -->
                    <div class="caption">
                      <h2><b>우진해장국</b></h2>
                    </div>
                  </li>
                  <li>
                    <img src="./images/올래국수1.png" height="310px" width="230px" />
                    <!-- 올래국수 -->
                    <div class="caption">
                      <h2><b>올래국수</b></h2>
                    </div>
                  </li>
                  <li>
                    <img src="./images/미영이네.png" height="310px" width="230px" />
                    <!-- 미영이네 식당 -->
                    <div class="caption">
                      <h2><b>미영이네</b></h2>
                    </div>
                  </li>
                  <li>
                    <img src="./images/숙성도1.png" height="310px" width="230px" />
                    <!-- 숙성도 -->
                    <div class="caption">
                      <h2><b>숙성도</b></h2>
                    </div>
                  </li>
                  <li>
                    <img src="./images/곰막식당1.png" height="310px" width="230px" />
                    <!-- 더 알아보기 -->
                    <div class="form_button">
                      <a href="./A01Top10.html">
                        <button type="submit" class="select_button">더 알아보기</button>
                      </a>
                    </div>
                  </li>
                </ul>
              </div>
            </div>
            <div class="tab">
              <input type="radio" name="css-tabs" id="tab-4" class="tab-switch" />
              <label for="tab-4" class="tab-label">카페</label>
              <div class="tab-content">
                <ul class="prod-list">
                  <li>
                    <img src="./images/리치망고1.png" height="310px" width="230px" />
                    <!-- 리치망고 -->
                    <div class="caption">
                      <h2><b>리치망고</b></h2>
                    </div>
                  </li>
                  <li>
                    <img src="./images/앤트러사이트1.png" height="310px" width="230px" />
                    <!-- 앤트러사이트 -->
                    <div class="caption">
                      <h2><b>앤트러사이트</b></h2>
                    </div>
                  </li>
                  <li>
                    <img src="./images/애월더선셋.png" height="310px" width="230px" />
                    <!-- 애월더선셋 -->
                    <div class="caption">
                      <h2><b>애월더선셋</b></h2>
                    </div>
                  </li>
                  <li>
                    <img src="./images/델문도1.png" height="310px" width="230px" />
                    <!-- 델문도 -->
                    <div class="caption">
                      <h2><b>델문도</b></h2>
                    </div>
                  </li>
                  <li>
                    <img src="./images/아라파파1.png" height="310px" width="230px" />
                    <!-- 더 알아보기 -->
                    <div class="form_button">
                      <a href="./A01Top10.html">
                        <button type="submit" class="select_button">더 알아보기</button>
                      </a>
                    </div>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>

        <!-- 테마별 -->
        <div class="theme">
          <br />
          <h2>테마별 장소</h2>
          <br />
          <h4>#연인 #분위기</h4>
          <ul class="theme-list">
            <li>
              <img src="./images/테디베어뮤지엄1.png" height="280px" width="230px" />
            </li>
            <li>
              <img src="./images/김녕.jpg" height="280px" width="230px" />
            </li>
            <li>
              <img src="./images/에코랜드2.png" height="280px" width="230px" />
            </li>
            <li>
              <img src="./images/한림공원1.png" height="280px" width="230px" />
            </li>
            <li>
              <img src="./images/협재해수욕장1.png" height="280px" width="230px" />
            </li>
          </ul>

          <h4>#자연 #가족</h4>
          <ul class="theme-list">
            <li>
              <img src="./images/섭지코지1.png" height="280px" width="230px" />
              <!-- 섭지코지 -->
            </li>
            <li>
              <img src="./images/협재해수욕장1.png" height="280px" width="230px" />
              <!-- 협재 해수욕장 -->
            </li>
            <li>
              <img src="./images/함덕해수욕장1.png" height="280px" width="230px" />
              <!-- 함덕 해수욕장 -->
            </li>
            <li>
              <img src="./images/에코랜드3.jpg" height="280px" width="230px" />
              <!-- 에코랜드 -->
            </li>
            <li>
              <img src="./images/한림공원3.jpg" height="280px" width="230px" />
              <!-- 한림공원 -->
            </li>
          </ul>
        </div>
      </main>
      <%@ include file="/footer.jsp"%>
    </div>
  </body>
</html>