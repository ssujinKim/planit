<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

	<!--          script 선언          -->
    <script src="https://code.jquery.com/jquery-3.1.1min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
</head>

<style>
.box{
  text-align: center;
}
.form_wrapper{
  display: inline-block;
  text-align: left;
  margin: 20px; 
  padding: 30px;
  border: 1px solid black;
  border-radius: 5px;
}
table{
  margin-left: auto; 
  margin-right: auto;
  border: none;
}
td{
  padding: 5px;
}
</style>

<%session.invalidate();%>

<script>
function signUpValidation(){
	var id = document.SignupForm.id.value;
	var hid = document.SignupForm.h_id.value;
	var pw1 = document.SignupForm.pw.value;
	var pw2 = document.SignupForm.pw_check.value;
	var name = document.SignupForm.name.value;
	var birth = document.SignupForm.birth.value;
	var gender = document.getElementsByName("gender");
	var selectGen = "";
	var phone = document.SignupForm.phone.value;
	var email = document.SignupForm.email.value;
	
	//최소 한개의 영문, 숫자, 특수문자 포함(정규표현식)
	var idv=/^[a-z0-9_.]{4,}$/
	if(!idv.test(id)) {
		alert("ID는 4자 이상의 영문, 숫자로 이루어진 문자여야 합니다.")
		document.SignupForm.id.focus();
		return false;
	}
	
	var pwv=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{4,}$/
	if(!pwv.test(pw1)) {
		alert("비밀번호는 4자 이상의 영문, 숫자, 특수문자로 이루어진 문자여야 합니다.")
		document.SignupForm.pw.focus();
		return false;
	}
	if(pw1 != pw2) {
		alert("비밀번호가 일치하지 않습니다.");
		document.SignupForm.pw_check.focus();
		return false;
	}
	
	if(name == "") {
		alert("이름을 입력해주세요.");
		document.SignupForm.name.focus();
		return false;
	}
	
	//성별 확인
	for(var i=0; i<gender.length; i++) {
		if(gender[i].checked) {
			selectGen=gender[i].value;
			break;
		}
	}
	if(selectGen == "") {
		alert("성별을 선택해주세요");
		return false;
	}
	
	// 생년월일 검사
	if(birth == "") {
		alert("생년월일을 입력하세요.");
		return false;
	}
	
	//휴대폰번호 검사
	if(phone == "") {
		alert("휴대폰 번호를 입력하세요.");
		document.SignupForm.phone.focus();
		return false;
	}
	
	//이메일 검사
	if(email == "") {
		alert("이메일을 입력하세요.");
		document.SignupForm.email.focus();
		return false;
	}
	
	if(hid=="") {
		alert("아이디 중복검사를 실행해주세요.");
		return false;
	}
	
	return true;
}
</script>

<script type="text/javascript">
function fn_overlapped(){
	   
	var _id = $("#id").val();
    
    if(_id==''){
   	 alert("ID를 입력하세요");
   	 return;
    }
  
    $.ajax({
       type:"post",
       async:false,  
       url:"overlapped.jsp",
       dataType:"text",
       data: {id:_id},
       success:function (data){
    	   console.log(data.replace(/(<([^>]+)>)/ig,""));
    	   
    	   //alert(data);
    	   
          if(data.includes("false")){
       	    alert("사용할 수 있는 ID입니다.");
       	    $('#btnOverlapped').prop("disabled", true);
       	    $('#id').prop("disabled", true);
       	    $('#h_id').val(_id);
          }else{
        	  alert("사용할 수 없는 ID입니다.");
          }
       },
       
       error:function(data,textStatus){
          alert("에러가 발생했습니다. " + textStatus);ㅣ
       },
       complete:function(data,textStatus){
          //alert("작업을 완료했습니다");
       }
    })  //end ajax	 
 }	

</script>

<body>

<section id="one" class="one">
	<div class="box">
		<header class="align-center">
			<h2>회원가입</h2>
		</header>

		<div class="form_wrapper">
			<form name="SignupForm" action="./signUpCheck.jsp" onSubmit="return signUpValidation();">
				<table>
				<tr><td>아이디</td>
				<td><input type="text" id="id" placeholder="아이디" title="아이디 (영문, 숫자 4~20자)" maxlength="20" required></td>
				<td><input type="hidden" name="h_id" id="h_id" />
				<input type="button"  id="btnOverlapped" value="중복체크" onClick="fn_overlapped()" /></td></tr>
				
				<tr><td>비밀번호</td>
				<td colspan=2><input type="password" id="pw" name="pw" placeholder="비밀번호" title="비밀번호 (4자 이상)" required></td>
				</tr>
				
				<tr><td>비밀번호 확인</td>
				<td colspan=2><input type="password" id="pw_check" placeholder="비밀번호 확인" title="비밀번호 확인 (비밀번호와 동일한 값)" required></td>
				</tr>
				
				<tr><td>이름</td>
				<td colspan=2><input type="text" id="name" name="name" pattern="[가-힣]{2,10}" placeholder="이름" title="한글 실명" required></td>
				</tr>
				
				<tr><td>성별</td>
				<td><input type="radio" id="man" name="gender" value="남"><label for="man">남자</label></td>
				<td><input type="radio" id="woman" name="gender" value="여"><label for="woman">여자</label></td>
				</tr>
				
				<tr><td>생년월일</td>
				<td colspan=2><input type="date" name="birth" placeholder="생년월일" onclick="setMaxDate()" min="1900-01-01" required></td>
				</tr>
				
				<tr><td>휴대폰 번호</td>
				<td colspan=2><input type="tel" id="phone" name="phone" pattern="([0-9]{3}-[0-9]{4}-[0-9]{4})|([0][0-9]{10})" maxlength="13" placeholder="휴대폰 번호" title="휴대폰 번호 (010-xxxx-xxxx)" required></td>
				</tr>
				
				<tr><td>이메일</td>
				<td colspan=2><input type="email" id="email" name="email" placeholder="이메일 주소" title="이메일 주소 (xxx@xxxxx.xxx 형식)" required></td>
				</tr>
				
				<tr><td><button onclick="history.back()" class="button alt">취소</button></td>
				<td></td>
				<td><button type="reset" class="button">초기화</button>
				<button type="submit" class="button">회원가입</button></td>
				</tr>
				</table>
			</form>
		</div>
	</div>
				<input type="hidden" name="type" value="signUp"/>
</section>
</body>
</html>