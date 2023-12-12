<!-- 이미지 추천 페이지 2 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" />
    <link href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css" rel="stylesheet" type="text/css" />
    <title>이미지 기반 추천2</title>
    
    <style>
      * {
        font-family: 'Spoqa Han Sans Neo', 'sans-serif';
      }
      
      main {
        height: 860px;
        background-color: rgb(232, 232, 232);
        margin-bottom: 70px;
      }

      .main_box {
        margin-left: 30px;
        margin-right: 30px;
        background-color: white;
        height: 800px;
      }

      .box {
        padding-top: 30px;
      }

      .title {
        padding-top: 30px;
        text-align: center;
      }

      .upload {
        margin-left: 440px;
        margin-top: 20px;
        border: 1px solid rgb(161, 161, 161);
        border-radius: 5px;
        width: 600px;
        height: 620px;
      }

      .drag {
        text-align: center;
        padding-top: 35px;
      }

      /*
      .form_button {
        padding-left: 235px;
      }
      */

      .select_button {
        padding: 3px;
        width: 100px;
        margin: 3px;
        margin-top: 10px;
        margin-bottom: 30px;
        background-color: rgb(227, 227, 227);
        border: 1px solid black;
        font-size: 15px;
        border-radius: 3px;
      }

      .prod-list {
        margin-left: 130px;
        margin-top: 0px;
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
        margin-top: 20px;
        margin-bottom: 10px;
        float: left;
        z-index: 5;
      }

      .list_button {
        margin-left: 100px;
        display: inline-block;
      }

      .reset {
        margin-left: -80px;
        height: 0px;
      }

      .complete {
        padding-left: 80px;
      }

      .reset_button {
        padding: 10px;
        width: 140px;
        margin: 3px;
        margin-top: 0px;
        margin-bottom: 0px;
        background-color: #002c7f;
        color: white;
        font-size: 15px;
        border-radius: 4px;
        border: 1px solid gray;
      }

      .complete_button {
        padding: 10px;
        width: 140px;
        margin: 3px;
        margin-top: 0px;
        margin-bottom: 0px;
        background-color: #002c7f;
        color: white;
        font-size: 15px;
        border-radius: 4px;
        border: 1px solid gray;
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
              <h3><b>이미지 업로드</b></h3>
            </div>

            <div class="upload">
              <div class="drag">
                <h5>드래그 & 드롭 또는 클릭하여 사진을 선택해주세요</h5>
              </div>

              <!-- <div class="form_button">
                <button type="submit" class="select_button">파일 선택</button>
              </div> -->
              <ul class="prod-list">
                <li>
                  <img src="./../images/이미지찾기.png" height="400px" width="330px" />
                </li>

                <div class="list_button">
                  <div class="reset">
                    <button type="submit" class="reset_button"><b>초기화</b></button>
                  </div>

                  <div class="complete">
                    <a href="./../image/image3.jsp">
                    <button type="submit" class="complete_button"><b>선택 완료</b></button>
                  </div>
                </div>
              </ul>
            </div>
          </div>
        </div>
      </main>
	  <%@ include file="/footer.jsp"%>
    </div>
  </body>
</html>

