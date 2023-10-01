<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import = "member.*" %>
<%@ page import = "java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Plan-it | 마이페이지</title>
</head>

<body>
	<section id="one" class="one">
		<div class="box">
			<header class="align-center">
				<h2>마이페이지</h2>
			</header>
			<br><br>

	<%
	request.setCharacterEncoding("utf-8"); 
	String id = (String)session.getAttribute("id");
	
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
					
	<script>
	function validateForm() {
		console.log('확인');
	    var phone = document.infoform.phone.value;
	    var email = document.infoform.email.value;
	    
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
		session.setAttribute("pw", pw);
		%>
		window.open("./changePw.jsp", "name(about:blank)", "width=500, height=500");
	}
	</script>				
					
	<!-- form 시작 -->
	<form name="infoForm" method="post" onSubmit="return validateForm();" action="./infoUpdate.jsp">
		<div class="form_wrapper">
			<div class="form_row">
				<label for="id">아이디</label>
				<input type="text" id="id" name="id" value="<%=id%>" readonly>
			</div>
			<div class="form_row">
				<label for="pw">비밀번호</label>
				<input type="password" name="pw" value="<%=pw%>" readonly>
				<span class="button" onclick="change_pw()">비밀번호 변경</span>		
			</div>
			<div class="form_row">
				<label for="name">이름</label> 
				<input type="text" id="name" name=name value="<%=name%>" readonly>
			</div>
			<div class="form_row">
				<label for="birth">생년월일</label>
				<input type="text" id="birth" name=birth value="<%=birth%>" readonly>
			</div>
			<div class="form_row">
				<label for="gender">성별</label>
				<input type="text" id="gender" name=gender value="<%=gender%>" readonly>
			</div>
			<div class="form_row">
				<label for="phone">휴대폰 번호</label>
				<input type="tel" id="phone" name="phone" pattern="([0-9]{3}-[0-9]{4}-[0-9]{4})" maxlength=13 value="<%=phone%>">
			</div>
			<div class="form_row">
				<label for="email">이메일</label>
				<input type="email" id="email" name="email" value="<%=email%>">
			</div>
		</div>
			<div class="form_button">
			<input class="button special" type="submit" value=수정하기 />
			</div>
	</form>

	<!-- form 끝 -->

		</div>
	</section>
<%	} %>


</body>
</html>
