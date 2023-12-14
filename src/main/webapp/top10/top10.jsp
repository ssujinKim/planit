<!-- Top 10 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css" rel="stylesheet" type="text/css" />
    <title>Top 10</title>

    <style>
      * {
        font-family: 'Spoqa Han Sans Neo', 'sans-serif';
      }

      main {
        padding-left: 180px;
        margin-top: 90px;
        margin-bottom: 150px;
      }

      .prod-list {
        list-style: none;
        padding: 0;
      }

      .prod-list li {
        padding: 0;
        margin: 27px;
        overflow: hidden;
        position: relative;
        display: inline-block;
      }

      .prod-list img {
        margin: 0px;
        padding: 0;
        float: left;
        z-index: 5;
        margin-bottom: 20px;
      }


      .prod-list .caption h2 {
        text-align: center;
        font-size: 20px;
      }
    </style>
  </head>
  <body>
    <div id="container">
      <%@ include file="/header.jsp"%>
      <main>
        <ul class="prod-list">
          <li>
            <a class="section1" href="./topPlace.jsp"
              ><img src="./../images/성산일출봉1.jpg" height="280px" width="230px"
            /></a>
            <div class="caption">
              <h2>
                <b>인기 체험명소 <br />Top 10</b>
              </h2>
            </div>
          </li>
          <li>
            <a class="section2" href="./topPlace.jsp#section2">
              <img src="./../images/그랜드조선제주1.png" height="280px" width="230px" />
            </a>
            <div class="caption">
              <h2>
                <b>인기 호텔 <br />Top 10</b>
              </h2>
            </div>
          </li>
          <li>
            <a class="section3" href="./topPlace.jsp#section3">
              <img src="./../images/숙성도1.png" height="280px" width="230px" />
            </a>
            <div class="caption">
              <h2>
                <b>인기 맛집 <br />Top 10</b>
              </h2>
            </div>
          </li>
          <li>
            <a class="section4" href="./topPlace.jsp#section4">
              <img src="./../images/리치망고1.png" height="280px" width="230px" />
            </a>
            <div class="caption">
              <h2>
                <b>인기 카페 <br />Top 10</b>
              </h2>
            </div>
          </li>
        </ul>
      </main>
	  <%@ include file="/footer.jsp"%>
    </div>
  </body>
</html>