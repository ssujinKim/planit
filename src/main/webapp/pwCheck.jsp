<%@ page import = "member.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경 확인</title>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");

MemberDAO dao = new MemberDAO();

String id = (String)session.getAttribute("id");
String pw = request.getParameter("new_pw");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String birth = request.getParameter("birth");
String phone = request.getParameter("phone");
String email = request.getParameter("email");

MemberVO vo = new MemberVO();

vo.setId(id);
vo.setPw(pw);
vo.setName(name);
vo.setGender(gender);
vo.setBirth(birth);
vo.setPhone(phone);
vo.setEmail(email);

if(dao.updatePw(vo)) {
%>
	<script>
	alert("비밀번호 변경이 완료되었습니다.");
	window.opener.location.reload();
	window.close();
	</script>
<%
} else {
%>
	<script>
	alert("비밀번호 변경에 실패하였습니다.");
	window.opener.location.reload();
	window.close();
	</script>
<%
}
%>

</body>
</html>