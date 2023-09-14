<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../mall_client/mall_index_top.jsp" %>

<form name = "member_order">
	<input type = "hidden" name = "product_num" id = "product_num" value = "">
	<c:forEach var = "product_num" items="${ product_num_array }">
		<input type = "hidden" name = "product_num_array[]" id = "product_num_array" value = "${ product_num }">
	</c:forEach>
</form>

<div class="container-fluid" style="width:80%; margin-top:30px;">
	<div class="row justify-content-center" style="flex-wrap: nowrap;">
		<div class="col-1 col-lg-3"></div>
		
		<div class="col-10 col-lg-6" style="width:100%; max-width:800px; text-align:left;">
			<form id="payment_info">
				<div style="text-align:left; margin:30px 0px;">
					<strong>배송지</strong>
				</div>
				
<!-- 				<a href="#" onclick="showDiv1()">최근 배송지</a> 
				<a href="#" onclick="showDiv2()">직접입력</a>
				
				<div id="recent_address" style="justify-content:start;">
					<div id="address_list"></div>
					
					<div style="padding:20px 0px;">
						${rcv_name}수신인
						
						<div class="float-end">
							<button type="button" class="btn" onclick="openAddressList()">
								배송지 목록
							</button>
						</div>
					</div>
					
					<div style="padding:5px 0px;">
						[${zip_code}우편번호] ${address}기본주소 ${address_detail}상세주소
					</div>
					
					<div style="padding:5px 0px;">
						${rcv_hp1}-${rcv_hp2}-${rcv_hp3} 받는사람 전화번호
					</div>
					
					<div style="padding:5px 0px;">
						<select id="selbox1" name="rcv_message" style="padding:10px; width:100%;" class="input">
							<option value="">--메세지 선택 (선택사항)--</option>
							<option value="배송 전에 미리 연락 바랍니다.">배송 전에 미리 연락 바랍니다.</option>
							<option value="부재 시 경비실에 맡겨주세요.">부재 시 경비실에 맡겨주세요.</option>
							<option value="부재 시 문 앞에 놓아주세요.">부재 시 문 앞에 놓아주세요.</option>
							<option value="빠른 배송 부탁드립니다.">빠른 배송 부탁드립니다.</option>
							<option value="택배함에 보관해주세요.">택배함에 보관해주세요.</option>
							<option value="direct">직접 입력</option>
						</select>
						
						<input type="text" id="selboxDirect1" name="selboxDirect1" class="input" style="width:100%;">
					</div>
				</div>
-->				
				<div id="write_address" style="display:block; padding:20px 0px;">
					<input type="radio" name="address" value="member_address" id="radio1" onclick="toggleDiv()" checked> 회원 정보와 동일 
					<input type="radio" name="address" value="new_address" id="radio2" onclick="toggleDiv()"> 새로운 배송지
				
					<div id="select_member_address">
						<div style="margin: 3px 0px;">
							<input class="input" id = "member_name" value="${ memInfo.name }" placeholder="성명"
									style="border-radius: 0; border: black solid 1px; width: 100%; padding: 10px; margin: 10px 0px;">
						</div>
						
						<div class="d-flex justify-content-center align-items-center" style="margin: 3px 0px;">
							<div class="align-self-between" style="width: 100%;">
								<div class="float-start" style="width: 68%;">
									<input id="postcode" value="${ memInfo.postal_code }" placeholder="주소" readonly="readonly"
											style="border-radius: 0; border: black solid 1px; width: 100%; padding: 10px; margin: 10px 0px;">
								</div>
								
								<div class="float-start" style="width: 4%"></div>
								
								<div class="float-end" style="width: 28%">
									<input type="button" value="우편번호" onclick="execDaumPostcode()"
											style="border-radius: 0; border: black solid 1px; width: 100%; padding: 10px; margin: 10px 0px;">
								</div>
							</div>
						</div>
						
						<div style="margin: 3px 0px;">
							<input id="address" class="input" value="${ memInfo.address }" placeholder="기본주소" readonly="readonly"
									style="border-radius: 0; border: black solid 1px; width: 100%; padding: 10px; margin: 10px 0px;">
						</div>
						
						<div style="margin: 3px 0px;">
							<input id="detail_address" class="input" value="${ memInfo.detail_address }" placeholder="나머지주소"
									style="border-radius: 0; border: black solid 1px; width: 100%; padding: 10px; margin: 10px 0px;">
						</div>
						
						<div class="d-flex justify-content-between align-items-center" style="margin: 3px 0px;">
							<select id="selbox" style="border-radius: 0; border: black solid 1px; width: 100%; padding: 12px; margin: 10px 0px;">
								<c:if test="${ memInfo.hp1 == 010}">
									<option selected="selected" value = "${ memInfo.hp1 }">${ memInfo.hp1 }</option>
									<option value = "011">011</option>
									<option value = "016">016</option>
									<option value = "017">017</option>
									<option value = "018">018</option>
									<option value = "019">019</option>
								</c:if>
								
								<c:if test="${ memInfo.hp1 == 011}">
									<option selected="selected" value = "${ memInfo.hp1 }">${ memInfo.hp1 }</option>
									<option value = "010">010</option>
									<option value = "016">016</option>
									<option value = "017">017</option>
									<option value = "018">018</option>
									<option value = "019">019</option>
								</c:if>
								
								<c:if test="${ memInfo.hp1 == 016}">
									<option selected="selected" value = "${ memInfo.hp1 }">${ memInfo.hp1 }</option>
									<option value = "011">010</option>
									<option value = "016">011</option>
									<option value = "017">017</option>
									<option value = "018">018</option>
									<option value = "019">019</option>
								</c:if>
								
								<c:if test="${ memInfo.hp1 == 017}">
									<option selected="selected" value = "${ memInfo.hp1 }">${ memInfo.hp1 }</option>
									<option value = "011">010</option>
									<option value = "016">011</option>
									<option value = "017">016</option>
									<option value = "018">018</option>
									<option value = "019">019</option>
								</c:if>
								
								<c:if test="${ memInfo.hp1 == 018}">
									<option selected="selected" value = "${ memInfo.hp1 }">${ memInfo.hp1 }</option>
									<option value = "011">010</option>
									<option value = "016">011</option>
									<option value = "017">016</option>
									<option value = "018">017</option>
									<option value = "019">019</option>
								</c:if>
								
								<c:if test="${ memInfo.hp1 == 019}">
									<option selected="selected" value = "${ memInfo.hp1 }">${ memInfo.hp1 }</option>
									<option value = "011">010</option>
									<option value = "016">011</option>
									<option value = "017">016</option>
									<option value = "018">017</option>
									<option value = "019">018</option>
								</c:if>
								<option value = "direct">직접입력</option>
							</select>
							<input type="text" id="selboxDirect" name="hp1_direct" style="width:100%"/>
							
							 - 
							
							<input class="input" id="hp2" placeholder="휴대전화"  value="${ memInfo.hp2 }"
									style="border-radius: 0; border: black solid 1px; width: 100%; padding: 10px; margin: 10px 0px;">
							
							 - 
							 
							<input class="input" id="hp3" value="${ memInfo.hp3 }"
									style="border-radius: 0; border: black solid 1px; width: 100%; padding: 10px; margin: 10px 0px;">
						</div>
						
						<div style="padding:5px 0px;">
							<select id="selbox2" name="rcv_message" style="padding:10px; width:100%;" class="input">
								<option value="">--메세지 선택 (선택사항)--</option>
								<option value="배송 전에 미리 연락 바랍니다.">배송 전에 미리 연락 바랍니다.</option>
								<option value="부재 시 경비실에 맡겨주세요.">부재 시 경비실에 맡겨주세요.</option>
								<option value="부재 시 문 앞에 놓아주세요.">부재 시 문 앞에 놓아주세요.</option>
								<option value="빠른 배송 부탁드립니다.">빠른 배송 부탁드립니다.</option>
								<option value="택배함에 보관해주세요.">택배함에 보관해주세요.</option>
								<option value="direct">직접 입력</option>
							</select>
							
							<input type="text" id="selboxDirect2" name="selboxDirect2" class="input"/>
						</div>
					</div>
					
					<div id="select_new_address" style="display:none;">
						<div style="margin: 3px 0px;">
							<input class="input" id="buyer_name" placeholder="성명"
									style="border-radius: 0; border: black solid 1px; width: 100%; padding: 10px; margin: 10px 0px;">
						</div>
						
						<div class="d-flex justify-content-center align-items-center"
								style="margin: 3px 0px;">
							<div class="align-self-between" style="width: 100%;">
								<div class="float-start" style="width: 68%;">
									<input id="postcode" placeholder="주소" readonly
											style="border-radius: 0; border: black solid 1px; width: 100%; padding: 10px; margin: 10px 0px;">
								</div>
								
								<div class="float-start" style="width: 4%"></div>
								
								<div class="float-end" style="width: 28%">
									<input type="button" value="우편번호" onclick="execDaumPostcode()"
											style="border-radius: 0; border: black solid 1px; width: 100%; padding: 10px; margin: 10px 0px;">
								</div>
							</div>
						</div>
						
						<div style="margin: 3px 0px;">
							<input id="address" class="input" placeholder="기본주소" readonly
									style="border-radius: 0; border: black solid 1px; width: 100%; padding: 10px; margin: 10px 0px;">
						</div>
						
						<div style="margin: 3px 0px;">
							<input id="detail_address" class="input" placeholder="나머지주소"
									style="border-radius: 0; border: black solid 1px; width: 100%; padding: 10px; margin: 10px 0px;">
						</div>
								
						<div class="d-flex justify-content-between align-items-center" style="margin: 3px 0px;">
							<select style="border-radius: 0; border: black solid 1px; width: 100%; padding: 12px; margin: 10px 0px;">
								<option>010</option>
							</select>
							
							 - 
							
							<input class="input" placeholder="휴대전화" style="border-radius: 0; border: black solid 1px; width: 100%; padding: 10px; margin: 10px 0px;" >
							
							 - 
							
							<input class="input" style="border-radius: 0; border: black solid 1px; width: 100%; padding: 10px; margin: 10px 0px;">
						</div>
						
						<div style="padding:5px 0px;">
							<select id="selbox3" name="rcv_message" style="padding:10px; width:100%;" class="input">
								<option value="">--메세지 선택 (선택사항)--</option>
								<option value="배송 전에 미리 연락 바랍니다.">배송 전에 미리 연락 바랍니다.</option>
								<option value="부재 시 경비실에 맡겨주세요.">부재 시 경비실에 맡겨주세요.</option>
								<option value="부재 시 문 앞에 놓아주세요.">부재 시 문 앞에 놓아주세요.</option>
								<option value="빠른 배송 부탁드립니다.">빠른 배송 부탁드립니다.</option>
								<option value="택배함에 보관해주세요.">택배함에 보관해주세요.</option>
								<option value="direct">직접 입력</option>
							</select>
							
							<input type="text" id="selboxDirect3" name="selboxDirect3" class="input"/>
						</div>
					</div>
				</div>
				
				<div style="padding: 10px 0px;">
					<strong>주문상품</strong>
				</div>
				
				<div>
					<hr>
				</div>
				
				<%-- <c:forEach var="dto" items="product"> --%>		
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
							<button onclick="delete_product('${ mode }','${ productDTO.product_num }')" type = "button"
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
								<button onclick="delete_product('${ mode }','${ productDTO.product_num }')" type = "button"
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
								<button onclick="delete_product('${ mode }','${ productDTO.product_num }')" type = "button"
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
				<%--</c:forEach> --%>
				
				<%-- <div style="padding: 10px 0px;">
					<strong>할인/부가결제</strong>
				</div>
				
				<div style="padding: 10px 0px;">
					<strong>적립금</strong>
				</div>
				
				<div>
					<input name="used_point" id="used_point" style="padding:10px; width: 80%;" class="input">
					
					<button type="button" onclick="javascript:use_point()" class="btn" style="padding:14px 0px; width:19%;">
						적립금 적용
					</button>
				</div>
				
				<div style="padding:5px 0px;">
					<span id="usable_point">
						사용 가능한 적립금 : ${ memInfo.point } Point
					</span>
				</div>
				
				<div>
					<hr>
				</div>
				
				<div style="padding-bottom: 10px;">
					<strong>쿠폰</strong>
				</div>
				
				<div>
					<select name="used_coupon" style="padding:10px; width: 80%;" class="input">
						<option value="">
							사용할 쿠폰을 선택해주세요.
						</option>
						
						<c:forEach var="coupon" items="list_coupon">
							<option value="${coupon_num}">
								${coupon_name}쿠폰 이름
							</option>
						</c:forEach>
					</select>
					
					<button type="button" onclick="use_coupon()" class="btn" style="padding:14px 0px; width:19%;">
						쿠폰 적용
					</button>
				</div>
				
				<div>
					<hr>
				</div> --%>
				
								<input type="hidden" id="amount" name="amount" value="${ (total_price - total_sale_price) + delivery_price }">
				
				
				<div style="padding: 10px 0px; margin-top:40px;">
					<strong>결제정보</strong>
				</div>
				
				<div>
					<div class="float-start">주문상품</div>
					
					<div class="float-end">
						<fmt:formatNumber value="${ total_price }" pattern="###,###"/>원
					</div>
					
					<div style="clear: both;"></div>
					
					<div class="float-start" style="padding:10px 0px;">배송비</div>
					
					<div class="float-end" style="padding:10px 0px;">
						<c:if test="${total_price < 50000}">
							<c:set var="delivery_price" value="3000"/>
						</c:if>
						
						<c:if test="${total_price > 50000}">
							<c:set var="delivery_price" value="0"/>
						</c:if>
						
						+<fmt:formatNumber value="${ delivery_price }" pattern="###,###"/>원
					</div>
					
					<div style="clear: both;"></div>
					
					<div class="float-start">할인</div>
					
					<div class="float-end">
						-<fmt:formatNumber value="${ total_sale_price }" pattern="###,###" />원
					</div>
					
					<div style="clear: both;"></div>
					
					<div>
						<hr>
					</div>
					
					<div class="float-start">최종 결제금액</div>
					
					<div class="float-end">
						<fmt:formatNumber value="${ (total_price - total_sale_price) + delivery_price }" pattern="###,###" />원
					</div>
					
					<div style="clear: both;"></div>
				</div>
				
				<div style="padding: 10px 0px; margin-top:40px;">
					<strong>결제수단</strong>
				</div>
				
				<div style="padding: 10px 0px;">
					결제수단 선택
				</div>
				
				<div>
<!-- 					<input type="radio" name="payment" value="card"> 카드 결제 
					<input type="radio" name="payment" value="phone"> 휴대폰 결제 
					<input type="radio" name="payment" value="vbank"> 에스크로(가상계좌) 
 -->					<input type="radio" name="payment" value="kakaopay" checked="checked"> 카카오페이(간편결제) 
	<!-- 				<input type="radio" name="payment" value="samsung"> 삼성페이 
					<input type="radio" name="payment" value="payco"> 페이코(간편결제) 
 -->				</div>
				
				<div>
					<input type="checkbox" name="save_payment"> 결제수단과 입력정보를 다음에도 사용
				</div>
				
				<%-- <div style="padding: 10px 0px;">
					<strong>적립혜택</strong>
				</div>
				
				<div class="float-start">
					상품별 적립금 (5%)
				</div>
				
				<div class="float-end">
					<fmt:formatNumber value="${ (total_price - total_sale_price) * 0.05 }" pattern="###,###" />원
				</div>
				
				<div style="clear: both;"></div>
				
				<div class="float-start" style="padding:10px 0px;">
					회원 적립금 (등급별)
				</div>
				
				<div class="float-end" style="padding:10px 0px;">
					<fmt:formatNumber value="${ (total_price - total_sale_price) * 0.02 }" pattern="###,###" />원
				</div>
				
				<div style="clear: both;"></div>
				
				<div>
					<hr>
				</div>
				
				<div class="float-start" style="padding: 10px 0 40px;">
					적립 예정금액
				</div>
				
				<div class="float-end" style="padding: 10px 0 40px;">
					<fmt:formatNumber value="${ ((total_price - total_sale_price) * 0.05) + ((total_price - total_sale_price) * 0.02) }" pattern="###,###" />원
				</div> --%>
				
				<div style="clear: both;"></div>
				
				<input type="hidden" name="member_num" value="${memInfo.member_num}">
				<input type="hidden" name="address_num" value="${address_num}">
				<input type="hidden" id="amount" name="total_price" value="${ (total_price - total_sale_price) + delivery_price }">
				<%-- <input type="hidden" name="member_point" value="${ ((total_price - total_sale_price) * 0.05) + ((total_price - total_sale_price) * 0.02) }"> --%>
				
			</form>
			
			<div style="padding: 40px 0 40px;">
				<button type="button" class="btn s-btn" style="width:100%" onclick="requestPay()">
					<fmt:formatNumber value="${ (total_price - total_sale_price) + delivery_price }" pattern="###,###" />원 결제하기
				</button>
			</div>
		</div>
		
		<div class="col-1 col-lg-3"></div>
	</div>
</div>

<form name="goOrderHistory" method="post" action="order_complete.do">
	<input type="hidden" name="order_history_num">
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
<script type="text/javascript">
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

	function showDiv1() {
		var div1 = document.getElementById("recent_address");
		var div2 = document.getElementById("write_address");
		
		if (div1.style.display === "none") {
			div1.style.display = "block";
			div2.style.display = "none";
			
		} else if (div1.style.display === "block") {
			return; // 아무 작업도 수행하지 않음
		}
	};
	
	function showDiv2() {
		var div1 = document.getElementById("recent_address");
		var div2 = document.getElementById("write_address");
		
		if (div2.style.display === "none") {
			div2.style.display = "block";
			div1.style.display = "none";
			
		} else if (div2.style.display === "block") {
			return;
		}
	};
	
	function toggleDiv() {
		var div1 = document.getElementById("select_member_address");
		var div2 = document.getElementById("select_new_address");
		var radio1 = document.getElementById("radio1");
		
		if (radio1.checked) {
			div1.style.display = "block";
			div2.style.display = "none";
			
		} else {
			div1.style.display = "none";
			div2.style.display = "block";
		}
	}
	
	function showDiv2() {
		var div1 = document.getElementById("recent_address");
		var div2 = document.getElementById("write_address");
		
		if (div2.style.display === "none") {
			div2.style.display = "block";
			div1.style.display = "none";
			
		} else if (div2.style.display === "block") {
			return;
		}
	}
	
	function openAddressList() {
		var div = document.getElementById("address_list");
		
		if (div.style.display === "none") {
			div.style.display = "block"
			
		} else if (div.style.display === "block") {
			div.style.display === "none"
		}
	}
</script>
<script>
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

</script>
<script type="text/javascript">
	$(function selectInputBox(){
		//직접입력 인풋박스 기존에는 숨어있다가
		$("#selboxDirect1").hide();
		
		$("#selbox1").change(function() {
			//직접입력을 누를 때 나타남
			if($("#selbox1").val() == "direct") {
				$("#selboxDirect1").show();
				
			} else {
				$("#selboxDirect1").hide();
			}
		})
	});
	
	$(function selectInputBox(){
		$("#selboxDirect2").hide();
		
		$("#selbox2").change(function() {
			if($("#selbox2").val() == "direct") {
				$("#selboxDirect2").show();
				
			}  else {
				$("#selboxDirect2").hide();
			}
		})
	});
	
	$(function selectInputBox(){
		$("#selboxDirect3").hide();
		
		$("#selbox3").change(function() {
			if($("#selbox3").val() == "direct") {
				$("#selboxDirect3").show();
				
			}  else {
				$("#selboxDirect3").hide();
			}
		})
	});
	
	function use_coupon() {
		alert('coupon')
	}
	
	function use_point(){
		alert('point')
		
		var point = document.getElementById("used_point");
		
		if (point) {
			var spanElement = document.getElementById("usable_point");
			
			spanElement.textContent = "가용 가능한 적립금 : "+ ${memInfo.point}-point +"";
			${discount}+point
		}
	}
</script>

<script type="text/javascript">
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
					document.member_order.action = "./deleteSelectOrder"
					document.member_order.submit()
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
		if ($('#member_name').val() == "") {
	    	alert("받는 분의 성함을 입력해주세요.")
	    	$('#member_name').focus()
	    	
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
    