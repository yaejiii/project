<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../mall_client/mall_index_top.jsp" %>

<form name = "nonmember_order">
	<input type = "hidden" name = "product_num" id = "product_num" value = "">
	<c:forEach var = "product_num" items="${ product_num_array }">
		<input type = "hidden" name = "product_num_array[]" id = "product_num_array" value = "${ product_num }">
	</c:forEach>
</form>
					
<div class="container-fluid" style="width:80%; margin-top:30px;">
	<div class="row" style=" justify-content: center; flex-wrap: nowrap;">
		<div class="col-1 col-lg-3"></div>
		
		<div class="col-10 col-lg-6" style="width:100%; max-width:800px; text-align:center;">
			<h2>주문서 작성</h2>
			
			<form name="order_nonmember" action="order_payment.do" method="post">
				<div style="margin:30px 0px;">
					<p style="font-weight:bold; font-size:12px; text-align:left">
						배송지
					</p>
				</div>
				
				<div style="margin:3px 0px;">
					<p style="font-size:12px; text-align:left">
						받는 사람
					</p>
					
					<input class="input" id="buyer_name" name="buyer_name" placeholder="성명"
							style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px;">
				</div>
				
				<p style="font-size:12px; text-align:left">
					주소
				</p>
				
				<div class="d-flex justify-content-center align-items-center" style="margin:3px 0px;">
					<div class="align-self-between" style="width:100%; max-width:800px;">
						<div class="float-start" style="width:68%;">
							<input id="postcode" name="buyer_postcode" readonly
									style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px;">
						</div>
						
						<div class="float-start" style="width:4%"></div>
						
						<div class="float-end" style="width:28%">
							<input type="button" onclick="execDaumPostcode()" value="우편번호"
									style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px;">
						</div>
					</div>
				</div>
				
				<div style="margin:3px 0px;">
					<input id="address" name="buyer_addr" class="input" placeholder="기본주소" readonly
							style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px;">
				</div>
				
				<div style="margin:3px 0px;">
					<input id="detail_address" class="input" placeholder="나머지주소"
							style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px;">
				</div>
				
				<p style="font-size:12px; text-align:left">
					전화번호
				</p>
				
				<div class="d-flex justify-content-between align-items-center" style="margin:3px 0px;">
					<div style="width:30%">
						<select id="selbox" name="hp1"
								style="border-radius:0; border: black solid 1px; width:100%; padding:12px; margin:10px 0px;">
							<option value="">-선택하세요-</option>
							<option selected="selected" value = "010">010</option>
							<option value = "011">011</option>
							<option value = "016">016</option>
							<option value = "017">017</option>
							<option value = "018">018</option>
							<option value = "019">019</option>
							<option value = "direct">직접입력</option>
						</select>
						
						<input type="text" id="selboxDirect" name="hp1_direct" style="width:100%"/>
					</div>
					
					<div> - </div>
					
					<div style="width:30%"> 
						<input id="hp2" name="hp2" class="input"
								style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px;"> 
					</div>
					
					<div> - </div>
					
					<div style="width:30%">
						<input id="hp3" name="hp3" class="input"
								style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px;">
					</div>
				</div>
				
				<div style="clear: both;">
					<p style="font-size:12px; text-align:left">
						이메일
					</p>
				</div>
				
				<div class="d-flex justify-content-between align-items-center" style="margin:3px 0px;">
					<div style="width:48%;">
						<input id="email_id" name="email_id"
								style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px;">
					</div>
					
					<div style="width:4%">@</div>
					
					<div style="width:48%">
						<input id="email_add" name="email_add" class="input" style="width:100%">
					</div>
				</div>
				
				<p style="text-align:left; margin-top:30px;">
					<strong>
						비회원 주문조회 비밀번호
					</strong>
				</p>
				
				<div style="margin:3px 0px;">
					<input type="password" id="non_member_pwd" name="member_pwd" class="input" placeholder="비밀번호*" onkeyup="pwdCheck1(this.value)"
							style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px;">
							
					<p id = "pwd_check1" style="text-align: left;">
						주문조회 시 필요합니다. (영문대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)
					</p>
				</div>
				
				<div style="margin:3px 0px;">
					<input type="password" id = "non_member_pwd_check" name="member_pwd_check" placeholder="비밀번호 확인*" onkeyup="pwdCheck2(this.value)"
							style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px;">
							
					<br>
					
					<span id = "pwd_check"></span>
					
					<input type = "hidden" name = "isPwdCheck">
				</div>
			</form>
			
			<div style="padding: 10px 0px; text-align: left;">
				<strong>주문상품</strong>
			</div>
			
			<div>
				<hr>
			</div>
			
			<!-- 바로 구매인 경우 -->
			<c:if test="${ mode eq 'now' }">
			<input type="hidden" id="name" value="${ productDTO.product_name }">
			
				<c:set var = "total_price" value = "${ (productDTO.product_pqty * productDTO.product_price) + total_price }" />
					<fmt:formatNumber value = "${ productDTO.product_price * 0.2 }" pattern="###,###" var="cal"/>
					<fmt:parseNumber var = "discount" value = "${ cal }"/>
					<c:set var = "total_sale_price" value = "${ (productDTO.product_pqty * discount) + total_sale_price }" />	
	
				<div style="position: relative">
					<div class="float-start">
						<a href="mall_product_content.ezenat?product_num=${productDTO.product_num}">
							<img src="resources/product_images/${productDTO.product_image1}" width="90px" height="108px">
						</a>
					</div>
					
					<div class="float-start">
						<ul style="padding:5px;">
							<li style="padding:5px 0px; text-align: left;">
								${productDTO.product_name}
							</li>
							
							<li style=" text-align: left;">
								[옵션 : ${productDTO.product_size}]
							</li>
							
							<li style="padding:5px 0px; text-align: left;">
								수량 : ${productDTO.product_pqty}개
							</li>
							
							<li style=" text-align: left;">
								할인 금액 : -
								
								<fmt:formatNumber value="${ total_sale_price }" pattern="###,###"/>원
							</li>
							
							<li style="padding:10px 0px; text-align: left;">
								<strong>
									<fmt:formatNumber value="${(productDTO.product_price * (1 - 0.2)) * productDTO.product_pqty}" pattern="###,###"/>원
								</strong>
							</li>
						</ul>
					</div>
					
					<div class="float-end" style="position: absolute; top: 50%; right: 0; transform: translate(0, -50%)">
						<button onclick="delete_product('${ mode }','${ productDTO.product_num }')" 
								style="width: 40px; height:40px; border:0px; background-color:transparent;">
							<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
								<path d="M4.646 4.646a.5.5 0 0
										 1 .708 0L8 7.293l2.646-2.647a.5.5
										 0 0 1 .708.708L8.707
										 8l2.647 2.646a.5.5 0 0
										 1-.708.708L8 8.707l-2.646 2.647a.5.5 0
										 0 1-.708-.708L7.293 8 4.646
										 5.354a.5.5 0 0 1
										 0-.708z"/>
							</svg>
						</button>
					</div>
					
					<div style="clear: both;"></div>
				</div>
				
				<div>
					<hr>
				</div>
			</c:if>
			<!-- // 바로 구매인 경우 -->
			
			<!-- 선택 구매인 경우 -->
			<c:if test="${ mode eq 'select' }">
			
				<c:forEach var="productDTO" items="${ productList }" varStatus="status">
					<c:if test="${status.first}">
						<input type="hidden" id="name" value="${ productDTO.product_name }">
					</c:if>
					<c:set var = "total_price" value = "${ (productDTO.product_pqty * productDTO.product_price) + total_price }" />
					<fmt:formatNumber value = "${ productDTO.product_price * 0.2 }" pattern="###,###" var="cal"/>
					<fmt:parseNumber var = "discount" value = "${ cal }"/>
					<c:set var = "total_sale_price" value = "${ (productDTO.product_pqty * discount) + total_sale_price }" />	
		
					<div style="position: relative">
						<div class="float-start">
							<a href="mall_product_content.ezenat?product_num=${productDTO.product_num}">
								<img src="resources/product_images/${productDTO.product_image1}" width="90px" height="108px">
							</a>
						</div>
						
						<div class="float-start">
							<ul style="padding:5px;">
								<li style="padding:5px 0px; text-align: left;">
									${productDTO.product_name}
								</li>
								
								<li style=" text-align: left;">
									[옵션 : ${productDTO.product_size}]
								</li>
								
								<li style="padding:5px 0px; text-align: left;">
									수량 : ${productDTO.product_pqty}개
								</li>
								
								<li style=" text-align: left;">
									할인 금액 : -
									
									<fmt:formatNumber value="${ total_sale_price }" pattern="###,###"/>원
								</li>
								
								<li style="padding:10px 0px; text-align: left;">
									<strong>
										<fmt:formatNumber value="${(productDTO.product_price * (1 - 0.2)) * productDTO.product_pqty}" pattern="###,###"/>원
									</strong>
								</li>
							</ul>
						</div>
						
						<div class="float-end" style="position: absolute; top: 50%; right: 0; transform: translate(0, -50%)">
							<button onclick="delete_product('${ mode }','${ productDTO.product_num }')" 
									style="width: 40px; height:40px; border:0px; background-color:transparent;">
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
									<path d="M4.646 4.646a.5.5 0 0
											 1 .708 0L8 7.293l2.646-2.647a.5.5
											 0 0 1 .708.708L8.707
											 8l2.647 2.646a.5.5 0 0
											 1-.708.708L8 8.707l-2.646 2.647a.5.5 0
											 0 1-.708-.708L7.293 8 4.646
											 5.354a.5.5 0 0 1
											 0-.708z"/>
								</svg>
							</button>
						</div>
						
						<div style="clear: both;"></div>
					</div>
				
					<div>
						<hr>
					</div>
				</c:forEach>
				
			</c:if>
			<!-- // 선택 구매인 경우 -->
			
			<!-- 전체 구매인 경우 -->
			<c:if test="${ mode eq 'all' }">
			
				<c:forEach var="productDTO" items="${ cart.listCart }">
					<c:if test="${status.first}">
						<input type="hidden" id="name" value="${ productDTO.product_name }">
					</c:if>
					<c:set var = "total_price" value = "${ (productDTO.product_pqty * productDTO.product_price) + total_price }" />
					<fmt:formatNumber value = "${ productDTO.product_price * 0.2 }" pattern="###,###" var="cal"/>
					<fmt:parseNumber var = "discount" value = "${ cal }"/>
					<c:set var = "total_sale_price" value = "${ (productDTO.product_pqty * discount) + total_sale_price }" />	
		
					<div style="position: relative">
						<div class="float-start">
							<a href="mall_product_content.ezenat?product_num=${productDTO.product_num}">
								<img src="resources/product_images/${productDTO.product_image1}" width="90px" height="108px">
							</a>
						</div>
						
						<div class="float-start">
							<ul style="padding:5px;">
								<li style="padding:5px 0px; text-align: left;">
									${productDTO.product_name}
								</li>
								
								<li style=" text-align: left;">
									[옵션 : ${productDTO.product_size}]
								</li>
								
								<li style="padding:5px 0px; text-align: left;">
									수량 : ${productDTO.product_pqty}개
								</li>
								
								<li style=" text-align: left;">
									할인 금액 : -
									
									<fmt:formatNumber value="${ total_sale_price }" pattern="###,###"/>원
								</li>
								
								<li style="padding:10px 0px; text-align: left;">
									<strong>
										<fmt:formatNumber value="${(productDTO.product_price * (1 - 0.2)) * productDTO.product_pqty}" pattern="###,###"/>원
									</strong>
								</li>
							</ul>
						</div>
						
						<div class="float-end" style="position: absolute; top: 50%; right: 0; transform: translate(0, -50%)">
							<button onclick="delete_product('${ mode }','${ productDTO.product_num }')" 
									style="width: 40px; height:40px; border:0px; background-color:transparent;">
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
									<path d="M4.646 4.646a.5.5 0 0
											 1 .708 0L8 7.293l2.646-2.647a.5.5
											 0 0 1 .708.708L8.707
											 8l2.647 2.646a.5.5 0 0
											 1-.708.708L8 8.707l-2.646 2.647a.5.5 0
											 0 1-.708-.708L7.293 8 4.646
											 5.354a.5.5 0 0 1
											 0-.708z"/>
								</svg>
							</button>
						</div>
						
						<div style="clear: both;"></div>
					</div>
					
					<div>
						<hr>
					</div>
				</c:forEach>
				
			</c:if>
			<!-- // 전체 구매인 경우 -->
			
			<div style="padding: 10px 0px; margin-top:40px; text-align: left;">
				<strong>결제정보</strong>
			</div>
			
			<div>
				<div class="float-start">
					주문상품
				</div>
				
				<div class="float-end">
					<fmt:formatNumber value="${total_price}" pattern="###,###"/>원
				</div>
				
				<div style="clear: both;"></div>
				
				<div class="float-start" style="padding:10px 0px;">
					배송비
				</div>
				
				<div class="float-end" style="padding:10px 0px;">
					<c:if test="${total_price < 50000}">
						<c:set var="delivery_price" value="3000"/>
					</c:if>
					
					<c:if test="${total_price > 50000}">
						<c:set var="delivery_price" value="0"/>
					</c:if>
					
					+<fmt:formatNumber value="${delivery_price}" pattern="###,###"/>원
				</div>
				
				<div style="clear: both;"></div>
				
				<div class="float-start">
					할인
				</div>
				
				<div class="float-end">
					-<fmt:formatNumber value="${total_sale_price}" pattern="###,###"/>원
				</div>
				
				<div style="clear: both;"></div>
				
				<div>
					<hr>
				</div>
				
				<div class="float-start">
					최종 결제금액
				</div>
				
				<div class="float-end">
					<fmt:formatNumber value="${ (total_price - total_sale_price) + delivery_price }" pattern="###,###"/>원
				</div>
				
				<input type="hidden" id="amount" name="amount" value="${ (total_price - total_sale_price) + delivery_price }">
				
				<div style="clear: both;"></div>
			</div>
			
			<div style="padding: 10px 0px; margin-top:40px; text-align: left;">
				<strong>결제수단</strong>
			</div>
			
			<div style="padding: 10px 0px; text-align: left;">
				결제수단 선택
			</div>
			
			<div style=" text-align: left;">
				<!-- <input type="radio" name="payment" value="card"> 카드 결제 
				<input type="radio" name="payment" value="phone"> 휴대폰 결제 
				<input type="radio" name="payment" value="vbank"> 에스크로(가상계좌)  -->
				<input type="radio" name="payment" value="kakaopay" checked="checked"> 카카오페이(간편결제) 
				<!-- <input type="radio" name="payment" value="samsung"> 삼성페이 
				<input type="radio" name="payment" value="payco"> 페이코(간편결제)  -->
			</div>
			
			<ul style="text-align:left; padding-bottom:40px; margin:0px;">			
				<li><input type="checkbox" name="all_terms" value="selectall" onclick='selectAll(this)' style="">
					 모든 약관 동의
				</li>
				
				<li><input type="checkbox" name="agree_terms" onclick='checkSelectAll()'>
					 [필수] 쇼핑몰 이용약관 동의
				</li>
				
				<li><input type="checkbox" name="agree_terms" onclick='checkSelectAll()'>
					 [필수] 개인정보 수집 및 이용 동의
				</li>
			</ul>
			
			<div style="margin-bottom:40px;">
				<button type="button" class="btn s-btn" style="width:100%" onclick="requestPay()">
					<fmt:formatNumber value="${(total_price - total_sale_price) + delivery_price}" pattern="###,###"/>원 결제하기
				</button>
			</div>
		</div>
		
		<div class="col-1 col-lg-3"></div>
	</div>
</div>

<form name="goOrderHistory" method="post" action="order_complete.do">
	<input type="hidden" name="order_history_num" value = "">
	<input type="hidden" name="total_price" value="${ (total_price - total_sale_price) + delivery_price }">
	<input type="hidden" name="used_point" value="0">
	<input type="hidden" name="discount" value="${total_sale_price}">
	<input type="hidden" name="delivery_fee" value="${delivery_price}">
	<input type="hidden" name="order_history_password">
	<input type="hidden" name="mode" value = "${ mode }">
	
	<!-- 바로 구매인 경우 -->
	<c:if test="${ mode eq 'now' }">
		<input type="hidden" name="product_num" value="${productDTO.product_num}">
		<input type="hidden" name="order_product_price" value="${productDTO.product_price}">
		<input type="hidden" name="order_product_qty" value="${productDTO.product_pqty}">
	</c:if>
	
	<!-- 선택 구매인 경우 -->
	<c:if test="${ mode eq 'select' }">
		<c:forEach var="productDTO" items="${ productList }">
		 	<input type="hidden" name="product_num" value="${productDTO.product_num}">
			<input type="hidden" name="order_product_price" value="${productDTO.product_price}">
			<input type="hidden" name="order_product_qty" value="${productDTO.product_pqty}">
		</c:forEach>
	</c:if>
	<!-- 전체 구매인 경우 -->
	<c:if test="${ mode eq 'all' }">
		<c:forEach var="productDTO" items="${ cart.listCart }" varStatus="status">
		 	<input type="hidden" name="product_num" value="${productDTO.product_num}">
			<input type="hidden" name="order_product_price" value="${productDTO.product_price}">
			<input type="hidden" name="order_product_qty" value="${productDTO.product_pqty}">
		</c:forEach>
	</c:if>
</form>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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
</script>

<script>
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
	
	function pwdCheck2() {
	
		if (document.order_nonmember.member_pwd.value != document.order_nonmember.member_pwd_check.value) {
			document.getElementById("pwd_check").innerHTML
				= "<p style = 'font-size : 12; text-align:left;'>비밀 번호가 일치하지 않습니다.</p>"
				
			document.isPwdCheck.value = "false"
		} else if (document.order_nonmember.member_pwd.value == document.order_nonmember.member_pwd_check.value) {
			document.getElementById("pwd_check").innerHTML
				= "<p style = 'font-size : 12; text-align:left;'>비밀 번호가 일치합니다.</p>"
			document.isPwdCheck.value = "true"
		}
		
		if (document.member_pwd.order_nonmember.value == "" || document.order_nonmember.member_pwd_check.value == "") {
			document.getElementById("pwd_check").innerHTML = ""
			document.isPwdCheck.value = "false"
		}
	}
	
	function checkSelectAll()  {
	  // 전체 체크박스
	  const checkboxes 
	    = document.querySelectorAll('input[name="agree_terms"]');
	  // 선택된 체크박스
	  const checked 
	    = document.querySelectorAll('input[name="agree_terms"]:checked');
	  // select all 체크박스
	  const selectAll 
	    = document.querySelector('input[name="all_terms"]');
	  
	  if(checkboxes.length === checked.length)  {
		 selectAll.checked = true;
	  }else {
		 selectAll.checked = false;
	  }

	}

	function selectAll(selectAll)  {
	  const checkboxes 
	     = document.getElementsByName('agree_terms');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
	}
		

	$(function(){
		//직접입력 인풋박스 기존에는 숨어있다가
		$("#selboxDirect").hide();
		      
		$("#selbox").change(function() {
			
		    //직접입력을 누를 때 나타남
			if($("#selbox").val() == "direct") {
				$("#selboxDirect").show();
				$("#selbox").hide();
				
			}  else {
				$("#selboxDirect").hide();
			}
		}) 
	});
	
	/* 
	function payment() {
		alert('a');
		document.order_nonmember.submit();
	}*/
	
	function delete_product(mode, product_num) {
		/* 바로 구매 or 전체 구매인 경우 주문서 상품 삭제 */
		if (mode == "now" || mode == "all") {
			Swal.fire({
				icon : "warning",
				
				text : "선택한 상품을 삭제하시겠습니까?",
				
				showCancelButton : true,
				
				confirmButtonText : "삭제",
				
				cancelButtonText : "취소",
				
				cancelButtonColor : "#000000"
			}).then(function(result) {
				if (result.isConfirmed) {
					$.ajax({
						type : "post",
						
						url : "./deleteSingleCart",
						
						data : {
							"product_num" : product_num
						},
						
						success : function(e) {
							if (mode == "now") {
								location.href = "./mall_client_cart.ezenat"
								
							} else if (mode == "all") {
								if (e == "emptyCart") {
									location.href = "./mall_client_cart.ezenat"
									
								} else if (e == "") {
									location.reload()
								}
							}
						},
						
						error : function(e) {
							alert("실패")
						}
					})
				}
			})
		}
		/* // 바로 구매 or 전체 구매인 경우 주문서 상품 삭제 */
		
		/* 선택 구매인 경우 주문서 상품 삭제 */
		if (mode == "select") {
			Swal.fire({
				icon : "warning",
				
				text : "선택한 상품을 삭제하시겠습니까?",
				
				showCancelButton : true,
				
				confirmButtonText : "삭제",
				
				cancelButtonText : "취소",
				
				cancelButtonColor : "#000000"
			}).then(function(result) {
				if (result.isConfirmed) {
					$("#product_num").val(product_num)
					document.nonmember_order.action = "./deleteSelectOrder"
					document.nonmember_order.submit()
				}
			})
		}
		/* // 선택 구매인 경우 주문서 상품 삭제 */
	}
</script>

<!-- 결제 API -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript">
	var IMP = window.IMP; // 생략 가능
	IMP.init("imp64676617"); // 예: imp00000000a
	
	function requestPay() {
	    if ($('#buyer_name').val() == "") {
	    	alert("받는 분의 성함을 입력해주세요.")
	    	$('#buyer_name').focus()
	    	
	    	return
	    }
	    
	    if ($('#postcode').val() == "" || $('#address').val() == "") {
	    	alert("주소를 입력해주세요.")
	    	$('#detail_address').focus()
	    	
	    	return
	    }
	    
	    if ($('#detail_address').val() == "") {
	    	alert("상세 주소를 입력해주세요.")
	    	$('#detail_address').focus()
	    	
	    	return
	    }
	    
	    if ($('#selbox').val() == "" || $('#hp2').val() == "" || $('#hp3').val() == "") {
	    	alert("전화번호를 입력해주세요.")
	    	$('#hp3').focus()
	    	
	    	return
	    }
	    
	    if ($('#email_id').val() == "" || $('#email_add').val() == "") {
	    	alert("이메일을 입력해주세요.")
	    	$('#email_add').focus()
	    	
	    	return
	    }
	    
	    if ($('#non_member_pwd').val() == "") {
	    	alert("비회원 주문조회에 사용될 비밀번호를 입력해주세요.")
	    	$('#non_member_pwd').focus()
	    	
	    	return
	    }
	    
	    if ($('#non_member_pwd_check').val() == "") {
	    	alert("비밀번호 확인란을 입력해주세요.")
	    	$('#non_member_pwd_check').focus()
	    	
	    	return
	    }

	    var payment = document.getElementsByName('payment');
	    var pay_method = ""
		for (var i = 0; i < payment.length; i++) {
			if (payment[i].checked) {
				pay_method = payment[i].value;
			}
		}
	    
		$.ajax({
			type : 'post',
			
			url : './order_payment.do',
			
			data : {
					"pay_method" : pay_method,
					"name" : $('#name').val(),
					"amount" : $('#amount').val(),
					"email_id" : $('#email_id').val(),
					"email_add" : $('#email_add').val(),
					"buyer_name" : $('#buyer_name').val(),
					"buyer_addr" : $('#address').val(),
					"hp1" : $('#selbox').val(),
					"hp2" : $('#hp2').val(),
					"hp3" : $('#hp3').val(),
					"hp1_direct" : $('#selboxDirect').val(),
					"buyer_postcode" : $('#postcode').val()
			},
			
			success : function(dto) {
				IMP.request_pay({
					pg: dto.pg,
					pay_method: dto.pay_method,
					merchant_uid: dto.merchant_uid,		// 주문번호
					name: dto.name,
					amount: dto.amount,					// 숫자 타입
					buyer_email: dto.buyer_email,
					buyer_name: dto.buyer_name,
					buyer_tel: dto.buyer_tel,
					buyer_addr: dto.buyer_addr,
					buyer_postcode: dto.buyer_postcode,
					m_redirect_url: dto.redirect_url
				}, function(rsp) {
					 if (rsp.success) { 
						document.goOrderHistory.order_history_num.value = dto.merchant_uid;
						document.goOrderHistory.order_history_password.value = document.getElementById('non_member_pwd').value;
						document.goOrderHistory.submit()
				
					 } else {
						Swal.fire({
							icon : "warning",
							
							text : "결제가 취소되었습니다.",
							
							allowOutsideClick : false
						}).then(function(result) {
							if (result.isConfirmed) {
								location.reload()
							}
						})
					} 
				})
			},
			
	 		error : function(e){
	 			alert("실패")
	 		}
		})
	}
</script>

<%@include file="../mall_client/mall_index_bottom.jsp" %>
