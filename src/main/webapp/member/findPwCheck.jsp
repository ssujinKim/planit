<%@ page import = "member.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
</head>
<body>
<% 
request.setCharacterEncoding("utf-8");

String name = request.getParameter("name");
String id = request.getParameter("id");
String phone = request.getParameter("phone");

MemberDAO dao = new MemberDAO();

String find_pw = dao.findPw(id, name, phone);

out.print("<script>");
if (find_pw != null && !find_pw.equals("") && !find_pw.equals("null")){
	out.print("alert('회원님의 비밀번호는 "+find_pw+"입니다.');");
	out.print("location.href='"+request.getContextPath()+"/member/login.jsp';");
} else {	
	out.print("alert('입력한 정보와 일치하는 가입정보가 없습니다.');");
	out.print("location.href='"+request.getContextPath()+"/member/findPw.jsp';");
 } 
out.print("</script>");
%>
</body>
</html>