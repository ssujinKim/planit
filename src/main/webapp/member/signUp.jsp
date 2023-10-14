<!-- 회원가입 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css">
  <title>회원가입</title>

  <!--          script 선언          -->
  <script src="https://code.jquery.com/jquery-3.1.1min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>

  <%
  //session.invalidate();
  %>
  
  <style>
    .box { /* 큰 박스 */
      margin: 38px 80px;  /* 화면 테두리와 제목 간격 0px */
      height: 1100px;
      padding-top: 20px; 
      /* padding-bottom: 40px; */
      margin-left: -159px;
      margin-right: -159px;
      /* padding: 50px; */
      text-align: center;
      background-color: rgb(230, 229, 229);
    }

    .form_wrapper {
      width: 550px;
      display: inline-block;
      text-align: left;
      margin: 20px; 
      padding: 100px;
      border: 1px solid black;
      border-radius: 5px;
      padding-top: 20px;
      padding-bottom: 0px;
      background-color:rgb(239, 239, 239);
    }

    .form_wrapper > h1 {
      color:#002C7F;
      padding-bottom: 20px;
      text-align: center;
    }

    .form_title {
      margin: 3px;
      margin-left: 5px;
      text-align: left;
      font-size: 14px;
    }

    .sign_up { /* 상자 */
      padding: 15px;
      width: 350px;
      margin: 3px;
      border: 1px solid lightgray;
      margin-bottom: 20px;
      /* margin-left: 30px; */
      border-radius: 5px;
      font-size: 15px;
    }

    .sign_up_id {
      padding: 15px;
      width: 226px;
      margin: 3px;
      border: 1px solid lightgray;
      margin-bottom: 20px;
      /* margin-left: 30px; */
      border-radius: 5px;
      font-size: 15px;
    }

    #btnOverlapped {
      font-size: 15px;
      padding: 12px;
      /* padding-bottom: 8px; */
      width: 110px;
      /* text-align: center; */
    }

    .sign_up_birth {
      padding: 15px;
      width: 215px;
      margin: 3px;
      border: 1px solid lightgray;
      margin-bottom: 20px;
      /* margin-left: 30px; */
      border-radius: 5px;
      font-size: 15px;
    }

    .btn-group { /* 성별 버튼 */
      width: 121px;
      height: 52px;
      margin-bottom: 2.2px;
      /* margin: 3px; */
    }

    .btn { /* 성별 버튼 가운데 맞춤 */
      font-size: 15px;
      padding-top: 15px;
    }

    .signup_button { /* 회원가입 버튼 */
      padding: 10px;
      width: 350px; 
      margin: 3px;
      margin-top: 50px;
      margin-bottom: 100px;
      background-color: #002C7F;
      color: white;
      font-size: 18px;
    }

  </style>
  
</head>

  <script>
  function signUpValidation(){
    var id = document.SignupForm.id.value;
    var hid = document.SignupForm.h_id.value;
    var pw1 = document.SignupForm.pw.value;
    var pw2 = document.SignupForm.pw_check.value;
    var name = document.SignupForm.name.value;
    var birth = document.SignupForm.birth.value;
    //var gender = document.getElementsByName("gender");
    //var selectGen = "";
    var man = document.getElementById("man");
    var woman = document.getElementById("woman");
    var phone = document.SignupForm.phone.value;
    var email = document.SignupForm.email.value;
    
    //최소 한개의 영문, 숫자 포함(정규표현식)
    var idv=/^[a-z0-9_.]{4,}$/
    if(!idv.test(id)) {
        alert("ID는 4자 이상의 영문, 숫자로 이루어진 문자여야 합니다.")
        document.SignupForm.id.focus();
        return false;
    }
    
    var pwv=/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,}$/
    if(!pwv.test(pw1)) {
        alert("비밀번호는 4자 이상의 영문, 숫자로 이루어진 문자여야 합니다.")
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
    
    // 생년월일 검사
    if(birth == "") {
        alert("생년월일을 입력하세요.");
        return false;
    }

     //성별 확인
   for(var i=0; i<gender.length; i++) {
      if(gender[i].checked) {
         selectGen=gender[i].value;
         break;
      }
   }
   if(selectGen==="") {
      alert("성별을 선택해주세요");
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
  <div id="container">
    <%@ include file="/header.jsp"%>

    <main>
      <section id="one" class="one">
        <div class="box">
          <div class="form_wrapper">
            <h1><b>Plan-it</b></h1>
            <form name="SignupForm" action="./signUpCheck.jsp" onSubmit="return signUpValidation();">

              <!-- 아이디 -->
              <div class = "form_box">

                <div class = "form_title">
                  <label for = "id_label" class = "form_label"><b>아이디</b></label>
                </div>

                <div class = "check">
                  <input type="text" class="sign_up_id" id="id" placeholder="아이디를 입력해주세요." title="아이디 (영문, 숫자 4~20자)" maxlength="20" required>
                  <input type="hidden" name="h_id"  id="h_id" />
                  <input type="button" id="btnOverlapped" value="중복확인" onClick="fn_overlapped()" />
                </div>
              </div>

              <!-- 비밀번호 -->
              <div class = "form_box">
                <div class = "form_title">
                  <label for = "pw_label" class = "form_label"><b>비밀번호</b></label>
                </div>
                <div class = "check">
                  <input type="password" class="sign_up" id="pw" name="pw" placeholder="비밀번호를 입력해주세요. (4자 이상)" title="비밀번호 (4자 이상)" required>
                </div>
              </div>

              <!-- 비밀번호 확인 -->
              <div class = "form_box">
                <div class = "form_title">
                  <label for = "pwcheck_label" class = "form_label"><b>비밀번호 확인</b></label>
                </div>
                <div class = "check">
                  <input type="password" class="sign_up" id="pwcheck" placeholder="비밀번호를 한 번 더 입력해주세요." title="비밀번호 확인 (비밀번호와 동일한 값)" required>
                </div>
              </div>

              <!-- 이름 -->
              <div class = "form_box">
                <div class = "form_title">
                  <label for = "name_label" class = "form_label"><b>이름</b></label>
                </div>
                <div class = "check">
                  <input type="text" class="sign_up" id="name" name="name" pattern="[가-힣]{2,10}" placeholder="이름을 입력해주세요." title="한글 실명" required>
                </div>
              </div>

              <!-- 전화번호 -->
              <div class = "form_box">
                <div class = "form_title">
                  <label for = "phone_label" class = "form_label"><b>휴대폰 번호</b></label>
                </div>
                <div class = "check">
                  <input type="tel" class="sign_up" id="phone" name="phone" pattern="([0-9]{3}-[0-9]{4}-[0-9]{4})" maxlength="13" placeholder="휴대폰 번호를 입력해주세요. (010-xxxx-xxxx)" title="휴대폰 번호 (010-xxxx-xxxx)" required>
                </div>
              </div>

              <!-- 이메일 -->
              <div class = "form_box">
                <div class = "form_title">
                  <label for = "email_label" class = "form_label"><b>이메일</b></label>
                </div>
                <div class = "check">
                  <input type="email" class="sign_up" id="email" name="email" placeholder="이메일을 입력해주세요." title="이메일 주소 (xxx@xxxxx.xxx 형식)" required>
                </div>
              </div>

              <!-- 생년월일/성별 -->
              <div class = "form_box">
                <div class = "form_title">
                  <label for = "birth_label" class = "form_label"><b>생년월일 / 성별</b></label>
                </div>
                <div class = "check">
                  <input type="date" class="sign_up_birth" id="birth" name="birth" placeholder="생년월일" onclick="setMaxDate()" min="1900-01-01" required>
                  <div class="btn-group btn-group-sm">
                    <!-- 부트스트랩 라디오버튼 토글버튼 -->
                    <input type="radio" class="btn-check" name="gender" id="man" autocomplete="off" value="M">
                    <label class="btn btn-outline-secondary" for="man">M</label>
                    
                    <input type="radio" class="btn-check" name="gender" id="woman" autocomplete="off" value="F">
                    <label class="btn btn-outline-secondary" for="woman">F</label>
                  </div>
                </div>
              </div>

                <div class="form_signup_button"> <!-- 회원가입 버튼 -->
                  <button type="submit" class="signup_button">회원가입</button>
                </div>
            </form>
          </div>
        </div>
        <input type="hidden" name="type" value="signUp"/>
      </section>
    </main>
    <%@ include file="/footer.jsp"%>
  </div>
</body>
</html>