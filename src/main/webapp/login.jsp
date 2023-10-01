<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 로그인 페이지 -->
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>로그인</title>
    </head>
    <style>
    
      * {
        margin: 0; /* 마진값 초기화 */
        padding: 0; /* 패딩값 초기화 */
      }

      ul {
        list-style: none;
      }

      .one {
        margin: 0px auto;
        width: 1200px; 
      }

      .box {
        margin: 38px 80px;  /* 화면 테두리와 제목 간격 0px */
        padding-top: 20px; 
        padding-bottom: 40px;
        /* padding: 50px; */
        text-align: center;
        background-color: rgb(230, 229, 229);
        border-radius: 8px; /* 모서리 둥글 정도 */
      }

      /* .align-center {
        color:#002C7F;
      } */



      .form_wrapper {
        display: inline-block;
        text-align: center;
        background-color:rgb(239, 239, 239);
        margin-top: 10px; 
        height: 300px;
        /* padding: 100px; */
        padding-bottom : 250px;
        padding-left: 50px;
        padding-right: 50px;
        border: 1px solid black;
        border-radius: 8px; /* 모서리 둥글 정도 */
      }
      .form_wrapper > h1 {
        color:#002C7F;
        padding-top: 30px;
        padding-bottom: 100px;
      }

      
      /* .table {
        border: none;
      } */
      
      .form-control {
        padding: 10px;
        width: 278px;
        margin: 3px;
        border: 1px solid lightgray;
        margin-bottom: 20px;
        border-radius: 5px;
      }

      .form_title {
        margin: 3px;
        text-align: left;
        font-size: 14px;
      }

      .login_button {
        padding: 10px;
        width: 300px; /* 가로 길이 */
        margin: 3px;
        margin-top: 30px;
        background-color: #002C7F;
        color: white;
        font-size: 18px;
      }

      /* .signup_button {
        border: none;
        padding: 
      } */


      /* 로그인 메뉴 nav */
      #loginMenu {
        float: right;
        margin-top: 5px;
        margin-right: 30px;
      }

      #loginMenu li {
        float: left;
        padding-left: 15px; /*nav 간격*/
      }

      #loginMenu a {
        text-decoration: none;
        color: #002C7F;
        font-weight: bold;
        font-size: 14px;
      }

      #loginMenu a:hover {
        color: black; /* 마우스 포인터 올리면 색상 변화*/
      }

  </style>

  <script>
  function loginForm() {
    var loginForm = document.frmLogin;
    var id = document.frmLogin.id.value;
    var pw = document.frmLogin.pw.value;
    
    if(!id || !pw) {
        alert("아이디와 비밀번호를 모두 입력해주세요.")
    }
    else {
        loginForm.action="./loginCheck.jsp";
        loginForm.submit();
    }
  }
  </script>
<body>
  <section id="one" class="one">
    <div class="box">
        <!-- <header class="align-center">
          <h1>Plan-it</h1> 클릭하면 메인 홈페이지로 이동하게 하기 -->
        </header>
        <div class="form_wrapper">
          <h1>Plan-it</h1>
          <form name="frmLogin" method="post" onsubmit="return loginForm();">
            <div class = "form_box">
              <div class = "form_title">
                <label for = "id_label" class = "form_label"><b>아이디</b></label>
              </div>
              <div class = "check">
                <input type="text" id="id_label" class="form-control" placeholder="아이디를 입력해 주세요" name="id">
              </div>
            </div>
            <div class = "form_box">
              <div class = "form_title">
                <label for = "pw_label" class = "form_label"><b>비밀번호</b></label>
              </div>
              <div class = "check">
                <input type="password" id="pw_label" class="form-control" placeholder="비밀번호를 입력해 주세요" name="pw">
              </div>
            </div>

              <!-- <table>
              <tr>
                <td>아이디</td>
              <td><input type="text" class="form-control" placeholder="아이디를 입력해 주세요" name="id"></td></tr>
              <tr>
                <td>비밀번호</td>
              <td><input type="password" class="form-control" placeholder="비밀번호를 입력해 주세요" name="pw"></td></tr>
              </table> -->
              



              <div class="form_login_button"> <!-- 로그인 버튼 -->
                <button type="submit" class="login_button">로그인</button>
              </div>

              <!-- <div class="form_signup_button"> 
                <button type="button" class="signup_button" onClick="location.href='signUp.jsp'">회원가입</button>
              </div>
              <div class="form_signup_button">
                <button type="button" class="signup_button" onClick="location.href='signUp.jsp'">아이디 찾기</button>
              </div>
              <div class="form_signup_button"> 
                <button type="button" class="signup_button" onClick="location.href='signUp.jsp'">비밀번호 찾기</button>
              </div> -->

              <nav>
                <ul id="loginMenu">
                  <li><a href="#" class="signup_button" onClick="location.href='signUp.jsp'">회원가입</a></li>
                  <li><a href="#" class="signup_button" onClick="location.href='findId.jsp'">아이디 찾기</a></li>
                  <li><a href="#" class="signup_button" onClick="location.href='findPw.jsp'">비밀번호 찾기</a></li>
                </ul>
              </nav>
          </form>   
        </div>
    </div>
  </section>
</body>
</html>