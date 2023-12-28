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
	  <link rel="stylesheet" href="./header.css" />
	  <link rel="stylesheet" href="./footer.css" />
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css"  />
	  <link href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css" rel="stylesheet" type="text/css" />
	
	  <title>이미지 기반 추천</title>
	  
	  <style>
	    * {
	      font-family: 'Spoqa Han Sans Neo', 'sans-serif';
	    }
	
	    main {
	      margin-left: -50px;
	      margin-right: -50px;
	      height: 600px;
	      background-color: rgb(232, 232, 232);
	      margin-bottom: 70px;
	    }
	
	    .main_box {
	      margin-left: 30px;
	      margin-right: 30px;
	      background-color: white;
	      height: 540px;
	    }
	
	    .box {
	      padding-top: 30px;
	    }
	
	    .title {
	      padding-top: 50px;
	      padding-left: 520px;
	    }
	
	    .upload {
	      margin-left: 310px;
	      margin-top: 30px;
	      border: 1px solid rgb(161, 161, 161);
	      border-radius: 5px;
	      width: 600px;
	      height: 150px;
	      text-align: center;
	      padding-top: 35px;
	    }
	    
	    .form_button {
	      padding-left: 235px;
	    }
	
	    .select_button {
	      padding: 3px;
	      width: 100px;
	      margin: 3px;
	      margin-top: 10px;
	      margin-bottom: 30px;
	      background-color: rgb(227, 227, 227);
	      border: 1px solid black;
	      font-size: 15px;
	      border-radius: 3px;
	    }
	  </style>
	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
function LoadingWithMask() {
	//화면의 높이와 너비
	var maskHeight = $(document).height();
	var maskWidth = window.document.body.clientWidth;
	
	//화면에 출력할 마스크 설정
	var mask = "<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;'>";
	var loadingImg = '';
	loadingImg += "<div id='loadingImg'>";
	loadingImg += " <img src='./imgs/LoadingImg.gif'/>";
	loadingImg += "</div></div>";  
	
	//화면에 레이어 추가
	$('body').append(mask).append(loadingImg);
	
	//css 설정
	$('#mask').css({
		'width' : maskWidth,
		'height': maskHeight,
		'opacity' : '0.3'
	});
	
	$('#loadingImg').css({
		'position': 'absolute',
	    'top': '45%',
	    'left': '45%',
	    'margin': '-25px 0 0 -25px',
	    'text-align': 'center'
	});
	
	//마스크 표시
	$('#mask').show();
	
	//로딩중 이미지 표시
	$('#loadingImg').show();
}


$(document).ready(() => {
  $('#run-python-btn').click(() => {
	  window.location.href = './runPython.jsp';
	  LoadingWithMask();
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
	
	String msg = "";
	if(file != null) {
		msg = "성공";
		out.println("<br>");
	} else {
		msg = "실패";
		out.println("<br>");
	}
%>

	<div class="box">
	  <div class="main_box">
	    <div class="title">
	      <h3><b>여행지 추천</b></h3>
		</div>
	
		<div class="upload">
		  <h6 class="section-title mb-4">이미지 저장에 <%=msg%>했습니다.</h6>
		  <h6 class="subtitle">
		  <%
		  String msg2 = "";
		  if(msg.equals("성공")) {
			  msg2 = "실행 버튼을 클릭하여 비슷한 여행지를 추천 받으세요!";
		  } else {
			  msg2 = "이미지를 다시 선택해주세요.";
		  }
		  %>
		  <%=msg2%><br><br><br></h6>
		  <button id="run-python-btn">실행</button>
		</div>
	  </div>
	</div>
  </main>
  <%@ include file="/footer.jsp" %>
  </div>
</body>
</html>