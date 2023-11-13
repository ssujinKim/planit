<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
<%
session.invalidate();
//response.sendRedirect("index.jsp");
%>
<script>
alert("로그아웃이 완료되었습니다.");
location.href="../index.jsp";
</script>
</body>
</html>