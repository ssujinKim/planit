<!-- 마이 페이지 -->
<!-- [front, 2023.12.06] 수정을 안 했네 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import = "member.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
	   <meta charset="UTF-8">
	   <meta name="viewport" content="width=device-width, initial-scale=1.0">
	   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css">
	   <link href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css" rel="stylesheet" type="text/css" />

	   <title>마이페이지</title>
	
	   <style>
	      * {
	         font-family: 'Spoqa Han Sans Neo', 'sans-serif';
	      }
	
	      .box { /* 큰 박스 */
	      margin: 38px 80px; 
	      padding-top: 20px; 
	      padding-bottom: 20px;
	      margin-left: -159px;
	      margin-right: -159px;
	      text-align: center;
	      background-color: rgb(230, 229, 229);
	      }
	
	      .form_wrapper { /* 작은 박스 */
	      display: inline-block;
	      text-align: center;
	      background-color:rgb(239, 239, 239);
	      height: 990px;
	      padding-bottom : 120px;
	      padding-left: 100px;
	      padding-right: 100px;
	      border: 1px solid black;
	      border-radius: 8px; 
	      }
	
	      .form_wrapper > h2 {
	      color:#002C7F;
	      padding-top: 30px;
	      padding-bottom: 40px;
	      }
	
	      /* 로고 */
	      #logo {
	      color: #002C7F;
	      float: left;
	      margin-left: -50px; 
	      margin-top : 12px; 
	      }
	
	      #topMenu-user a:hover {
	      color: red; 
	      }
	
	      .button_special {
	      padding: 10px;
	      width: 300px; 
	      margin: 3px;
	      margin-top: 30px;
	      background-color: #002C7F;
	      color: white;
	      font-size: 18px;
	      }
	
	      .form-control { /* 로그인 비밀번호 상자*/
	      padding: 12px;
	      width: 300px;
	      border: 1px solid lightgray;
	      margin-bottom: 30px;
	      border-radius: 5px;
	      }
	
	      .form_title {
	        margin: 3px;
	        text-align: left;
	        font-size: 14px;
	      }
	
	   </style>
	   
	   <script>
	   function validateForm() {
	      console.log('확인');
	       var phone = document.infoForm.phone.value;
	       var email = document.infoForm.email.value;
	       
	       if(phone=="") {
	          alert("휴대폰 번호를 입력해주세요.");
	         return false;
	      }
	
	      if(email=="") {
	         alert("이메일을 입력해주세요.");
	         return false;
	      }
	   }
	   
	   function change_pw() {
	      <%
	      //session.setAttribute("pw", pw);
	      %>
	      window.open("./changePw.jsp", "name(about:blank)", "width=500, height=500");
	   }
	   </script>
	</head>
	
	<body>         
	   <div id="container">
	      <%@ include file="/header.jsp"%>
	
	      <main>
	         <section id="one" class="one">
	            <div class="box">
	            <%
	   			request.setCharacterEncoding("utf-8"); 
				id = (String)session.getAttribute("id");
	   
	   			MemberDAO dao = new MemberDAO();
	   			List<MemberVO> list = dao.memInfo(id);
	
	   			for(int i=0; i<list.size(); i++) {
	   				MemberVO listvo = (MemberVO) list.get(i);
	   
	      			id = listvo.getId();
	      			String pw = listvo.getPw();
	      			String name = listvo.getName();
	      			String gender = listvo.getGender();
	      			String birth = listvo.getBirth();
	      			String phone = listvo.getPhone();
	      			String email = listvo.getEmail();
				%>
	            <!-- form 시작 -->
	            <form name="infoForm" method="post" onSubmit="return validateForm();" action="./infoUpdate.jsp">
	            <div class="form_wrapper">
	               <h2><b>마이페이지</b></h2>
	               <div class = "form_box">
	                  <div class = "form_title">
	                     <label for="id"><b>아이디</b></label>
	                  </div>
	                  <div class = "check">
	                     <input type="text" id="id" class="form-control" name="id" value="<%=id %>" readonly>
	                  </div>
	                </div>
	               <div class = "form_box">
	                  <div class = "form_title">
	                     <label for="pw"><b>비밀번호</b></label>
	                  </div>
	                  <div class = "check">
	                     <input type="password" class="form-control" name="pw" value="<%=pw %>" readonly>
	                  </div>
	                </div>
	               <div class = "form_box">
	                  <div class = "form_title">
	                     <label for="name"><b>이름</b></label> 
	                  </div>
	                  <div class = "check">
	                     <input type="text" id="name" class="form-control" name=name value="<%=name %>" readonly>
	                  </div>
	                </div>
	               <div class = "form_box">
	                  <div class = "form_title">
	                     <label for="birth"><b>생년월일</b></label>
	                  </div>
	                  <div class = "check">
	                     <input type="text" id="birth" class="form-control" name=birth value="<%=birth %>" readonly>
	                  </div>
	                </div>
	               <div class = "form_box">
	                  <div class = "form_title">
	                     <label for="gender"><b>성별</b></label>
	                  </div>
	                  <div class = "check">
	                     <input type="text" id="gender" class="form-control" name=gender value="<%=gender %>" readonly>
	                  </div>
	                </div>
	               <div class = "form_box">
	                  <div class = "form_title">
	                     <label for="phone"><b>휴대폰 번호</b></label>
	                  </div>
	                  <div class = "check">
	                     <input type="tel" id="phone" class="form-control" name="phone" value="<%=phone %>"
	                     placeholder="010-xxxx-xxxx 형식" pattern="([0-9]{3}-[0-9]{4}-[0-9]{4})" maxlength=13>               
	                  </div>
	               </div>
	               <div class = "form_box">
	                  <div class = "form_title">
	                     <label for="email"><b>이메일</b></label>
	                  </div>
	                  <div class = "check">
	                     <input type="email" id="email" class="form-control" name="email" value="<%=email %>"
	                     placeholder="xxx@xxxxx.xxx 형식">
	                  </div>
	                </div>
	               <div class="form_button">
	                  <input class="button_special" type="submit" value=수정하기 />
	               </div>
	            </div>
	            </form>
	            <!-- form 끝 -->
	            </div>
	         </section>
	      </main>
	      <%@ include file="/footer.jsp"%>
	   </div>
	<%
		}
	%>
	</body>
</html>