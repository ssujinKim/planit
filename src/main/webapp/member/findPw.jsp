<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css">
  <title>비밀번호 찾기</title>

   <style>
      .box { /* 큰 박스 */
      margin: 38px 80px;  /* 화면 테두리와 제목 간격 0px */
      padding-top: 100px; 
      padding-bottom: 40px;
      margin-left: -159px;
      margin-right: -159px;
      /* padding: 50px; */
      text-align: center;
      background-color: rgb(230, 229, 229);
      }

      .form_wrapper { /* 작은 박스 */
         display: inline-block;
         text-align: center;
         background-color:rgb(239, 239, 239);
         margin-top: -50px; 
         height: 600px;
         /* padding: 100px; */
         padding-bottom : 250px;
         padding-left: 50px;
         padding-right: 50px;
         border: 1px solid black;
         border-radius: 8px; /* 모서리 둥글 정도 */
      }

      .form_wrapper > h3 {
         color:#002C7F;
         padding-top: 30px;
         padding-bottom: 80px;
      }

      .form-control { /* 로그인 비밀번호 상자*/
         padding: 10px;
         width: 278px;
         margin: 3px;
         border: 1px solid lightgray;
         margin-bottom: 30px;
         border-radius: 5px;
      }

      .form_title {
         margin: 3px;
         text-align: left;
         font-size: 14px;
         margin-left: 0px;
      }

      .button {
         padding: 10px;
         width: 300px; /* 가로 길이 */
         margin: 3px;
         margin-top: 30px;
         background-color: #002C7F;
         color: white;
         font-size: 18px;
      }
   </style>
</head>

<body>
   <div id="container">
      <%@ include file="/header.jsp"%>
      
      <main>
         <section id="one" class="one">
            <div class="box">
               <div class="form_wrapper">
                  <h3><b>비밀번호 찾기</b></h3>
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
                           <label for="phone">핸드폰 번호</label>
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