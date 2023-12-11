<!-- 비밀번호 찾기 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="./../css/header.css" />
    <link href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css" rel="stylesheet" type="text/css" />
    <title>ID/PW 찾기</title>
    
    <style>
      * {
        font-family: 'Spoqa Han Sans Neo', 'sans-serif';
      }

      a:link,
      a:visited {
        color: black;
        text-decoration: none;
      }

      .idpw {
        margin-top: 120px;
      }
      
      .idpw ul {
        width: 500px;
        margin: 10px auto;
        padding: 0;
        margin-top: 50px;
        text-align: center;
        margin-bottom: -20px;
      }

      .idpw li {
        display: inline-block;
        width: 200px;
        border: 1px solid #ccc;
        padding: 10px 15px;
        font-size: 16px;
      }

      .idpw p {
        width: 80%;
        padding: 10px;
        line-height: 2em;
      }

      #logo {
        padding-top: 80px;
        margin-left: 692px;
      }

      .form_wrapper {
        width: 405px;
        display: inline-block;
        text-align: center;
        height: 430px;
        margin-top: 30px;
        margin-left: 557px;
        margin-bottom: 130px;
        border: 1px solid #ccc;
        border-radius: 5px;
        /* background-color: rgb(239, 239, 239); */
      }

      .form-control {
        padding: 10px;
        width: 278px;
        margin: 3px;
        border: 1px solid lightgray;
        margin-bottom: 20px;
        margin-left: 60px;
        border-radius: 5px;
      }

      .form_title {
        margin: 3px;
        text-align: left;
        font-size: 14px;
        margin-left: 60px;
      }

      form {
        margin-top: 40px;
      }

      .button {
        padding: 10px;
        width: 300px;
        margin: 3px;
        margin-top: 30px;
        background-color: #002c7f;
        color: white;
        font-size: 18px;
      }
    </style>
  </head>
  <body>
    <div id="container">
      <header>
        <div id="logo">
          <a href="./../index.jsp"
            ><img src="./../images/로고누끼.png" alt="Plan-it" height="50px"
          /></a>
        </div>
      </header>
      <main>
        <section id="one" class="one">
          <div class="idpw">
            <ul>
              <li><a href="./findId.jsp">ID</a></li>
              <li><a href="./findPw.jsp">PW</a></li>
            </ul>
          </div>
          <div class="box">
            <div class="form_wrapper">
              <form action="./findPwCheck.jsp" class="form-signin">
                <div class = "form_box">
                  <div class = "form_title">
                    <label for="name">이름</label>
                  </div>
                  <div class = "check">
                    <input type="text" id="findname" class="form-control" name="name" pattern="[가-힣]{2,10}" placeholder="이름" title="한글 실명" required autofocus>
                  </div>
                </div>
                <div class = "form_box">
                  <div class = "form_title">
                    <label for="name">아이디</label>
                  </div>
                  <div class = "check">
                    <input type="text" id="id" name="id" class="form-control" placeholder="아이디" title="아이디" maxlength="20" required autofocus>
                  </div>
                </div>
                <div class = "form_box">
                  <div class = "form_title">
                    <label for="phone">휴대폰 번호</label>
                  </div>
                  <div class = "check">
                    <input type="tel" id="phone" name="phone" class="form-control" pattern="([0-9]{3}-[0-9]{4}-[0-9]{4})|([0][0-9]{10})" maxlength="13" placeholder="휴대폰 번호 (000-0000-0000 형식)" title="휴대폰 번호 (000-0000-0000 형식)" required>
                  </div>
                </div>
                <div class="form_button">
                  <button class="button" type="submit">비밀번호 찾기</button>
                </div>
              </form>
            </div>
          </div>
        </section>
      </main>
	  <%@ include file="/footer.jsp"%>
    </div>
  </body>
</html>
