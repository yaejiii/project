<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "mall_index_top.jsp" %>

<!-- mall_cart.jsp -->
<style>
.client_cart_center {
    width: 100%;
    max-width: 1200px;
    padding: 0 var(--layout-row-gap);
    margin: 0 auto;
    zoom: 1;
}

.title {
    text-align: center;
    padding: 3rem 0;
    text-transform: capitalize;
}

.title > * {
    margin: 0;
    padding: 0;
    text-transform: capitalize;
    color: var(--color) !important;
    font-weight: bold;
}

.shopping_basket {
    padding-bottom: 100px;
    overflow: hidden;
    width: 100%;
}

.shopping_basket .basket_left {
    padding-right: 1rem;
    width: 60%;
}

.shopping_basket .basket_left, .shopping_basket .basket_right {
    float: left;
}

.shopping_basket .order_list {
    margin: 0px 0 -1px;
}

.shopping_basket .order_board {
    table-layout: fixed;
    width: 100%;
}

.shopping_basket .order_board .check_box {
    width: 32px;
}
.client_order_list tr:first-of-type td {
    border-top: var(--border-width) solid var(--border-color);
}
.shopping_basket .order_board td {
    padding: 10px 0;
    text-align: left;
    vertical-align: middle;
    line-height: 1.5;
    position: relative;
}
.client_order_list tr td {
    border-bottom: var(--border-width) solid var(--border-color);
    position: relative;
}

.input_check {
    position: relative;
    width: 24px;
    height: 24px;
    display: inline-block;
    vertical-align: middle;
}

.input_check input[type="checkbox"] {
/*     opacity: 0 !important; */
    opacity: 1 !important;
    position: absolute !important;
    top: 0 !important;
    left: 0 !important;
    width: 100% !important;
    height: 100% !important;
    z-index: 2 !important;
    cursor: pointer;
    padding: 0 !important;
}

.shopping_basket .order_board .thumbnail {
    padding: 15px 15px 15px 0;
    width: 90px;
}

.client_order_list tr:first-of-type td {
    border-top: var(--border-width) solid var(--border-color);
}

.shopping_basket .order_board td {
    padding: 10px 0;
    text-align: left;
    vertical-align: middle;
    line-height: 1.5;
    position: relative;
}

.client_order_list tr td {
    border-bottom: var(--border-width) solid var(--border-color);
    position: relative;
}

.shopping_basket .order_board .thumbnail img {
    width: 100%;
}

.shopping_basket .order_board td.product_info {
    padding-right: 35px;
}

.client_order_list tr:first-of-type td {
    border-top: var(--border-width) solid var(--border-color);
}

.shopping_basket .order_board td {
    padding: 10px 0;
    text-align: left;
    vertical-align: middle;
    line-height: 1.5;
    position: relative;
}

.client_order_list tr td {
    border-bottom: var(--border-width) solid var(--border-color);
    position: relative;
}

.shopping_basket .order_board td.product_info *:not(.btn) {
    color: var(--color);
}

.shopping_basket .order_board td.product_info .product_name_wrap .product_name {
    font-weight: bold;
    position: relative;
}

.shopping_basket .order_board td.product_info .product_name_wrap .product_name > a:first-of-type {
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}

.shopping_basket .order_board .product a {
    display: block;
}

.shopping_basket .order_board td.product_info .product_name_wrap .product_name .basket_remove {
    position: absolute;
    top: 0;
    right: -35px;
    display: block;
    margin-top: 0;
    font-weight: normal;
    text-decoration: underline;
}

.discount {
    text-decoration: line-through;
    font-weight: normal;
}

.displaynone {
    display: none !important;
}

.sale_price, .sale_price * {
    font-weight: normal;
}

.shopping_basket .order_board .product ul {
    padding: 0;
}

.shopping_basket .order_board td.product_info ul.product_order_option {
    width: 100%;
    position: relative;
}

.shopping_basket .order_board td.product_info ul.product_order_option a {
    text-decoration: underline;
}

.shopping_basket .order_board .quantity {
    float: left;
    width: 100%;
    margin-top: 10px;
}

.shopping_basket .order_board .quantity span {
    display: none;
}

.shopping_basket .order_board .quantity fieldset {
    float: left;
    width: 90px;
    height: 30px;
    border: var(--border-width) solid var(--border-color);
    position: relative;
}

.shopping_basket .order_board .quantity fieldset a {
    display: inline-block;
    width: 30px;
    height: 100%;
    border-left: var(--border-width) solid var(--border-color);
}

.shopping_basket .order_board .quantity fieldset a.qty_up
, .shopping_basket .order_board .quantity fieldset a.qty_down {
    position: absolute;
    top: 0;
    right: 0;
}

.shopping_basket .order_board .quantity fieldset a.qty_down {
    right: 30px;
}

.shopping_basket .order_board .quantity fieldset a::before
, .shopping_basket .order_board .quantity fieldset a::after {
    content: '';
    width: 10px;
    height: 1px;
    position: absolute;
    left: 50%;
    top: 50%;
    -webkit-transform: translate(-50%,-50%);
    -ms-transform: translate(-50%,-50%);
    transform: translate(-50%,-50%);
    box-shadow: inset 0 0 0 32px;
}


.shopping_basket .order_board .quantity input {
    width: 28px !important;
    height: 100%;
    text-align: center;
    border: 0;
    padding: 0;
    margin: 0;
}
.shopping_basket .order_board .quantity .qty_up::after {
    height: 10px;
    width: 1px;
}

.shopping_basket .order_selected {
    display: flex;
    align-items: center;
    justify-content: flex-start;
}

.shopping_basket .btn_area {
    margin: 20px 0 40px;
    text-align: right;
    width: 100%;
}

.shopping_basket .order_selected a {
    padding: 8px 10px;
    width: auto;
    font-weight: normal;
    color: var(--color);
    margin-left: 10px !important;
    background-color: transparent;
}

.shopping_basket .basket_right {
    padding-left: 1rem;
    width: 40%;
}

.order_total_summary {
    margin: 0 0 20px 0;
    padding: 20px 0 0 0;
    line-height: 1.5;
    clear: both;
    float: left;
    width: 100%;
    border-top: var(--border-width) solid var(--border-color);
    border-bottom: var(--border-width) solid var(--border-color);
}

.order_total_summary ul {
    float: left;
    width: 100%;
}

.order_total_summary li {
    overflow: hidden;
    padding: 0;
    border-left: 0 !important;
    color: var(--color);
    margin-bottom: 20px;
}

.order_total_summary li strong {
    float: left;
    width: 150px;
    text-align: left;
/*     font-weight: normal; */
    font-weight: none;
}

.order_total_summary li > span {
    float: right;
    padding: 0 0 0 20px;
    text-align: right;
    font-weight: normal;
}

.order_total_summary li.total strong {
    padding: 4px 0 0;
}

.order_total_summary li.total * {
    font-size: 17px;
    font-weight: bold;
}

.order_total_summary li.total span {
    font-size: 20px;
    margin-top: -4px;
    color: var(--color);
}

.shopping_basket .order_total_button {
    position: relative;
    margin: 0 0 40px!important;
    padding: 0;
    width: 100%;
}

.shopping_basket .order_total_button .btn {
    width: 100% !important;
    margin: 0 0 10px 0;
}

.Npay {
	margin: 0 0 10px 0;
	width: 100%;
	display:inline-block;
	text-align: center;
	background-color: #00ca30;
	padding: 7px;
}

.Npay > img {
	width: 54px;
}

.shopping_basket .order_basket_guide {
    padding-top: 0px;
}

.shopping_basket .order_basket_guide h4 {
	font-size: 12px;
    margin-bottom: 10px;
    font-weight: bold;
}

.shopping_basket .order_basket_guide li {
    line-height: 1.8;
    word-break: keep-all;
}

.shopping_basket .order_list_empty p {
    padding: 30px 0;
    text-align: center;
    font-weight: bold;
}
</style>

<div class = "client_cart_wrap">
	<div class = "client_cart_page">
		<div class = "client_cart_center">
			<div class = "title">
			  	<h2 class="subtitle">CART 
			  		<span class = "cart_order_count">
						<c:if test="${ cart.listCartQty < 1 || empty cart }">
							(0)
						</c:if>
						
						<c:if test="${ cart.listCartQty > 0 }">
			  				(${ cart.listCartQty })
			  			</c:if>
			  			
			  			<input type="hidden" id = "cart_size" value = "${ cart.listCartQty }">
			  			<input type="hidden" id = "cart" value = "${ cart }">
					</span>
				</h2>
			</div>
		</div>
		
		<div class = "client_cart_center">
			<div class = "shopping_basket">
				<div class = "basket_left">
				
					<c:if test="${ cart.listCartQty > 0 }">
					
						<c:forEach var="productDTO" items="${ cart.listCart }">
							<c:set var = "total_price" value = "${ (productDTO.product_pqty * productDTO.product_price) + total_price }" />
							<fmt:formatNumber value = "${ productDTO.product_price * 0.2 }" pattern="###,###" var="cal"/>
							<fmt:parseNumber var = "discount" value = "${ cal }"/>
							<c:set var = "total_sale_price" value = "${ (productDTO.product_pqty * discount ) + total_sale_price }" />
						
							<div class = "order_list">
								<table class = "order_board">
									<tbody class = "client_order_list">
										<tr>
											<td class = "check_box">
												<span class = "input_check" style = "margin : 3px 3px 3px 4px;">
													<!-- <input type = "checkbox" id="basket_chk_id_0"
															name = "basket_product_check" style = "margin : 0px;">
													<label for="basket_chk_id_0" class="basket_chk_id_0/"></label> -->
													<input type = "checkbox" id="basket_chk_id_${ productDTO.product_num }"
															name = "basket_product_check" value = "${ productDTO.product_num }" style = "margin : 0px;">
												</span>
											</td>
											
											<td class = "thumbnail">
												<a href = "mall_product_content.ezenat?product_num=${ productDTO.product_num }" target = "_top">
													<img src = "resources/product_images/${ productDTO.product_image1 }"
														onerror = "this.src='//img.echosting.cafe24.com/design/common/error_img.gif';"
														alt = "${ productDTO.product_name }">
												</a>
											</td>
											
											<td class="product_info">
												<div class="product">
													<div class="product_name_wrap">
														<div class="product_name">
															<a href = "mall_product_content.ezenat?product_num=${ productDTO.product_num }" target = "_top">
																${ productDTO.product_name }
																
																<span class = "product-icon"></span>
															</a>
															
															<a href = "javascript:;" onclick = "basket_single_remove(${ productDTO.product_num })"
																class = "basket_remove" target = "_top">
																삭제
															</a>
														</div>
														
														<div class = "price-wrap">
															<div class = "discount">
																<fmt:formatNumber value = "${ productDTO.product_price }" pattern="###,###"/>원
																
																<p class = "displaynone"></p>
															</div>
															
															<div class = " sale_price">
																<fmt:formatNumber value = "${ productDTO.product_price * (1 - 0.2) }" pattern="###,###"/>원
															</div>
														</div>
													</div>
													                                  
													<ul class="product_order_option option">
														<li class="xans-record-">
															<strong class="displaynone">
																웨일 로고 카라 하프 니트 네이비
															</strong>
														
															<span class="product_option">
																[옵션: L]
															</span>
															
															<span class="displaynone">
																(1개)
															</span>
															
															<span class="">
																<a href="#none" onclick="Basket.showOptionChangeLayer('option_modify_layer_0', $(this))"
																	class="option_change displaynone">
																	옵션변경
																</a>
															</span>
														</li>
													</ul>
												</div>
												
												<div class="quantity">
													<span>
														수량
													</span>
													
													<fieldset>
														<a href="javascript:;"
															onclick="basket_qty_updown('down',${ productDTO.product_num },${ productDTO.product_pqty });"
															class="qty_down"></a>
														
														<input id="quantity_id_0" name="quantity_name_0"
																size="2" value="${ productDTO.product_pqty }" type="text" readonly="readonly">
														
														<a href="javascript:;"
															onclick="basket_qty_updown('up',${ productDTO.product_num },${ productDTO.product_pqty });"
															class="qty_up"></a>
													</fieldset>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							
						</c:forEach>
					
						<div class="order_selected btn_area btn_area_1 ">
							<strong class="text">
								선택상품을
							</strong>
							
							<a href="#none" class="btn" onclick="basket_select_remove()">
								삭제하기
							</a>
						</div>
					</c:if>
					
					<c:if test="${ cart.listCartQty < 1 || empty cart }">
						<div class = "order_list_empty">
							<p>장바구니에 추가된 상품이 없습니다.</p>
						</div>
					</c:if>
				</div>	<!-- // left -->

				<div class = "basket_right">
					<div class = "bottom_btn_wrap">
						<c:if test="${ cart.listCartQty > 0 }">
							<div class = "order_total order_total_summary">
								<ul>
									<li class="price">
										<strong>
											상품 합계금액
										</strong>
										
										<span> 
											<span class="total_product_price_display_front">
												<fmt:formatNumber value = "${ total_price }" pattern="###,###"/>
											</span> 원
										</span>
									</li>
									
									<li class="">
										<strong>
											총 할인금액
										</strong>
										
										<span class="discount ">
											<span class="box">
												<span>- 
													<span id="total_product_discount_price_front">
														<fmt:formatNumber value = "${ total_sale_price }" pattern="###,###"/>
													</span> 원
												</span>
											</span>
										</span>
									</li>
									
									<li class="option">
										<strong>
											배송비
										</strong>
										
										<span>+  
											<span id="total_delv_price_front">
												<span class="total_delv_price_front">
													<c:if test="${total_price < 50000}">
														<c:set var="delivery_price" value="3000"/>
													</c:if>
													
													<c:if test="${total_price > 50000}">
														<c:set var="delivery_price" value="0"/>
													</c:if>
													
													<fmt:formatNumber value="${ delivery_price }" pattern="###,###"/>
												</span>
											</span> 원
										</span>
									</li>
									
									<li class="total">
										<strong>
											총 주문합계
										</strong>
										
										<span> 
											<span id="total_order_price_front">
												<fmt:formatNumber value = "${ total_price - total_sale_price }" pattern="###,###"/>
											</span> 원
										</span>
									</li>         
				                </ul>
							</div>
							
							<div class = "order_total btn_area order_total_button">
								<a href="#none" onclick="product_all_empty()" class="btn">
									장바구니 비우기
								</a>
								
								<a href="#none" onclick="product_select_order()" class="btn">
										선택상품 주문하기
								</a>
								<form name = "select_go" method = "post">
									<input type = "hidden" name = "product_num_array[]" id = "product_num_array" value = "">
									<input type = "hidden" name = "mode" id = "mode" value = "">
								</form>
								
								<a href="#none" onclick="product_all_order()" class=" btn s-btn">
										전체상품 주문하기
								</a>
								
								<!-- 네이버 체크아웃 구매 버튼 커스텀 -->
								<a href="#none" class="Npay">
									<img src = "resources/images/Npay_btn.svg">
								</a>
							</div>
						</c:if>
						
						<c:if test="${ cart.listCartQty < 1 || empty cart }">
							<div class = "order_total btn_area order_total_button">
								<a href="#none" onclick="product_all_empty()" class="btn">
									장바구니 비우기
								</a>
								
								<a href="#none" onclick="product_select_order()" class="btn">
										선택상품 주문하기
								</a>
								
								<a href="#none" onclick="product_all_order()" class=" btn s-btn">
										전체상품 주문하기
								</a>
							</div>
						</c:if>
					</div>
					
					<div class = "order_total order_basket_guide">
						<h4>장바구니 이용안내</h4>
						<ul>
							<li>장바구니에 담긴 상품은 7일 동안 보관됩니다.
							<br>
							보관된 상품은 7일 이후에 삭제되오니 장바구니에서 삭제된 경우,
							<br>
							다시 장바구니에 담으시기 바랍니다.</li>
						</ul>
					</div>
				</div>	<!-- // right -->
			</div>	<!-- // shopping basket -->
		</div>
	</div>
</div>

<script type="text/javascript">
	/* 상품 개별 삭제 */
	function basket_single_remove(product_num) {
		Swal.fire({
			icon : "warning",
			
			title : "장바구니 상품 삭제",
			
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
						location.reload()
					},
					
					error : function(e) {
						alert("실패")
					}
				})
			}
		})
	}
	/* // 상품 개별 삭제 */
	
	/* 상품 선택 삭제 */
	function basket_select_remove() {
		var checkList = $("input[name = 'basket_product_check']")
		var product_num_array = new Array()
		
		for (var i = 0; i < checkList.length; ++i) {
			if (checkList[i].checked) {
				product_num_array.push(checkList[i].value)
			}
		}
		
		if (product_num_array.length < 1) {
			Swal.fire({
				icon : "warning",
				
				text : "삭제할 상품을 선택해주세요."
			})
		} else if (product_num_array.length > 0) {
			Swal.fire({
				icon : "warning",
				
				title : "장바구니 상품 삭제",
				
				text : "선택한 상품을 삭제하시겠습니까?",
				
				showCancelButton : true,
				
				confirmButtonText : "삭제",
				
				cancelButtonText : "취소",
				
				cancelButtonColor : "#000000"
			}).then(function(result) {
				if (result.isConfirmed) {
					$.ajax({
						type : "post",
						
						url : "./deleteSelectCart",
						
						data : {
							"product_num_array" : product_num_array
						},
						
						success : function(e) {
							location.reload()
						},
						
						error : function(e) {
							alert("실패")
						}
					})
				}
			})
		}
	}
	/* // 상품 선택 삭제 */
	
	/* 상품 개수 수정 */
	function basket_qty_updown(updown, product_num, product_qty) {
		$.ajax({
			type : "post",
			
			url : "./editCart",
			
			data : {
				"updown" : updown,
				
				"product_num" : product_num,
				
				"product_qty" : product_qty
			},
			
			success : function(e) {
				location.reload()
			},
			
			error : function(e) {
				alert("실패")
			}
		})
	}
	/* // 상품 개수 수정 */
	
	/* 장바구니 비우기 */
	function product_all_empty() {
		/*
		if (${ cart.listCartQty < 1 } == true || ${ empty cart } == true) {}
		위 코드는 실행에 문제는 없지만 이클립스에서 '$' 부분과 empty 부분 등에 오류를 띄움
		또한 실행 결과에서는 el문 안의 저러한 조건들은 boolean 형으로 반환되어 처리됌.
		즉, 위 코드는 if(true == true || false == true) {} 로 처리된다.

		var cart = ${ cart }
		var cart_size = ${ cart.listCartQty }
		
		if (cart_size < 1 || cart == null) {}
		그렇다면 위 코드처럼 변수를 선언한 뒤 값을 받아 조건식으로 처리해보면 어떨까?
		실행 결과, 선언한 변수에 값이 들어가는 것이 보여지기는 하나 문제가 있는 듯 처리가 되지 않는다.
		
		그렇기에 아래 코드처럼 session 값을  sessionStorage를 통해 받아올까 한다.
		var cart = sessionStorage.getItem("cart")
		결과는 null
		
		jsp 부분에 input type = "hidden" 으로 cart 와 cart.size() 를 저장한 후 가져와본다.
		잘 가져오는 듯 하다.
		*/

		var cart = $("#cart").val()
		var cart_size = $("#cart_size").val()
		
		if (cart_size < 1 || cart == null) {
			Swal.fire({
				icon : "warning",
				
				text : "장바구니가 비어있습니다."
			})
		} else if (cart_size > 0) {
			Swal.fire({
				icon : "warning",
				
				title : "장바구니 비우기",
				
				text : "장바구니를 비우시겠습니까?",
				
				showCancelButton : true,
				
				confirmButtonText : "비우기",
				
				cancelButtonText : "취소",
				
				cancelButtonColor : "#000000"
			}).then(function(result) {
				if (result.isConfirmed) {
					$.ajax({
						url : "./deleteAllCart",
						
						success : function(e) {
							location.reload()
						},
						
						error : function(e) {
							alert("실패")
						}
					})
				}
			})
		}
	}
	/* // 장바구니 비우기 */
	
	/* 선택 상품 주문하기 */
	function product_select_order() {
		var checkList = $("input[name = 'basket_product_check']")
		var product_num_array = new Array()

		var cart = $("#cart").val()
		var cart_size = $("#cart_size").val()
		
		if (cart_size < 1 || cart == null) {
			Swal.fire({
				icon : "warning",
				
				text : "장바구니가 비어있습니다."
			})
		} else if (cart_size > 0) {
			for (var i = 0; i < checkList.length; ++i) {
				if (checkList[i].checked) {
					product_num_array.push(checkList[i].value)
				}
			}
			
			if (product_num_array.length < 1) {
				Swal.fire({
					icon : "warning",
					
					text : "주문할 상품을 선택해주세요."
				})
			} else if (product_num_array.length > 0) {
				$("#product_num_array").val(product_num_array)
				$("#mode").val("select")
				document.select_go.action = "./mall_client_order.ezenat"
				document.select_go.submit()
			}
		}
	}
	/* // 선택 상품 주문하기 */
	
	/* 전체 상품 주문하기 */
	function product_all_order() {
		$("#mode").val("all")
		document.select_go.action = "./mall_client_order.ezenat"
		document.select_go.submit()
	}
	/* // 전체 상품 주문하기 */
</script>

<%@ include file = "mall_index_bottom.jsp" %>


