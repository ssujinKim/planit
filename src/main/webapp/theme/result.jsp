<!-- css 추가 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
	<head>
	
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css" rel="stylesheet" type="text/css" />
	
	<!--  
	<link rel="stylesheet" href="../css/bootstrap.css">
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	
	<script src="../js/bootstrap.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	-->
	<title>테마별 여행지 추천</title>
	
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
				String[] keyword = request.getParameterValues("keyword");
		
				if(keyword != null && keyword.length > 0){
					for(int i = 0; i < keyword.length; i++){
						out.print("<input type='checkbox' class='btn-check' id='btn-check2' name='keyword' autocomplete='off' disabled/>");
			            out.print("<label class='btn btn-outline-dark' for='btn-check2' onclick='getCheckboxValue()'>" + "#"+ keyword[i] + "</label>");
			           	out.print("&nbsp");
			           	out.print("&nbsp");
			           	out.print("&nbsp");
						// out.println("#"+ keyword[i] +"  ");
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
			  	  			out.println("<td><img alt='사진' class='photo' src='./image/"+ fileName +"' width='300' height='200'/>");
			  	  			out.println("<br>" + fileName.substring(fileName.indexOf('(')+1, fileName.indexOf(')')) + "</td>");
			  			}
			  			if(tCnt%4 == 0) out.println("</tr>");
			  			ifContain = "";
		  			}
				}
				out.println("</table>");
			%>
		</main>
		
		      <!-- 푸터 추가 -->
      	<%@ include file="/footer.jsp" %>
		</div>
	</body>
</html>