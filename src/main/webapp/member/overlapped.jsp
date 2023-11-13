<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONObject"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 확인</title>
</head>
<body>

<% 

Connection conn = null;

String url = "jdbc:mysql://localhost:3306/planit";
String did = "root";
String pwd = "Ktnwls1218*";
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, did, pwd);


String id = request.getParameter("id");

PreparedStatement pstmt = null;
ResultSet rs = null;

String sql = "SELECT * FROM member WHERE id = '"+id+"'";
pstmt = conn.prepareStatement(sql);


rs = pstmt.executeQuery();

response.setContentType("application/json");

PrintWriter outt = response.getWriter();

JSONObject resultObj = new JSONObject();

if(rs.next())
{
	resultObj.put("result","true");
	out.print("true");
}
else
{
	resultObj.put("result","false");
	out.print("false");
}

//System.out.println(resultObj);

//outt.print(resultObj.toString());
%>

</body>
</html>