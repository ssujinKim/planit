<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>테마별 추천</title>

<script>
$(document).ready(function(){
	$("input[type='checkbox']").on("click", function(){
		let count = $("input:checked[type='checkbox']").length;
		
		if(count > 3){
			$(this).prop("checked", false);
			alert("3개까지 선택하실 수 있습니다.");
		}
	});
});

function check(frm){
	var checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
    if(checkboxes.length < 1){
    	alert("키워드를 선택해주세요.");
    	return false;
    }
}
</script>

</head>
<body>
	<div id="container">

	<%@ include file="/header.jsp"%>
	<br><br>

		<form name="themeForm" onsubmit="return check(this);" action="./result.jsp" method="post">

		키워드 선택 (3개까지 선택 가능)
		<br><br>
		<input type="checkbox" class="btn-check" id="btn-check" autocomplete="off">
		<label class="btn btn-primary" for="btn-check">체크박스 샘플</label>

		<input type="checkbox" name="keyword" value="연인" autocomplete="off">#연인
		<input type="checkbox" name="keyword" value="가족" autocomplete="off">#가족
		<input type="checkbox" name="keyword" value="자연" autocomplete="off">#자연
		<input type="checkbox" name="keyword" value="힐링" autocomplete="off">#힐링
		<input type="checkbox" name="keyword" value="분위기" autocomplete="off">#분위기
		<input type="checkbox" name="keyword" value="활동적" autocomplete="off">#활동적<br>
		<input type="checkbox" name="keyword" value="전통" autocomplete="off">#전통
		<input type="checkbox" name="keyword" value="로맨틱" autocomplete="off">#로맨틱
		<input type="checkbox" name="keyword" value="쇼핑" autocomplete="off">#쇼핑
		<input type="checkbox" name="keyword" value="산책" autocomplete="off">#산책
		<input type="checkbox" name="keyword" value="레트로" autocomplete="off">#레트로
		<input type="checkbox" name="keyword" value="감상" autocomplete="off">#감상<br><br>

		<input type="submit" value="결과 보기"/>
		</form>

	
	</div>
</body>
</html>