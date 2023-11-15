<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- PLAN-IT Top 10 -->

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8" />
	    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" />
	    <link rel="stylesheet" href="./header.css" />
	    <link rel="stylesheet" href="./footer.css" />
	    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
	    <link href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css" rel="stylesheet" type="text/css" />
	
	    <title>Top 10 장소</title>
	    <style>
	      * {
	        font-family: 'Spoqa Han Sans Neo', 'sans-serif';
	      }
	
	      main {
	        margin-top: -120px;
	        height: 2280px;
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
	        top: 355px; 
	        width: 300px;
	        height: 200px;
	        padding-top: 13px;
	        background: rgba(0, 0, 0, 0.6); 
	        opacity: 0;
	        transition: all 0.6s ease-in-out; 
	        z-index: 10; 
	      }
	
	      .prod-list .caption {
	        opacity: 1; 
	        transform: translateY(-200px);
	      }
	
	      .prod-list .caption h2 {
	        color: #fff;
	        text-align: left;
	        font-size: 13px;
	        padding-left: 13px;
	      }
	
	      /* 라인 */
	      .line {
	        border-top: 1px solid white;
	        margin: 1px -158px;
	        padding-top: 200px;
	        padding-bottom: 150px;
	      }
	    </style>
	    
	    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    	<script src="top10.js"></script>
	</head>
	
	<body>
	  <div id="container">
	    <%@ include file="/header.jsp"%>
	
      <main>
        <ul class="prod-list">
          <div class="img-title">
            <h4><b>인기 체험명소 Top 10</b></h4>
          </div>
          <li>
            <img src="./../images/우도2.png" height="200px" width="200px" />
            <!-- 우도 -->
            <div class="caption">
              <h2>우도</h2>
              <!-- <p>상품 1 설명 텍스트</p>
            <p>가격 : 12,345원</p> -->
            </div>
          </li>
          <li>
            <img src="./../images/한라산1.png" height="200px" width="200px" />
            <!-- 한라산 국립공원 -->
            <div class="caption">
              <h2>한라산 국립공원</h2>
            </div>
          </li>
          <li>
            <img src="./../images/아쿠아플라넷1-1.png" height="200px" width="200px" />
            <!-- 아쿠아플라넷 제주 -->
            <div class="caption">
              <h2>아쿠아플라넷 제주</h2>
            </div>
          </li>
          <li>
            <img src="./../images/산굼부리1.jpg" height="200px" width="200px" />
            <!-- 산굼부리 -->
            <div class="caption">
              <h2>산굼부리</h2>
            </div>
          </li>
          <li>
            <img src="./../images/용두암.png" height="200px" width="200px" />
            <!-- 용두암 -->
            <div class="caption">
              <h2>용두암</h2>
            </div>
          </li>
          <li>
            <img src="./../images/에코랜드3.jpg" height="200px" width="200px" />
            <!-- 에코랜드 -->
            <div class="caption">
              <h2>에코랜드</h2>
            </div>
          </li>
          <li>
            <img src="./../images/성산일출봉1.jpg" height="200px" width="200px" />
            <!-- 성산 일출봉 -->
            <div class="caption">
              <h2>성산 일출봉</h2>
            </div>
          </li>
          <li>
            <img src="./../images/테디베어뮤지엄1.png" height="200px" width="200px" />
            <!-- 테디베어뮤지엄 -->
            <div class="caption">
              <h2>테디베어뮤지엄</h2>
            </div>
          </li>
          <li>
            <img src="./../images/오설록 티 뮤지엄1.png" height="200px" width="200px" />
            <!-- 오설록 티 뮤지엄 -->
            <div class="caption">
              <h2>오설록 티 뮤지엄</h2>
            </div>
          </li>
          <li>
            <img src="./../images/헬로키티아일랜드1.png" height="200px" width="200px" />
            <!-- 헬로키티 아일랜드 -->
            <div class="caption">
              <h2>헬로키티 아일랜드</h2>
            </div>
          </li>
        </ul>

        <div class="line"></div>

        <section class="bg2" id="scroll-section2">
          <ul class="prod-list">
            <div class="img-title" id="ca">
              <h4><b>인기 호텔 Top 10</b></h4>
            </div>
            <li>
              <img src="./../images/JW메리어트제주.png" height="200px" width="200px" />
              <!-- JW 메리어트 제주 리조트 앤 스파 -->
              <div class="caption">
                <h2>JW 메리어트 제주 리조트 앤 스파</h2>
              </div>
            </li>
            <li>
              <img src="./../images/핀크스포도1.png" height="200px" width="200px" />
              <!-- 포도호텔 -->
              <div class="caption">
                <h2>포도호텔</h2>
              </div>
            </li>
            <li>
              <img src="./../images/파르나스1.png" height="200px" width="200px" />
              <!-- 파르나스 호텔 제주 -->
              <div class="caption">
                <h2>파르나스 호텔 제주</h2>
              </div>
            </li>
            <li>
              <img src="./../images/엠버퓨어힐1.png" height="200px" width="200px" />
              <!-- 엠버 퓨어힐 호텔 & 리조트 -->
              <div class="caption">
                <h2>엠버 퓨어힐 호텔 & 리조트</h2>
              </div>
            </li>
            <li>
              <img src="./../images/베이힐1.png" height="200px" width="200px" />
              <!-- 베이힐풀앤빌라 -->
              <div class="caption">
                <h2>베이힐풀앤빌라</h2>
              </div>
            </li>
            <li>
              <img src="./../images/제주신라호텔1.png" height="200px" width="200px" />
              <!-- 제주신라호텔 -->
              <div class="caption">
                <h2>제주신라호텔</h2>
              </div>
            </li>
            <li>
              <img src="./../images/그랜드조선제주1.png" height="200px" width="200px" />
              <!-- 그랜드 조선 제주 -->
              <div class="caption">
                <h2>그랜드 조선 제주</h2>
              </div>
            </li>
            <li>
              <img src="./../images/토스카나1.png" height="200px" width="200px" />
              <!-- 호텔 토스카나 -->
              <div class="caption">
                <h2>호텔 토스카나</h2>
              </div>
            </li>
            <li>
              <img src="./../images/히든클리프1.png" height="200px" width="200px" />
              <!-- 히든 클리프 호텔&네이쳐 -->
              <div class="caption">
                <h2>히든 클리프 호텔&네이쳐</h2>
              </div>
            </li>
            <li>
              <img src="./../images/그라벨1.png" height="200px" width="200px" />
              <!-- 그라벨호텔제주 -->
              <div class="caption">
                <h2>그라벨호텔제주</h2>
              </div>
            </li>
          </ul>
        </section>

        <div class="line"></div>

        <section class="bg3" id="scroll-section3">
          <ul class="prod-list">
            <div class="img-title">
              <h4><b>인기 맛집 Top 10</b></h4>
            </div>
            <li>
              <img src="./../images/우진해장국1.png" height="200px" width="200px" />
              <!-- 우진해장국 -->
              <div class="caption">
                <h2>우진해장국</h2>
              </div>
            </li>
            <li>
              <img src="./../images/올래국수1.png" height="200px" width="200px" />
              <!-- 올래국수 -->
              <div class="caption">
                <h2>올래국수</h2>
              </div>
            </li>
            <li>
              <img src="./../images/미영이네.png" height="200px" width="200px" />
              <!-- 미영이네 식당 -->
              <div class="caption">
                <h2>미영이네</h2>
              </div>
            </li>
            <li>
              <img src="./../images/중문수두리보말칼국수1.png" height="200px" width="200px" />
              <!-- 중문수두리보말칼국수 -->
              <div class="caption">
                <h2>중문수두리보말칼국수</h2>
              </div>
            </li>
            <li>
              <img src="./../images/숙성도1.png" height="200px" width="200px" />
              <!-- 숙성도 -->
              <div class="caption">
                <h2>숙성도</h2>
              </div>
            </li>
            <li>
              <img src="./../images/곰막식당1.png" height="200px" width="200px" />
              <!-- 곰막 -->
              <div class="caption">
                <h2>곰막</h2>
              </div>
            </li>
            <li>
              <img src="./../images/명진전복1.png" height="200px" width="200px" />
              <!-- 명진전복 -->
              <div class="caption">
                <h2>명진전복</h2>
              </div>
            </li>
            <li>
              <img src="./../images/하하호호.png" height="200px" width="200px" />
              <!-- 하하호호 -->
              <div class="caption">
                <h2>하하호호</h2>
              </div>
            </li>
            <li>
              <img src="./../images/뽈살집1.png" height="200px" width="200px" />
              <!-- 뽈살집 -->
              <div class="caption">
                <h2>뽈살집</h2>
              </div>
            </li>
            <li>
              <img src="./../images/모살물1.png" height="200px" width="200px" />
              <!-- 모살물 -->
              <div class="caption">
                <h2>모살물</h2>
              </div>
            </li>
          </ul>
        </section>

        <div class="line"></div>

        <section class="bg4" id="scroll-section4">
          <ul class="prod-list">
            <div class="img-title">
              <h4><b>인기 카페 Top 10</b></h4>
            </div>
            <li>
              <img src="./../images/리치망고1.png" height="200px" width="200px" />
              <!-- 리치망고본점 -->
              <div class="caption">
                <h2>리치망고</h2>
              </div>
            </li>
            <li>
              <img src="./../images/앤트러사이트1.png" height="200px" width="200px" />
              <!-- 앤트러사이트 -->
              <div class="caption">
                <h2>앤트러사이트</h2>
              </div>
            </li>
            <li>
              <img src="./../images/애월더선셋.png" height="200px" width="200px" />
              <!-- 애월더선셋 -->
              <div class="caption">
                <h2>애월더선셋</h2>
              </div>
            </li>
            <li>
              <img src="./../images/델문도1.png" height="200px" width="200px" />
              <!-- 델문도 함덕 -->
              <div class="caption">
                <h2>델문도</h2>
              </div>
            </li>
            <li>
              <img src="./../images/봄날1.png" height="200px" width="200px" />
              <!-- 봄날 -->
              <div class="caption">
                <h2>봄날</h2>
              </div>
            </li>
            <li>
              <img src="./../images/테라로사1.png" height="200px" width="200px" />
              <!-- 테라로사 서귀포 -->
              <div class="caption">
                <h2>테라로사</h2>
              </div>
            </li>
            <li>
              <img src="./../images/구좌상회2.png" height="200px" width="200px" />
              <!-- 구좌상회 조천 -->
              <div class="caption">
                <h2>구좌상회</h2>
              </div>
            </li>
            <li>
              <img src="./../images/아라파파1.png" height="200px" width="200px" />
              <!-- 아라파파 -->
              <div class="caption">
                <h2>아라파파</h2>
              </div>
            </li>
            <li>
              <img src="./../images/풍림다방1.png" height="200px" width="200px" />
              <!-- 풍림다방 송당점 -->
              <div class="caption">
                <h2>풍림다방</h2>
              </div>
            </li>
            <li>
              <img src="./../images/몽상드애월1.png" height="200px" width="200px" />
              <!-- 몽상드애월 -->
              <div class="caption">
                <h2>몽상드애월</h2>
              </div>
            </li>
          </ul>
        </section>
      </main>
	    <%@ include file="/footer.jsp"%>
	  </div>
	</body>
</html>