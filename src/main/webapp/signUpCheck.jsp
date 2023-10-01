<%@ page import = "member.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 확인</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

MemberDAO dao = new MemberDAO();

String id = request.getParameter("h_id");
String pw = request.getParameter("pw");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String birth = request.getParameter("birth");
String phone = request.getParameter("phone");
String email = request.getParameter("email");

MemberVO vo = new MemberVO();

vo.setId(id); vo.setPw(pw);
vo.setName(name); vo.setGender(gender);
vo.setBirth(birth);
vo.setPhone(phone);
vo.setEmail(email);

if(dao.addMember(vo)){

%>
	<script>
	alert("회원가입이 완료되었습니다.");
	window.location.href='./index.jsp';
	</script>
<%
} else {
%>
	<script>
	alert("회원가입을 완료하지 못했습니다.");
	window.location.href='./signUp.jsp';
	</script>
<%
}
%>
</body>
</html>