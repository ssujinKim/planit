<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="model.PythonController"%>
<%@ page import="java.io.*"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css" rel="stylesheet" type="text/css" />

	<title>이미지 기반 추천</title>
	
	<style>
		* {
		    font-family: 'Spoqa Han Sans Neo', 'sans-serif';
		}
		
		main {
			margin-bottom: 500px;
			margin-left: -45px;
            margin-top: 30px;
		}
		
		.photo {
			margin-bottom: 12px;
			margin-top: 20px;
		}

		tr,td
		{
			margin: 10px;
			padding: 10px;
		}
	</style>
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" />
    
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
	
<body>
  <div id="container">
  <%@ include file="/header.jsp"%>
  <main>

<%
request.setCharacterEncoding("utf-8"); 
String result = (String)session.getAttribute("result");
System.out.println(result);
String[] resultArr = result.split("\n");

String filePath = request.getSession().getServletContext().getRealPath("/image/imgs"); // 파일이 존재하는 실제경로

File f = new File(filePath);
File[] files = f.listFiles(); // 파일의 리스트를 대입

int tCnt = 0;
String fileName = "";
out.println("<table style='text-align: center;'>");
out.println("<tr><td></td><td></td><td></td><td></td></tr>");
for(int i=0; i < resultArr.length; i++) {
	
	if(tCnt%4 == 0) out.println("<tr>");
		
	for(int j=0; j < files.length; j++) {
		fileName = files[j].getName();
		System.out.println(fileName + "?");
		if(fileName.contains(resultArr[i])){
			tCnt++;
			System.out.println(fileName + "!");
		  	out.println("<td><a href='./detail/"+ fileName.substring(fileName.indexOf("(")+1, fileName.indexOf(")")) 
		  	+".jsp'><img alt='사진' class='photo' src='./imgs/"+ fileName +"' width='300' height='200'/></a>");
		    out.println("<br>" + fileName.substring(0, fileName.indexOf("(")) + "</td>");
		}
		if(tCnt%4 == 0) out.println("</tr>");
	}
}
out.println("</table>");
%>

  </main>
  <%@ include file="/footer.jsp" %>
  </div>
</body>
</html>