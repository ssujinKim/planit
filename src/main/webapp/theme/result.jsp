<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--  
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">

<script src="../js/bootstrap.js"></script>
<script src="../js/bootstrap.min.js"></script>
-->
<title>테마별 여행지 추천</title>

<style>
tr,td
{
	margin: 10px;
	padding: 10px;
}
</style>

</head>
<body>
	<div id="container">
    <%@ include file="/header.jsp"%>
	<%
		request.setCharacterEncoding("utf-8");
		String[] keyword = request.getParameterValues("keyword");

		if(keyword != null && keyword.length > 0){
			for(int i = 0; i < keyword.length; i++){
				out.println("#"+ keyword[i] +"  ");
			}
		}
		out.println("<br>");
	
		String filePath = request.getSession().getServletContext().getRealPath("/theme/image"); //파일이 존재하는 실제경로

		File f = new File(filePath);
		File[] files = f.listFiles(); //파일의 리스트를 대입

		int tCnt = 0;
		String fileName = "", ifContain = "";
		out.println("<table style='text-align: center;'>");
		out.println("<tr><td></td><td></td><td></td><td></td></tr>");
		for(int i=0; i < files.length; i++) {
  			if(files[i].isFile()){
  				fileName = files[i].getName();
	  			if(tCnt%4 == 0) out.println("<tr>");
	  			
	  			for(int j=0; j < keyword.length; j++) {
		  			if(fileName.contains(keyword[j])){
		  				ifContain += "0";
		  			}
	  			}
	  			
	  			if(ifContain.length() == keyword.length){
	  				tCnt++;
	  	  			out.println("<td><img alt='사진' class='' src='./image/"+ fileName +"' width='300' height='200'/>");
	  	  			out.println("<br>" + fileName.substring(fileName.indexOf('(')+1, fileName.indexOf(')')) + "</td>");
	  			}
	  			if(tCnt%4 == 0) out.println("</tr>");
	  			ifContain = "";
  			}
		}
		out.println("</table>");
	%>
	
	
	</div>
</body>
</html>