<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 찾기</title>
</head>

<body>
	<section id="one" class="one">
		<div class="box">
			<header class="align-center">
				<h2>비밀번호 찾기</h2>
			</header>
			<div class="form_wrapper">
				<form action="./findPwCheck.jsp" class="form-signin">
					<div class="form_row">
						<label for="name">이름</label>
						<input type="text" id="findname" name="name" pattern="[가-힣]{2,10}" placeholder="이름" title="한글 실명" required autofocus>
					</div>
					<div class="form_row">
						<label for="name">아이디</label>
						<input type="text" id="id" name="id" placeholder="아이디" title="아이디" maxlength="20" required autofocus>
					</div>
					<div class="form_row">
						<label for="phone">핸드폰 번호</label>
						<input type="tel" id="phone" name="phone" pattern="([0-9]{3}-[0-9]{4}-[0-9]{4})|([0][0-9]{10})" maxlength="13" placeholder="휴대폰 번호 (000-0000-0000 형식)" title="휴대폰 번호 (000-0000-0000 형식)" required>
					</div>
					<div class="form_button">
						<button class="button" type="submit">비밀번호 찾기</button>
					</div>
				</form>
			</div>
		</div>
	</section>
</body>
</html>