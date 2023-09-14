<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../mall_client/mall_index_top.jsp" %>

 <script>
 
 
 function sendId(){
	 document.f.submit()
 }
 function sendPw(){
	 document.p.submit()
 }
    function toggleInputDisplay() {
      var inputContainers = {
        email: document.getElementById("input_email"),
        hp: document.getElementById("input_hp")
      };

      var radioButtons = document.getElementsByName("radio_option");
      var selectedOption;

      // 선택된 라디오 버튼의 값을 가져옵니다.
      for (var i = 0; i < radioButtons.length; i++) {
        if (radioButtons[i].checked) {
          selectedOption = radioButtons[i].value;
          break;
        }
      }

      // 선택된 옵션에 따라 해당 입력란을 보이거나 숨깁니다.
      for (var option in inputContainers) {
        if (inputContainers.hasOwnProperty(option)) {
          if (option === selectedOption) {
            inputContainers[option].style.display = "block";
          } else {
            inputContainers[option].style.display = "none";
          }
        }
      }
    }
   
    
  </script>

<div class="container-fluid" style="width:80%;">

<div class="row" style="justify-content: center;">
<div class="col-1 col-lg-3" style="margin:20px 0px"></div>
<div class="col-10 col-lg-6" style="margin:20px 0px">

<form name ="f" id="find_id_f" action="find_id_complete.do" method ="post">
	<input type ="hidden" name = "mode" value = "${mode}">
	<c:if test="${mode == 'find_id'}">
	<h2>아이디 찾기</h2>
		<input type="radio" name="radio_option" value="email" onchange="toggleInputDisplay()" checked>
		이메일
		<input type="radio" name="radio_option" value="hp" onchange="toggleInputDisplay()">
		휴대폰번호
		<div style="margin:3px 0px;">
			<input class="input" name="name" style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" placeholder="이름">
		</div>
		<div id="input_email" style="display: block; margin:3px 0px;">
			<input class="input" name="email" style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" placeholder="이메일">
		</div>
		<div id="input_hp" style="display: none; margin:3px 0px;">
			<input class="input" name="hp" style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" placeholder="휴대폰번호">
		</div>
		<button type="submit" class="btn s-btn" style="width:100%;">확인</button>
	</form>
	</c:if>
	<form name ="p" id="find_id_pw" action="find_pw_complete.do" method ="post">
	<c:if test="${mode != 'find_id'}">
	
	<h2>비밀번호 찾기</h2>
		<div style="margin:3px 0px;">
			<input class="input" name = "name" placeholder="이름" style="width:100%">
		</div>
		<div id="input_email" style="display: block; margin:3px 0px;">
			<input class="input" name="email" style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" placeholder="이메일">
		</div>
		<button type="submit" class="btn s-btn" style="width:100%;">확인</button>
	</c:if>
		</form>
</div>      
<div class="col-1 col-lg-3" style="margin:20px 0px"></div>
</div>

</div>

<%@include file="../mall_client/mall_index_bottom.jsp" %>

