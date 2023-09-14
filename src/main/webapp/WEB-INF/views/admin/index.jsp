<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
  <head>
    <meta charset="utf-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>관리자 페이지 로그</title>
    
</head>
<body>
<div class="container-fluid" style="width:80%; margin-top:30px; margin-bottom:50px;">
	<div class="row">
		<div class="col-1 col-lg-3"></div>
		<div class="col-10 col-lg-6" style="text-align:center; margin-bottom:30px;"> <h2>로그인</h2>
			<form name="login" action="admin_login.do" method="post" onsubmit="return inputCheck()">
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
							<button type="submit" onclick="document.getElementById('login').submit();"  class="btn btn-dark" style="width:100%; padding:16.5px; margin:10px 0px;">로그인</button>
						</div>
					</form>
						<div class="float-start" style="width:4%"></div>
						<div class="float-end" style="width:48%">
							<button type="button" class="btn btn-light" onclick ="location.href='mall_member_join.ezenat'" style="width:100%; padding:16.5px; margin:10px 0px;">회원가입</button>
						</div>
					</div>
				</div>
	
		<div class="col-1 col-lg-3"></div>
	</div>

</body>
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

</html>