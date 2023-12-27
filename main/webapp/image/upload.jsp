<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<!-- 이미지 미리보기 -->
	<script>
	function setThumbnail(event){
		var reader = new FileReader();
		
		reader.onload = function(event){
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			img.setAttribute("class", "col-lg-6");
			document.querySelector("div#image_container").appendChild(img);
		};
		
		reader.readAsDataURL(event.target.files[0]);
	}
	
	$(document).ready(function () {
		$('input[type=submit]').click(function(){
			const input = document.getElementById('file-input');
		    const file = input.files[0];
		    if (!file) {
		        alert('파일을 선택해주세요.');
		        return false;
		    }
		});
	});
	</script>
</head>
<body>
  <div id="container">
  <%@ include file="/header.jsp"%>
  <main>
	<form name="fileForm" method="POST" enctype="multipart/form-data" action="upload_process.jsp">
		<input type="file" name="fileName" id="file-input" onchange="setThumbnail(event);">
		<div id="image_container"></div>
		<p> <input type="submit" value="파일 올리기" id="submit-button"> </p>
	</form>
  </main>
  <%@ include file="/footer.jsp" %>
  </div>
</body>
</html>