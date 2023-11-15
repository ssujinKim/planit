<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./header.css" />
    <link rel="stylesheet" href="./footer.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" />
    <link href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css" rel="stylesheet" type="text/css" />

    <title>이미지 기반 추천3</title>
    <style>
      * {
        font-family: 'Spoqa Han Sans Neo', 'sans-serif';
      }

      main {
        margin-left: -50px;
        margin-right: -50px;
        height: 630px;
        background-color: rgb(232, 232, 232);
        margin-bottom: 70px;
      }

      .main_box {
        margin-left: 30px;
        margin-right: 30px;
        background-color: white;
        height: 570px;
      }

      .box {
        padding-top: 30px;
      }

      .title {
        padding-top: 30px;

        text-align: center;
      }

      .title h2 {
        padding-top: 40px;
      }

      .prod-list {
        list-style: none;
        padding: 0;
        margin-top: 40px;
        margin-left: 80px;
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
        <div class="box">
          <div class="main_box">
            <div class="title">
              <h3><b>사진과 비슷한 장소를 찾았어요!</b></h3>
            </div>
            <ul class="prod-list">
              <li>
                <img src="./../images/김녕.jpg" height="350px" width="300px" />
                <div class="caption">
                  <h2>
                    <b>김녕 해수욕장</b>
                  </h2>
                </div>
              </li>
              <li>
                <img src="./../images/함덕.jpg" height="350px" width="300px" />
                <div class="caption">
                  <h2>
                    <b>함덕 해수욕장</b>
                  </h2>
                </div>
              </li>
              <li>
              	<a href="./image4.jsp">        
                	<img src="./../images/협재.jpg" height="350px" width="300px" />
                </a>
                <div class="caption">
                  <h2>
                    <b>협재 해수욕장</b>
                  </h2>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </main>
    <%@ include file="/footer.jsp"%>
    </div>
  </body>
</html>
