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

String category = result.substring(result.indexOf(":")+2, result.indexOf("l")).trim();
String loc = result.substring(result.indexOf("l")+2, result.indexOf("c"));
String col = result.substring(result.indexOf("c")+2, result.length()-1);
String[] locArr = loc.split("\n");
String[] colArr = col.split("\n");

// 문자열 분류 잘 됐는지 확인
System.out.println("확인!!");
System.out.println(category);
for(int l=0; l<locArr.length; l++)
	System.out.println(locArr[l]);
for(int c=0; c<colArr.length; c++)
	System.out.println(colArr[c]);
System.out.println("끝!!");

String filePath = request.getSession().getServletContext().getRealPath("/image/imgs/추천이미지"); // 파일이 존재하는 실제경로

File f = new File(filePath);
File[] files = f.listFiles(); // 파일의 리스트를 대입

int i, j, j2 = 0, tCnt = 0, k;
String fileName = "", color = "", finPath = "", fp = "";
File f2;

out.println("<table style='text-align: center;'>");
out.println("<tr><td></td><td></td><td></td><td></td></tr>");

for(i=0; i < locArr.length; i++) {
	
	if(tCnt%4 == 0) out.println("<tr>");
	
	for(j=j2+1; j < files.length; j++) {
		fileName = files[j].getName();
		if(fileName.contains(locArr[i])){
			tCnt++;
			
			for(k=0; k < colArr.length; k++) {
				color = colArr[k];
				fp = filePath + "/" + locArr[i] + "/" + category + "/" + color + ".jpg";
				f2 = new File(fp);
				if(f2.exists()) break;
				else if(k == colArr.length-1) color = "";
				else continue;
			}
			
			finPath = "./imgs/추천이미지/"+ locArr[i] + "/" + category + "/" + color + ".jpg";
			
			if(color.equals("")) {
				File f3 = new File(filePath + "/" + locArr[i] + "/" + category + "/");
				File[] files3 = f.listFiles();
				finPath = "./imgs/추천이미지/"+ locArr[i] + "/" + category + "/" + files3[0].getName();
			}
			
			System.out.println(finPath);
		  	out.println("<td><a href='./detail/"+ locArr[i]
		  	+".jsp'><img alt='사진' class='photo' src='"+ finPath +"' width='300' height='200'/></a>");
		    out.println("<br>" + locArr[i] + "</td>");
		    j2 = j;
		    break;
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