<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="model.PythonController2"%>
<%@ page import="java.io.*"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css" rel="stylesheet" type="text/css" />

	<title></title>
	
	<style>
		* {
		    font-family: 'Spoqa Han Sans Neo', 'sans-serif';
		}
		
		main {
			margin-bottom: 500px;
			margin-left: -45px;
            margin-top: 30px;
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
PythonController2 py = new PythonController2();

System.out.println("실행 중");

String result = py.runPythonScript();
session.setAttribute("result", result);

System.out.println("실행 종료");

if(result.contains("다른 사진")) {
%>
	<script>
	alert("다른 사진을 업로드 해주세요!");
	window.location.href='./upload2.jsp';
	</script>
<%
} else if(result.length() > 0) {
%>
	<script>
	alert("여행지 추천이 완료되었습니다.");
	window.location.href='./upload_result2.jsp';
	</script>
<%
} else {
%>
	<script>
	alert("여행지 추천 실패");
	window.location.href='./upload2.jsp';
	</script>
<%
}
%>

  </main>
  <%@ include file="/footer.jsp" %>
  </div>
</body>
</html>