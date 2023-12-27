<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="upload.CustomFileRenamePolicy" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

	<link href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" />
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
	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(() => {
  $('#run-python-btn').click(() => {
	  window.location.href = './runPython.jsp';
  });
});
</script>
</head>
<body>
  <div id="container">
  <%@ include file="/header.jsp"%>
  <main>
<%
	MultipartRequest multi = new MultipartRequest(request, "C:\\Plan-it", 5*1024*1024, "UTF-8", new CustomFileRenamePolicy());
	
	Enumeration files = multi.getFileNames();
	
	String name = (String) files.nextElement();
	File file = multi.getFile(name);
	
	if(file != null) {
		out.println("파일 업로드 완료!");
		out.println("<br>");
	} else {
		out.println("파일 업로드 실패..");
		out.println("<br>");
	}
%>

    <section id="blog" class="section">
        <div class="container text-center" id="header1">
            <h6 class="section-title mb-4">이미지가 저장되었습니다.</h6>
            <h6 class="subtitle">실행 버튼을 클릭하여 비슷한 여행지를 추천 받으세요!
                <br>
                <br>
                <br>
            </h6>
            <div class="row text-left">
                <div class="col-md-4">
                    <div class="card border mb-4">
                        <div class="card-body">
                            <div id="upload-container">
                                <h1>여행지 추천</h1>
                                <br>
                                <br>
                                <br>
                                <button id="run-python-btn">실행</button>
                                <div id="loading-overlay">
                                    <div id="loading-spinner"></div>
                                </div>
                                <div id="python-result"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
  </main>
  <%@ include file="/footer.jsp" %>
  </div>
</body>
</html>