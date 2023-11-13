<%@ page import = "member.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 확인</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pw = request.getParameter("pw");

MemberDAO dao = new MemberDAO();

int ok = dao.loginCheck(id, pw);
System.out.println("ok = " + ok);

MemberVO vo = new MemberVO();

if(ok == 1){
	vo = dao.userLogin(id, pw);
	session.setAttribute("id", vo.getId());
%>
	<script>
	alert("로그인 성공")
	location.href = '<%=request.getContextPath()%>/index.jsp';
	</script>
<%
} else if(ok == 2){
	System.out.println("비밀번호 불일치");
%>
	<script>
	alert("비밀번호가 일치하지 않습니다.")
	location.href = '<%=request.getContextPath()%>/member/login.jsp';
	</script>
<%
} else if(ok == 3){
	System.out.println("아이디 불일치");
%>
	<script>
	alert("아이디가 일치하지 않습니다.")
	location.href = '<%=request.getContextPath()%>/member/login.jsp';
	</script>
<%
}
%>
</body>
</html>