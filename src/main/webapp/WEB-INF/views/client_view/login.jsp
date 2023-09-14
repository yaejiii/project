<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../mall_client/mall_index_top.jsp" %>

<div class="container-fluid" style="width:80%; margin-top:30px; margin-bottom:50px;">
<script>
// 필수입력칸 유효성 검사
function inputCheck() {
	if (document.login.member_id.value == "") {
		alert("아이디를 입력하세요.")
		document.login.member_id.focus()
		
		return false
	}
	
	if (document.login.member_password.value == "") {
		alert("비밀번호를 입력하세요.")
		document.login.member_password.focus()
		
		return false
	}
}
</script>
	<div class="row">
		<div class="col-1 col-lg-3"></div>
		<div class="col-10 col-lg-6" style="text-align:center; margin-bottom:30px;"> <h2>로그인</h2>
			<form name="login" action="mall_client_login.ezenat" method="post" onsubmit="return inputCheck()">
				<div style="margin:3px 0px;">
		        	<input name="member_id" style="border: black solid 1px; width:100%; max-width:500px; padding:10px; margin:10px 0px;" placeholder="아이디">
				</div>
				<div style="margin:3px 0px;">
					<input name="member_password" type="password" style="border: black solid 1px; width:100%; max-width:500px; padding:10px; margin:10px 0px;" placeholder="비밀번호">
				</div>
				<div class="d-flex justify-content-center align-items-center" style="margin:3px 0px; text-align:right;">
					<div class="align-self-center" style="max-width:500px; width:100%;">
						<a href="find_id.do?mode='find_id'"><span>아이디 찾기</a> / <a href="find_id.do?mode='find_pw'">비밀번호 찾기</span></a>
			 		</div>
				</div>
		    
				<div class="d-flex justify-content-center align-items-center" style="margin:3px 0px;">
					<div class="align-self-between" style="width:100%; max-width:500px; margin-bottom:30px;">
						<div class="float-start" style="width:48%;">
							<button type="submit" onclick="document.getElementById('login').submit();"  class="btn s-btn" style="width:100%; padding:16.5px; margin:10px 0px;">로그인</button>
						</div>
					</form>
						<div class="float-start" style="width:4%"></div>
						<div class="float-end" style="width:48%">
							<button type="button" class="btn" onclick ="location.href='mall_member_join.ezenat'" style="width:100%; padding:16.5px; margin:10px 0px;">회원가입</button>
						</div>
					</div>
				</div>

	<div>
		<button  class="btn" style="border-radius:0; border: gray solid 1px; width:100%; max-width:500px; padding:16.5px; margin:10px 0px;"
	 onclick="window.open('naverlogin.do','네이버 로그인','width=430,height=500,location=no,status=no,scrollbars=yes');">
	 		<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
		 viewBox="0 0 10 10" style="enable-background:new 0 0 10 10;" xml:space="preserve" width="14px" height="14px">
			<g>
				<g>
			<polygon points="6.6,0 6.6,4.9 3.4,0 0,0 0,10 3.4,10 3.4,5 6.6,10 10,10 10,0"/>
		</g>
	</g>
	</svg>
		네이버 로그인</button></div>
	<div><button class="btn" style="border-radius:0; border: gray solid 1px; width:100%; max-width:500px; padding:16.5px; margin: 0px;"
	 onclick="window.open('이동할 페이지 주소','카카오 로그인','width=430,height=500,location=no,status=no,scrollbars=yes');">
	<svg version="1.1" id="레이어_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px"
		 y="0px" viewBox="0 0 448.3 413.9" style="enable-background:new 0 0 448.3 413.9;" xml:space="preserve" width="16px" height="16px">
	<g>
		<polygon style="fill:#060303" points="163.6,153.4 148.4,200.7 178.6,200.7 164,153.4 "/>
		<path class="st0" d="M224.1,0L224.1,0C100.3,0,0,79.2,0,177c0,62.9,41.6,118,104,149.5l-21.1,78.9c-0.8,2.4-0.2,5,1.6,6.7
			c1.2,1.2,2.8,1.9,4.5,1.9c1.4-0.1,2.8-0.6,3.9-1.5l91-61.3c13.3,1.9,26.8,2.9,40.3,3c123.8,0,224.1-79.2,224.1-177.1
			S347.9,0,224.1,0z M104.2,233.1c0.2,3.6-1.1,7.1-3.5,9.7c-2.5,2.5-5.9,3.9-9.4,3.7c-3,0.1-5.9-0.9-8.2-2.6
			c-2.3-1.8-3.8-4.4-4.3-7.3c-0.2-1.1-0.3-2.3-0.2-3.4l0.2-84.1H54.1c-3,0.1-6-0.7-8.7-2.2c-2.4-1.4-4-3.8-4.5-6.5
			c-0.2-0.8-0.3-1.6-0.4-2.5c-0.2-3.2,1.3-6.3,3.8-8.3c2.8-2.1,6.1-3.1,9.6-3h74.6c3-0.1,6,0.7,8.6,2.2c2.4,1.4,4,3.8,4.5,6.6
			c0.1,0.8,0.2,1.6,0.2,2.4c0.2,3.2-1.2,6.4-3.7,8.4c-2.8,2-6.1,3.1-9.5,3h-24.4V233.1z M211,243c-2.3,2.3-5.4,3.5-8.6,3.4
			c-5.1,0.6-9.9-2.5-11.6-7.3l-6.7-19.7h-41.5l-6.7,19.7c-1.6,4.9-6.4,8-11.6,7.3c-2.7,0.1-5.4-0.6-7.6-2.2c-2.1-1.7-3.5-4.1-4-6.7
			c-0.2-0.9-0.3-1.8-0.2-2.8c0-1.6,0.2-3.2,0.7-4.7c0.5-1.9,1.1-3.7,1.7-5.6l33.4-92c0.8-2.6,2.4-4.8,4.7-6.3c2.4-1.4,5.1-2,7.9-1.9
			h6.2c2.9-0.1,5.8,0.6,8.4,2c2.7,1.9,4.5,4.7,5.3,7.8l31.2,90.3c0.9,2.3,1.6,4.8,2.1,7.2c0.2,1,0.4,2.1,0.5,3.1
			C214.6,237.9,213.3,240.9,211,243z M297.2,241.3c-2.8,2-6.2,3.1-9.6,3h-54c-3.4,0.2-6.8-0.7-9.7-2.5c-2.7-1.9-4.4-4.8-4.9-8
			c-0.3-1.7-0.5-3.5-0.6-5.3l0.2-90.9c-0.2-3.6,1.1-7.1,3.5-9.7c2.5-2.5,5.9-3.8,9.4-3.7c3-0.1,5.9,0.9,8.3,2.7
			c2.3,1.8,3.8,4.4,4.3,7.3c0.2,1.1,0.3,2.3,0.2,3.4v84.1h43.1c3.1-0.1,6.1,0.7,8.7,2.2c2.3,1.5,4,3.8,4.5,6.6
			c0.2,0.8,0.3,1.6,0.4,2.5C301.2,236.2,299.8,239.3,297.2,241.3z M394,243.4c-2.7,2-6,3.1-9.4,3c-2.2,0.1-4.4-0.4-6.4-1.4
			c-2.1-1.5-3.8-3.4-5.1-5.6l-29.7-47.9l-14.2,14.8l0.1,26.7c0.1,3.6-1.1,7.1-3.5,9.7c-2.5,2.5-5.9,3.8-9.5,3.7
			c-3,0.1-5.9-0.9-8.3-2.6c-2.3-1.8-3.8-4.4-4.3-7.3c-0.2-1.1-0.3-2.3-0.2-3.4l0.1-95.4c-0.1-3.6,1.1-7.1,3.5-9.7
			c2.5-2.5,5.9-3.8,9.4-3.7c3-0.1,5.9,0.9,8.2,2.7c2.3,1.8,3.8,4.4,4.3,7.3c0.2,1.1,0.3,2.3,0.3,3.4v39.1l40.5-46.6
			c1.5-1.7,3.1-3.2,4.9-4.5c1.6-1,3.5-1.5,5.4-1.4c2.8,0,5.5,0.8,7.7,2.4c2.2,1.4,3.8,3.7,4.3,6.3c0,0,0,0.5,0.2,1c0,0.4,0,0.7,0,1.1
			c0,1.7-0.4,3.4-1.2,4.9c-0.9,1.6-1.9,3-3.1,4.3l-26.5,29l31.3,49.7l0.9,1.5c1.6,2.3,2.9,4.8,3.7,7.5c0,0,0,0.4,0.2,0.8
			c0,0.3,0,0.6,0,0.9C398.2,237.2,396.8,240.9,394,243.4z"/>
	</g></svg> 카카오 로그인</button></div>
	<div style="margin-bottom:30px;"><button class="btn" style="border-radius:0; border: gray solid 1px; width:100%;  max-width:500px; padding:16.5px; margin:10px 0px;"
	 onclick="window.open('이동할 페이지 주소','구글 로그인','width=430,height=500,location=no,status=no,scrollbars=yes');">
	
	<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
		 viewBox="0 0 9.881 10.1" style="enable-background:new 0 0 9.881 10.1;" xml:space="preserve" width="14px" height="14px">
	<g>
		<g>
			<path d="M5,4v2c0,0,2,0,2.8,0C7.3,7.3,6.7,8,5,8C3.4,8,2.1,6.7,2.1,5S3.4,2,5,2c0.9,0,1.4,0.3,2,0.7c0.4-0.4,0.4-0.5,1.4-1.5
				C7.5,0.5,6.4,0,5,0C2.3,0,0,2.3,0,5c0,2.8,2.3,5,5,5c4.2,0,5.2-3.6,4.8-6C8.9,4,5,4,5,4z"/>
		</g>
	</g>
	</svg>
	
	
	구글 로그인</button></div>
	
	 <div class="d-flex justify-content-center align-items-center" style="margin:3px 0px;">
	 <div style=" text-align:left; width:100%; max-width:500px;">
	 비회원 주문조회
	 </div>
	 </div>
	 <form name="nonmember_ordered_list" action="nonmember_ordered_list.do">
	 <div style="margin:3px 0px;">
	   <input name="nonmember_name" style="border: black solid 1px; width:100%; max-width:500px; padding:10px; margin:10px 0px;" placeholder="주문자명">
	 </div>
	 <div style="margin:3px 0px;">
	   <input name="purchase_code" style="border: black solid 1px; width:100%; max-width:500px; padding:10px; margin:10px 0px;" placeholder="주문번호">
	 </div>
	 <div style="margin:3px 0px;">
	   <input name="password" style="border: black solid 1px; width:100%; max-width:500px; padding:10px; margin:10px 0px;" placeholder="비회원주문 비밀번호">
	 </div>
		 <div style="margin:3px 0px;">
			<button type="submit" class="btn s-btn" style="width:100%; max-width:500px; padding:16.5px; margin:10px 0px;">주문조회</button>
	</div>
		 <div class="d-flex justify-content-center align-items-center" style="margin:3px 0px;">
			 <div style=" text-align:left; width:100%; max-width:500px;">
				*비회원의 경우, 주문시의 주문번호로 주문조회가 가능합니다.
			 </div>
		</div>
	</form>
	
		</div>
		<div class="col-1 col-lg-3"></div>
	</div>
</div>

<%@include file="../mall_client/mall_index_bottom.jsp" %>
