<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="mall_index_top.jsp" %>

<style>
	.snsArea {
	    width: 100%;
	    float: left;
	    margin: 0 auto;
	}
	
	.snsArea-inner {
	    margin: 0;
	}
	
	.snsArea-inner a {
	    font-weight: bold;
	}
	
	.snsArea-inner .btnNaver {
	    color: #ffffff !important;
		background-color: #00ca30 !important;
	}
	.snsArea-inner .btnNaver {
	    color: #ffffff !important;
		background-color: #00ca30 !important;
	}
	
	.snsArea-inner .btnNaver img {
		filter: invert(100%) sepia(0%) saturate(0%)
				hue-rotate(192deg) brightness(102%) contrast(105%);
	}
	
	.snsArea-inner .btnKakao {
		background-color: #FEE500 !important;
	}
	
	.snsArea-inner .btnGoogle {
	    color: #ffffff !important;
		background-color: #F13F31 !important;
	}
	
	.snsArea-inner .btnGoogle img {
		filter: invert(100%) sepia(0%) saturate(0%)
				hue-rotate(192deg) brightness(102%) contrast(105%);
	}
	
	.snsArea li {
	    float: left;
	    display: block;
	    width: 100%;
	    padding: 0;
	}
	
	.snsArea li a.btn {
	    justify-content: center;
	    align-items: center;
	    padding: 0 1rem;
	    line-height: 44px;
	    letter-spacing: 0;
	    width: 100%;
	    text-align: center;
	    margin-bottom: 10px;
	    margin-right: 0;
	    margin-left: 0;
	    color: #000;
	    background-color: #fff;
	    border-color: var(--sub-border-color);
	}
	
	.snsArea li img {
	    /* height: 16px;
	    position: absolute;
	    top: 16px;
	    left: 35%; */
	    
	    height: 21px;
	    position: absolute;
	    top: 14px;
	    left: 4%;
	    padding-right: 15px;
	    border-right: var(--border-width) solid var(--border-color);
	    border-: 10px;
	}
	
	[class^='btn'] img {
	    margin: -2px 1px 0;
	    vertical-align: middle;
	}
	
	.noMember {
	    float: left;
	    margin-top: 25px;
	    width: 100%;
	}
	
	.noMember p {
	    margin: 20px 0;
	}
	
	.noMember .btn {
	    width: 100%;
	}
</style>

<div class="container-fluid" style="text-align:center; width:80%; margin-top:30px; margin-bottom:50px;">
	<div class="row">
		<div class="col-1 col-lg-3" style = "width:32%;"></div>
		
		<div class="col-10 col-lg-6" style="margin-bottom:30px; max-width: 500px;">
			<h2>로그인</h2>
			
			<form name="login" action="mall_client_login.ezenat" method="post" onsubmit="return inputCheck()">
				<div style="margin:3px 0px;">
		        	<input name="member_id" placeholder="ID"
		        			style="border: black solid 1px; width:100%; max-width:500px; padding:10px; margin:10px 0px;">
				</div>
				
				<div style="margin:3px 0px;">
					<input name="member_password" type="password" placeholder="PW"
							style="border: black solid 1px; width:100%; max-width:500px; padding:10px; margin:10px 0px;">
				</div>
				
				<div class="d-flex justify-content-center align-items-center" style="margin:3px 0px; text-align:right;">
					<div class="align-self-center" style="max-width:500px; width:100%;">
						<span>
							<a href="find_id.do?mode='find_id'">
								아이디 찾기
							</a>
							
							 / 
							 
							<a href="find_id.do?mode='find_pw'">
								비밀번호 찾기
							</a>
						</span>
			 		</div>
				</div>
		    
				<div class="d-flex justify-content-center align-items-center" style="margin:3px 0px;">
					<div class="align-self-between" style="width:100%; max-width:500px; margin-bottom:30px;">
						<div class="float-start" style="width:48%;">
							<button type="submit" class="btn s-btn"
									style="width:100%; padding:16.5px; margin:10px 0px;">
								로그인
							</button>
						</div>
						
						<div class="float-end" style="width:48%">
							<button type="button" class="btn" onclick ="location.href='mall_member_join.ezenat'"
									style="width:100%; padding:16.5px; margin:10px 0px;">
								회원가입
							</button>
						</div>
					</div>
				</div>
			</form>
			
			<div style="text-align:left; ">
				<div class="snsArea ">
					<div class="snsArea-inner">
						<ul>
							<li>
								<a href="#none" class="btn btnNaver " onclick="MemberAction.snsLogin('naver', '%2Findex.html')">
									<img src="resources/images/naver_icon.svg"> 네이버 계정으로 로그인
								</a>
							</li>
							
							<li>
								<!-- <a href="#none" class="btn btnKakao " onclick="MemberAction.kakaosyncLogin('1e942db70ee728223e6d3117ce9e1d0a')"> -->
								<a href="https://kauth.kakao.com/oauth/authorize?client_id=f25838346653fc8e34caa142400e5c89&redirect_uri=http://localhost:8081/ezenat/kakaoLogin&response_type=code"
									class="btn btnKakao ">
									<img src="resources/images/kakao_icon.svg"> 카카오 계정으로 로그인
								</a>
							</li>
								
							<li>
								<!-- <a href="#none" class="btn btnGoogle " onclick="MemberAction.snsLogin('googleplus', '%2Findex.html')"> -->
								<a href="#none" class="btn btnGoogle" id = "btnGoogle">
									<!-- <img src="resources/images/google_icon2.svg"> -->
									<img src="resources/images/google_icon.svg"> 구글 계정으로 로그인
								</a>
							</li>
						</ul>
					</div>
				</div>
				
				<form name = "nonmember_order">
					<input type = "hidden" name = "product_num" value = "${ product_num }">
					<input type = "hidden" name = "product_qty" value = "${ product_qty }">
					<c:forEach var = "product_num" items="${ product_num_array }">
						<input type = "hidden" name = "product_num_array[]" id = "product_num_array" value = "${ product_num }">
					</c:forEach>
					<input type = "hidden" name = "mode" value = "${ mode }">
				</form>
				
				<div id="noMemberWrap" class="noMember ">
	                <h3>비회원 주문</h3>
	                
	                <p>본 쇼핑몰에서는 비회원님도 상품구매가 가능합니다. 단, 비회원 주문시 쇼핑몰에서 제공하는 다양한 회원 혜택에서 제외될 수 있습니다.</p>
	                
	                <a href="#none" onclick = "nonmember_submit('mall_client_order_nonmember.ezenat',this)" class="btn">
	                	비회원 구매
	                </a>
	            </div>
			</div>
		</div>
	</div>
</div>

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
	
	function nonmember_submit(url, position) {
		document.nonmember_order.action = url
		document.nonmember_order.submit()
	}
</script>

<%@include file="mall_index_bottom.jsp"%>