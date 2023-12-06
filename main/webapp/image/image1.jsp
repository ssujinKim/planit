<!-- 이미지 추천 페이지 1 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css"  />
	<link href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css" rel="stylesheet" type="text/css" />
	<title>이미지 기반 추천1</title>
	
	<style>
	  * {
	    font-family: 'Spoqa Han Sans Neo', 'sans-serif';
	  }
	
	  main {
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
	    text-align: center;
	  }
	
	  .upload {
	    margin-left: 430px;
	    margin-top: 30px;
	    border: 1px solid rgb(161, 161, 161);
	    border-radius: 5px;
	    width: 600px;
	    height: 150px;
	  }
	
	  .drag {
	    margin-left: 100px;
	    padding-top: 35px;
	  }
	
	  .form_button {
	    text-align: center;
	
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
	</head>
    <body>
	  <div id="container">
	  <%@ include file="/header.jsp"%>
	  <main>
	    <div class="box">
	      <div class="main_box">
	        <div class="title">
	          <h3><b>이미지 업로드</b></h3>
	        </div>
	
	        <div class="upload">
	          <div class="drag">
	            <h5>드래그 & 드롭 또는 클릭하여 사진을 선택해주세요</h5>
	          </div>
	          <div class="form_button">
	            <a href="./image2.jsp">
	              <button type="submit" class="select_button">파일 선택</button>
	            </a>
	          </div>
	        </div>
	      </div>
	    </div>
      </main>
      <%@ include file="/footer.jsp"%>
    </div>
  </body>
</html>

