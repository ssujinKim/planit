<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      
      <!-- 추가 -->
      <link rel="stylesheet" href="./header.css" />
      <link rel="stylesheet" href="./footer.css" />
      <link href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css" rel="stylesheet" type="text/css" />

      <style>
         * {
           font-family: 'Spoqa Han Sans Neo', 'sans-serif';
         }
         
         main {
           margin-bottom: 100px;
         }
         
         .box {
           margin: 38px 80px;
           padding: 13px;
           text-align: center;
           border: 1px solid black;
           border-radius: 8px;
           font-size: 20px;
         }
         
         #say {
           width: 900px;
           margin-left: 50px;
           padding: 2px;
         }
         
         #watch {
           float: right;
           font-size: 17px;
           margin-top: -30px;
           margin-right: 10px;
           background-color: black;
         }
         
         .form1 {
           margin-top: 80px;
           margin-left: 220px;
         }
         
         .form2 {
           margin-left: 115px;
         }
         
         .form3 {
           margin-left: 220px;
         }
         
         .line_1 {
           display: inline-block;
           margin-left: 90px;
           margin-bottom: 50px;
         }
         
         .line_2 {
           display: inline-block;
           margin-left: 90px;
           margin-bottom: 50px;
         }
         
         .line_3 {
           display: inline-block;
           margin-left: 90px;
           margin-bottom: 80px;
         }
         
         [placeholder]:empty:before {
            display: block;
       		content: attr(placeholder);
       		color: #a6a6a6;
         }
      </style>
   
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" />
      
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.min.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      
      <title>테마별 추천</title>
      
      <script>
        $(document).ready(function () {
          $("input[type='checkbox']").on('click', function () {
            let count = $("input:checked[type='checkbox']").length;
      
            if (count > 3) {
              $(this).prop('checked', false);
              alert('3개까지 선택하실 수 있습니다.');
            }
            
          });
        });
      
        function check(frm) {
          var checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
          if (checkboxes.length < 1) {
            alert('키워드를 선택해주세요.');
            return false;
          }
        }
        
        $(document).ready(function(){
           $(".btn-check").click(function(){
              var str = "";
              $(".btn-check").each(function(){
                 if($(this).is(":checked"))
                    str += $(this).val() + " ";
              });
              $("#say").text(str);
           });
        });
      </script>
      </head>
      <body>
        <div id="container">
          <!-- 헤더 추가 -->
        <%@ include file="/header.jsp" %>
        <main>
          <br /><br />
          <form name="themeForm" onsubmit="return check(this);" action="./result.jsp" method="post">
            <div class="box">
              <div id="say" placeholder='원하는 키워드를 선택하세요 (3개까지 선택 가능)'></div>
              <div id="watch">
                <input type="submit" value="결과 보기" />
              </div>
            </div>
      
            <div class="form1">
              <div class="line_1">
                <input type="checkbox" class="btn-check" id="btn-check1" name="keyword" value="연인" autocomplete="off" />
                <label class="btn btn-outline-secondary" for="btn-check1">#연인</label>
              </div>
      
              <div class="line_1">
                <input type="checkbox" class="btn-check" id="btn-check2" name="keyword" value="가족" autocomplete="off" />
                <label class="btn btn-outline-secondary" for="btn-check2">#가족</label>
              </div>
      
              <div class="line_1">
                <input type="checkbox" class="btn-check" id="btn-check3" name="keyword" value="자연" autocomplete="off" />
                <label class="btn btn-outline-secondary" for="btn-check3">#자연</label>
              </div>
      
              <div class="line_1">
                <input type="checkbox" class="btn-check" id="btn-check4" name="keyword" value="힐링" autocomplete="off" />
                <label class="btn btn-outline-secondary" for="btn-check4">#힐링</label>
              </div>
            </div>
            <br />
      
            <div class="form2">
              <div class="line_2">
                <input type="checkbox" class="btn-check" id="btn-check5" name="keyword" value="흠냐.." autocomplete="off" />
                <label class="btn btn-outline-secondary" for="btn-check5">#흠냐..</label>
              </div>
      
              <div class="line_2">
                <input
                  type="checkbox"
                  class="btn-check"
                  id="btn-check6"
                  name="keyword"
                  value="분위기"
                  autocomplete="off"
                />
                <label class="btn btn-outline-secondary" for="btn-check6">#분위기</label>
              </div>
      
              <div class="line_2">
                <input
                  type="checkbox"
                  class="btn-check"
                  id="btn-check7"
                  name="keyword"
                  value="활동적"
                  autocomplete="off"
                />
                <label class="btn btn-outline-secondary" for="btn-check7">#활동적</label>
              </div>
      
              <div class="line_2">
                <input type="checkbox" class="btn-check" id="btn-check8" name="keyword" value="전통" autocomplete="off" />
                <label class="btn btn-outline-secondary" for="btn-check8">#전통</label>
              </div>
      
              <div class="line_2">
                <input
                  type="checkbox"
                  class="btn-check"
                  id="btn-check9"
                  name="keyword"
                  value="로맨틱"
                  autocomplete="off"
                />
                <label class="btn btn-outline-secondary" for="btn-check9">#로맨틱</label>
              </div>
            </div>
            <br />
      
            <div class="form3">
              <div class="line_3">
                <input
                  type="checkbox"
                  class="btn-check"
                  id="btn-check10"
                  name="keyword"
                  value="쇼핑"
                  autocomplete="off"
                />
                <label class="btn btn-outline-secondary" for="btn-check10">#쇼핑</label>
              </div>
      
              <div class="line_3">
                <input
                  type="checkbox"
                  class="btn-check"
                  id="btn-check11"
                  name="keyword"
                  value="산책"
                  autocomplete="off"
                />
                <label class="btn btn-outline-secondary" for="btn-check11">#산책</label>
              </div>
      
              <div class="line_3">
                <input
                  type="checkbox"
                  class="btn-check"
                  id="btn-check12"
                  name="keyword"
                  value="레트로"
                  autocomplete="off"
                />
                <label class="btn btn-outline-secondary" for="btn-check12">#레트로</label>
              </div>
      
              <div class="line_3">
                <input
                  type="checkbox"
                  class="btn-check"
                  id="btn-check13"
                  name="keyword"
                  value="감상"
                  autocomplete="off"
                />
                <label class="btn btn-outline-secondary" for="btn-check13">#감상</label>
              </div>
            </div>
          </form>
        </main>
        <!-- 푸터 추가 -->
        <%@ include file="/footer.jsp" %>
      </div>
   </body>
</html>