<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "../mall_client/mall_index_top.jsp" %>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">

function pwdCheck1(pwdValue) {
	var reg = /^(?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?:[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{10,16}$/;
	
	if (reg.test(pwdValue)) {
		document.getElementById("pwd_check1").innerHTML
			= "<p style = 'font-size : 12; text-align:left;'>사용가능한 비밀번호입니다.</p>"
	} else {
		document.getElementById("pwd_check1").innerHTML
			= "<p style = 'font-size : 12; text-align:left;'>사용할 수 없는 비밀번호입니다.</p>"
		}
}
	
	function pwdCheck(pwdValue) {
		if (document.edit_form.password.value != document.edit_form.member_pwd_check.value) {
			document.getElementById("pwd_check").innerHTML
				= "<p style = 'font-size : 12; text-align:left;'>비밀 번호가 일치하지 않습니다.</p>"
				
			document.edit_form.isPwdCheck.value = "false"
		} else if (document.edit_form.password.value == document.edit_form.member_pwd_check.value) {
			document.getElementById("pwd_check").innerHTML
				= "<p style = 'font-size : 12; text-align:left;'>비밀 번호가 일치합니다.</p>"
			document.edit_form.isPwdCheck.value = "true"
		}
		if (document.edit_form.password.value == "" || document.edit_form.member_pwd_check.value == "") {
			document.getElementById("pwd_check").innerHTML = ""
			document.edit_form.isPwdCheck.value = "false"
		}
}
	
	
	// 필수입력칸 유효성 검사
	function joinCheck() {
		if (document.edit_form.password.value == "") {
			alert("비밀번호를 입력하세요.")
			document.edit_form.password.focus()
			
			return false
		}
		
		if (document.edit_form.member_pwd_check.value == "") {
			alert("비밀번호 확인란을 입력하세요.")
			document.edit_form.member_pwd_check.focus()
			
			return false
		}

		if (document.edit_form.isPwdCheck.value == "false") {
			alert("입력한 비밀번호가 일치하는지 확인해주세요.")
			document.edit_form.member_pwd_check.focus()
			
			return false
		}

		
		if (document.edit_form.member_hp1.value == "") {
			alert("휴대폰 번호를 입력하세요.")
			document.edit_form.member_hp1.focus()
			
			return false
		}

		if (document.edit_form.member_hp2.value == "") {
			alert("휴대폰 번호를 입력하세요.")
			document.edit_form.member_hp2.focus()
			
			return false
		}
		
		if (document.edit_form.member_hp3.value == "") {
			alert("휴대폰 번호를 입력하세요.")
			document.edit_form.member_hp3.focus()
			
			return false
		}
		
		if (document.edit_form.member_email.value == "") {
			alert("이메일을 입력하세요.")
			document.edit_form.member_email.focus()
			
			return false
		}

		if (document.join_form.isEmailCheck.value == "false") {
			alert("입력한 이메일이 유효하지 않습니다. 유효한 이메일 주소를 입력해주세요.")
			document.join_form.member_email.focus()
			
			return false
		}
		
		return true
	}

	//이메일 유효성 검사
	function emailCheck(emailValue) {
	var reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
	if (reg.test(emailValue)) {
		document.getElementById("email_check").innerHTML
			= "<p style = 'font-size : 12; text-align:left;'>유효한 이메일입니다.</p>"
		document.edit_form.isPwdCheck.value = "true"

	} else {
		document.getElementById("email_check").innerHTML
			= "<p style = 'font-size : 12; text-align:left;'>유효하지 않은 이메일주소입니다.</p>"
		document.edit_form.isPwdCheck.value = "false"

			}
	}
	
	// 회원탈퇴
function submitForm(value) {
  // hidden 타입의 input 엘리먼트 생성
  var input = document.createElement('input');
  input.type = 'hidden';
  input.name = 'data'; // 전송할 데이터의 이름
  input.value = value; // 전송할 데이터의 값

  // 폼 생성 및 hidden input 추가
  var form = document.createElement('form');
  form.method = 'POST'; // 전송 방식 (GET 또는 POST)
  form.action = 'delete_member.do'; // 전송할 URL

  // hidden input을 폼에 추가
  form.appendChild(input);

  // 폼을 body에 추가하고 자동으로 전송
  document.body.appendChild(form);
  form.submit();
}

	
 	function execDaumPostcode() {
 	    new daum.Postcode({
 	        oncomplete: function(data) {
 	        	  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
 	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
 	            var addr = ''; // 주소 변수
 	            var extraAddr = ''; // 참고항목 변수

 	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
 	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
 	                addr = data.roadAddress;
 	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
 	                addr = data.jibunAddress;
 	            }
 	            
 	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
 	            document.getElementById('postcode').value = data.zonecode;
 	            document.getElementById("address").value = addr;
 	            // 커서를 상세주소 필드로 이동한다.
 	            document.getElementById("detail_address").focus();
 	        }
 	    }).open();
 	}
 	
 	function submitDeleteMember() {
 		alert('a')
		document.delete_member.action = "delete_member.do"
		document.delete_member.submit()
	}

</script>

<form name = "edit_form" action = "edit_mypage_complete.do" method = "post" onsubmit = "return joinCheck()">
<div class="container-fluid" style="width:80%; margin-top:30px;">

<div class="row" style=" justify-content: center; flex-wrap:nowrap;" >
<div class="col-1 col-lg-3"></div>
<div class="col-10 col-lg-6" style="width:100%; max-width:800px; text-align:center;">
<h2>회원정보 수정</h2>
      <div style="margin:3px 0px;">
      	<div class="float-start" style="padding:10px; margin:10px;">INFORMATION
		</div>
		<div class="float-end" style="padding:10px; margin:10px;">*필수입력사항
		</div>
		</div>
      <div style="margin:3px 0px;">
        <input name="id" style="border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" value="${memberInfo.id}" readonly>
      </div>
      <div style="margin:3px 0px;">
      	<input type="password" name="password" style="border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" placeholder="비밀번호*" onkeyup="pwdCheck1(this.value)">
      	<br>
		<span id = "pwd_check1"></span>
      </div>
      <div style="margin:3px 0px;">
      	<input type="password" name="member_pwd_check" style="border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" placeholder="비밀번호 확인*" onkeyup="pwdCheck(this.value)">
		<br>
		<span id = "pwd_check"></span>
		<input type = "hidden" name = "isPwdCheck">

      </div>
      <div style="margin:3px 0px;">
      	<input name="name" style="border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" value="${memberInfo.name}" readonly>
      </div>
      <div style="margin:3px 0px;">
        <input name="nickname" style="border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" placeholder="닉네임" value="${memberInfo.nickname}">
      </div>


<div class="d-flex justify-content-center align-items-center" style="margin:3px 0px;">
<div class="align-self-between" style="width:100%; max-width:800px;">
<div class="float-start" style="width:68%;">
      	<input name="postal_code" id="postcode" style="border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" placeholder="주소" readonly>
</div>
<div class="float-start" style="width:4%"></div>
<div class="float-end" style="width:28%">
      	<input type="button" style="border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" onclick="execDaumPostcode()" value="우편번호">
</div>
</div>
</div>

      <div style="margin:3px 0px;">
      	<input name="address" id="address" style="border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" placeholder="기본주소" readonly>
      </div>
      <div style="margin:3px 0px;">
      	<input name="detail_address" id="detail_address" style="border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" placeholder="나머지주소(선택입력가능)">
      </div>

  	  <div class="d-flex justify-content-between align-items-center" style="margin:3px 0px;">
  	  	<div style="width:31%">
      	<input name="hp1" style="border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" value="${memberInfo.hp1}">
      	</div>
      	<div> - </div>
      	<div style="width:31%">
     	<input name="hp2" style="border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" placeholder="전화번호" value="${memberInfo.hp2}">
      	</div>
		<div> - </div>
      	 <div style="width:31%">
      	<input name="hp3" style="border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" value="${memberInfo.hp3}">
      	</div>
      </div>
      <div style="margin:3px 0px;">
      	<input name="email" style="border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" placeholder="이메일*" value="${memberInfo.email}" onkeyup="emailCheck(this.value)">
      <br>
		<span id = "email_check"></span>   
		<input type = "hidden" name = "isEmailCheck" value = "false">
      </div>
		<div style="text-align:left; padding:10px; margin:10px;">추가 정보</div>
		<div style="text-align:left;">
		<c:if test="${memberInfo.gender == 'male'}">
		<input type = "radio" name = "gender" value = "male" checked="checked">
			<label>남성</label>
			&emsp;
			<input type = "radio" name = "gender" value = "female" disabled="disabled">
			<label>여성</label>
		</c:if>
		<c:if test="${memberInfo.gender != 'male'}">
		<input type = "radio" name = "gender" value = "male" disabled="	">
			<label>남성</label>
			&emsp;
			<input type = "radio" name = "gender" value = "female" checked="checked">
			<label>여성</label>
		</c:if>
		</div>
  	  <div class="d-flex justify-content-between align-items-center" style="margin:3px 0px;">
	  	  <div style="width:30%">
	     	<input name="birth_year" style="border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" placeholder="생년월일" value="${memberInfo.birth_year}">
	     </div>
	     	<div> 년 </div>
	     <div  style="width:30%"> 
	     	<input name="birth_month" style="border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" value="${memberInfo.birth_month}">
	      </div>
	      <div> 월 </div> 
	      <div style="width:30%">
	      	<input name="birth_day" style="border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" value="${memberInfo.birth_day}">
	      </div>
	       	<div> 일 </div>
	      <div style="clear: both;"></div>
       </div>
        <div style="margin:3px 0px; text-align:left;">환불계좌
        </div>
	 <div style="margin:3px 0px;">
      	<div class="float-start" style="padding:0px; margin:0px;">
<button type="button" class="btn" onclick="window.open('refund_account.do','환불계좌 등록',width=500,height=500)">환불계좌등록</button>
		</div>        
		</div>
<div style="clear:both;"></div>

<div class="d-flex justify-content-center align-items-center" style="margin:3px 0px;">
	<div class="d-flex justify-content-between" style="width:100%; max-width:800px; margin-bottom:30px;">
		<div class="float-start" style="width:33%;">
			<button type="submit" class="btn s-btn" style="width:100%; padding:16.5px; margin:10px 0px;">회원정보수정</button>
		</div>
		<div class="float-start" style="width:33%;">
			<button type="button" class="btn"  style="width:100%; padding:16.5px; margin:10px 0px;" onClick="history.back()">취소</button>
		</div>
		<div class="float-start" style="width:33%">
		<form name="delete_member" method="post">
			<input type="hidden" name="member_id" value="${memberInfo.id}">
			<button type="button" class="btn" style="width:100%; padding:16.5px; margin:10px 0px;" onclick="javascript:submitDeleteMember()">회원탈퇴</button>
		</form>
		</div>
	</div>
</div> 
</div>
	<div class="col-1 col-lg-3" style="margin-bottom:50px;"></div>
</div>
</div>
</form>
<%@include file="../mall_client/mall_index_bottom.jsp" %>
