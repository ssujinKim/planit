<%@ page import = "member.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 정보 수정</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

MemberDAO dao = new MemberDAO();

String id = (String)session.getAttribute("id");
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

if(dao.update(vo)) {
%>
	<script>
	alert("정보 수정이 완료되었습니다.");
	window.location.href='<%=request.getContextPath()%>/mypage.jsp';
	</script>
<%
} else {
%>
	<script>
	alert("정보 수정에 실패하였습니다.");
	window.location.href='<%=request.getContextPath()%>/mypage.jsp';
	</script>
<%
}
%>

</body>
</html>