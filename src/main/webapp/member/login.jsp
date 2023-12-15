<!-- 로그인 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="./../css/header.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css"> 
	<link href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css" rel="stylesheet" type="text/css" />
	
	<title>로그인</title>
	  
  <style>
    * {
      font-family: 'Spoqa Han Sans Neo', 'sans-serif';
    }
    
    .one {
      margin: 0px auto;
      width: 1200px; 
    }

    .box { 
      padding-top: 90px; 
      padding-bottom: 40px;
      text-align: center;
      /* background-color: rgb(230, 229, 229); */
      }

    .form_wrapper {
      width: 400px;
      display: inline-block;
      height: 530px;
      padding-bottom : 250px;
      border: 1px solid #ccc;
      border-radius: 8px;
      /* background-color:rgb(239, 239, 239); */
    }

    .form_wrapper #logo {
      padding-top: 30px;
      padding-left: 160px;
    }
    
    .form-control { /* 로그인 비밀번호 상자*/
      padding: 10px;
      width: 298px;
      margin: 3px;
      border: 1px solid lightgray;
      margin-bottom: 20px;
      margin-left: 50px;
      border-radius: 5px;
    }

    .form_title {
      margin: 3px;
      text-align: left;
      font-size: 14px;
      margin-left: 50px;
    }

    form {
      margin-top: 150px;
    }

    .login_button {
      padding: 10px;
      width: 300px;
      margin: 3px;
      margin-top: 30px;
      background-color: #002C7F;
      color: white;
      font-size: 18px;
      border-radius: 5px;
    }

    /* 로그인 메뉴 nav */
    .loginMenu .signup_button {
      margin-left: 25px;
      margin-right: 105px;
    }

    .loginMenu li {
      float: left;
    }

    .loginMenu a {
      text-decoration: none;
      color: #002C7F;
      font-weight: bold;
      font-size: 14px;
    }

    .loginMenu a:hover {
      color: black; 
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
  </head>
  <body>
    <div id="container">
	  <main>
	    <section id="one" class="one">
	      <div class="box">
	        <div class="form_wrapper">
              <div id="logo">
                <a href="./../index.jsp"><img src="./../images/로고누끼.png" alt="Plan-it" height="50px" /></a>
              </div>
	          <form name="frmLogin" method="post" onsubmit="return loginForm();">
	            <div class = "form_box">
	              <div class = "form_title">
	                <label for = "id_label" class = "form_label"><b>아이디</b></label>
	              </div>
	              <div class = "check">
                    <input type="text" id="id_label" class="form-control" placeholder="아이디를 입력해 주세요." name="id">
                  </div>
                </div>    
                <div class = "form_box">
                  <div class = "form_title">
                    <label for = "pw_label" class = "form_label"><b>비밀번호</b></label>
                  </div>
                  <div class = "check">
                    <input type="password" id="pw_label" class="form-control" placeholder="비밀번호를 입력해 주세요." name="pw">
                  </div>
                </div>    
                <div class="form_login_button"> <!-- 로그인 버튼 -->
                  <button type="submit" class="login_button">로그인</button>
                </div> 
                <div class="loginMenu">
                  <ul>
                    <li><a href="./signUp.jsp" class="signup_button" onClick="location.href='signUp.jsp'">회원가입</a></li>
                    <li><a href="./findId.jsp" class="find_button" onClick="location.href='signUp.jsp'">아이디/비밀번호 찾기</a></li>
                  </ul>
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