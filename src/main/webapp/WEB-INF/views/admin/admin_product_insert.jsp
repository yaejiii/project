<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- INSERT.JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="admin_top.jsp"%>
<link rel="stylesheet" href="resources/css/admin_product_insert.css?after">


<script type="text/javascript" src="resources/js/admin_product_insert.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
	/* function codeCheck() {

	
		var isCheck = document.getElementById("product_code").value;

		$.ajax({
			url : "./admin_product_codeCheck.do",
			type : "post",
			data : {
				input : isCheck
			},
			cache : false,
			success : function(res) {
				var isSpace = /^[a-zA-Z0-9.s]+$/g;

	

				if (isCheck.match(isSpace) == null) {
					alert("상품코드를 입력하세요.");
					document.getElementById("product_code").focus();
					return false;
				}

				if (res == 0) {
					alert("등록 가능한 상품입니다.")
					document.getElementByid("isCheck").value = "Y";
				} else {
					alert("중복되는 상품이 존재합니다.")
					document.getElementByid("isCheck").focus();

				}

				location.href("admin_product_insert.do")
			},
			error : function() {
				alert("에러")
			}
		});
	} */

	function pNameCheck() {

		//alert("들어왔니");
		var isCheck = document.getElementById("product_name").value;
		/* alert(isCheck) */
		$.ajax({
			url : "./admin_product_pNameCheck.do",
			type : "post",
			data : {
				input : isCheck
			},
			cache : false,
			success : function(res) {
				
				var isSpace = /^(?!\s)[a-zA-Z가-힣0-99\\\s]+$/;

				if (isCheck.match(isSpace) == null) {
					alert("상품명을 제대로 입력하세요.");
					document.getElementById("product_code").focus();
					return false;
				}

				if (res == 0) {
					alert("등록 가능한 상품이름입니다.")
					document.getElementByid("isCheck").value = "Y";
				} else {
					alert("중복되는 상품이름이 존재합니다.")
					document.getElementByid("isCheck").focus();

				}

				location.href("admin_product_insert.do")
			},
			error : function() {
				alert("에러")
			}
		});
	}

	function priceCheck() {

		if (document.f.product_name.value == "") {
			alert("상품명을 입력하세요.")
			document.f.product_name.focus()

			return false
		}

		if (document.f.cost.value == "") {
			alert("공급가를 입력하세요.")
			document.f.cost.focus()

			return false
		}

		if (document.f.price.value == "") {
			alert("판매가를 입력하세요.")
			document.f.price.focus()

			return false
		}

	}

	function applyPrice() {
		var isSpace = /^[0-9]+$/;
		if (document.f.cost.value.match(isSpace) == null) {
			alert("숫자로만 입력이 가능합니다.")
		}
		var cost = document.getElementById("cost").value
		var price = document.getElementById("price").value
		var margin_cal = (price - cost) / price * 100
		var margin = price - cost
		var price_sum = Math.floor(price * 100 / 110)
		var vat = Math.floor(price * 10 / 110)

		document.getElementById("margin_rate").value = margin_cal

		document.getElementById("add_price").value = margin

		document.getElementById("product_price").value = price_sum
		document.getElementById("gwase_price").value = vat

	}
</script>
<form name="f" action="admin_product_insert.do" method="post" enctype="multipart/form-data" onsubmit="return priceCheck()">

	<div class="row" style="margin-left: 80px;">

		<table table class="table table-bordered">
			<thead>
				<tr>
					<th style="border-right: none;">기본 정보</th>
				</tr>
			</thead>
			<!-- 삭제리스트로 들어가는 지 확인 -->
			<input type="hidden" id="isCheck" value="N">
			<tbody>
				<tr>
					<td>상품명</td>

					<td>
						<div style="display: flex; align-items: center; justify-content: left;">
							<input type="text" class="form-control" name="product_name" id="product_name" placeholder="상품명 : 영어 또는 한글(자음,모음만x)만 입력가능하며 공백을 없애고 입력하세요." style="width: 800px;"> 
							<input type="button" onclick="pNameCheck()" class="btn btn-dark" value="중복확인" style="margin-left: 3px;">
						</div>
					</td>

				</tr>
				<tr>
                    <td>카테고리</td>
                    <td>
                        <div class="row cate_wrap">
                            <div class="col-4">
                                대분류 <select class="category1" name="Product_largecategory">

                                    <option value="">전체</option>
                                </select>

                            </div>

                            <div class="col-4">
                                중분류 <select class="category2" name="Product_mediumcategory">
                                    <option value="">전체</option>
                                </select>

                            </div>

                            <div class="col-4">
                                소분류 <select class="category3"name="Product_smallcategory">
                                    <option value="">전체</option>
                                </select>

                            </div>
                        </div>
                    </td>
                </tr>

				<script>
					/*			카테고리			*/
					// 컨트롤러에서 데이터 받기
					var jsonData = JSON.parse('${listCate}');
					console.log(jsonData);

					var cate1Arr = new Array();
					var cate1Obj = new Object();

					// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
					for (var i = 0; i < jsonData.length; i++) {

						if (jsonData[i].category_level == "1") {
							cate1Obj = new Object(); //초기화
							cate1Obj.category_code = jsonData[i].category_code;
							cate1Obj.category_name = jsonData[i].category_name;
							cate1Arr.push(cate1Obj);
						}
					}

					// 1차 분류 셀렉트 박스에 데이터 삽입
					var cate1Select = $("select.category1")

					for (var i = 0; i < cate1Arr.length; i++) {
						cate1Select
								.append("<option value='" + cate1Arr[i].category_code + "'>"
										+ cate1Arr[i].category_name
										+ "</option>");
					}

					$(document)
							.on(
									"change",
									"select.category1",
									function() {

										var cate2Arr = new Array();
										var cate2Obj = new Object();

										// 2차 분류 셀렉트 박스에 삽입할 데이터 준비
										for (var i = 0; i < jsonData.length; i++) {

											if (jsonData[i].category_level == "2") {
												cate2Obj = new Object(); //초기화
												cate2Obj.category_code = jsonData[i].category_code;
												cate2Obj.category_name = jsonData[i].category_name;
												cate2Obj.category_parent = jsonData[i].category_parent;

												cate2Arr.push(cate2Obj);
											}
										}

										var cate2Select = $("select.category2");
										cate2Select.children().remove();
										$("option:selected", this)
												.each(
														function() {

															var selectVal = $(
																	this).val();
															cate2Select
																	.append("<option value=''>전체</option>");

															for (var i = 0; i < cate2Arr.length; i++) {
																if (selectVal == cate2Arr[i].category_parent) {
																	cate2Select
																			.append("<option value='" + cate2Arr[i].category_code + "'>"
																					+ cate2Arr[i].category_name
																					+ "</option>");
																}
															}

														});

									});

					$(document)
							.on(
									"change",
									"select.category2",
									function() {

										var cate3Arr = new Array();
										var cate3Obj = new Object();

										// 3차 분류 셀렉트 박스에 삽입할 데이터 준비
										for (var i = 0; i < jsonData.length; i++) {

											if (jsonData[i].category_level == "3") {
												cate3Obj = new Object(); //초기화
												cate3Obj.category_code = jsonData[i].category_code;
												cate3Obj.category_name = jsonData[i].category_name;
												cate3Obj.category_parent = jsonData[i].category_parent;
												cate3Arr.push(cate3Obj);
												/*    var cate = jsonData[i].category_code;
												  =cate; */
											}
										}

										var cate3Select = $("select.category3");

										cate3Select.children().remove();

										$("option:selected", this)
												.each(
														function() {

															var selectVal = $(
																	this).val();
															cate3Select
																	.append("<option value=''>전체</option>");

															for (var i = 0; i < cate3Arr.length; i++) {
																if (selectVal == cate3Arr[i].category_parent) {
																	cate3Select
																			.append("<option value='" + cate3Arr[i].category_code + "'>"
																					+ cate3Arr[i].category_name
																					+ "</option>");

																	var code = cate3Arr[i].category_code;

																	document
																			.getElementById("category_code").value = code;
																}

															}
														});

									});

					var isCheck = document.getElementById("product_code").value;
				</script>


				<tr>
					<td>상품코드</td>
					<td>
						<div style="display: flex; align-items: center; justify-content: left;">
							<input type="hidden" name="category_code" id="category_code" value=""> <input type="text" class="form-control" name="product_code" id="product_code" placeholder="상품 코드">
						</div>
					</td>
				</tr>

				<tr>
					<td>상품색상</td>
					<td><input type="text" class="form-control" name="product_color" id="product_color" placeholder="상품 색상"></td>
				</tr>

				<tr>
					<td>상품 설명</td>
					<td><textarea placeholder="상품 설명" class="border-0" rows="9" style="width: 100%;" name="product_content" id="product_content"></textarea></td>
				</tr>

				<tr>
					<td>디자인 설명</td>
					<!-- 밑에 3개 area는 클라페이지로 바로 이동 -->
					<td><textarea placeholder="문구 입력..." class="border-0" rows="9" style="width: 100%;" name="product_explain_design" id="product_explain_design"></textarea></td>
				</tr>

				<tr>
					<td>원단 설명</td>
					<td><textarea placeholder="문구 입력..." class="border-0" rows="9" style="width: 100%;" name="product_explain_fabric" id="product_explain_fabric"></textarea></td>
				</tr>

				<tr>
					<td>사이즈 설명</td>
					<td><textarea placeholder="문구 입력..." class="border-0" rows="9" style="width: 100%;" name="product_explain_size" id="product_explain_size"></textarea></td>
				</tr>

				<tr>
					<td>상품 사이즈</td>
					<td>
						<div class="form-check form-check-inline">
							<input type="radio" name="product_size" id="product_size" value="S"> <label class="form-check-label" for="inlineRadio1">S</label>
						</div>
						<div class="form-check form-check-inline">
							<input type="radio" name="product_size" id="product_size" value="M"> <label class="form-check-label" for="inlineRadio2">M</label>
						</div>
						<div class="form-check form-check-inline">
							<input type="radio" name="product_size" id="product_size" value="L"> <label class="form-check-label" for="inlineRadio2">L</label>
						</div>
						<div class="form-check form-check-inline">
							<input type="radio" name="product_size" id="product_size" value="XL"> <label class="form-check-label" for="inlineRadio2">XL</label>
						</div>
						<div class="form-check form-check-inline">
							<input type="radio" name="product_size" id="product_size" value="Free"> <label class="form-check-label" for="inlineRadio2">Free</label>
						</div>
					</td>
				</tr>

				<tr>
					<td>초기재고설정</td>
					<td>
						<div class="d-flex align-items-center">
							<input type="text" class="form-control" id="product_pqty" name="product_pqty" placeholder="재고량 입력..." style="width: 300px;"> 개
						</div>
					</td>
				</tr>

				<table table class="table table-bordered">
					<thead>
						<tr>
							<th style="border-right: none;">판매 정보</th>
						</tr>
					</thead>

					<tbody>
						<!-- <tr>
							<td>소비자가</td>
							<td>
								<table table class="table table-bordered">
									<thead>
										<tr>
											<td>소비자가</td>
										</tr>
										<tr>
											<td>
												<div>
													<input type="text" class="form-control" name="product_price" id="product_price" placeholder="가격 입력...">KRW
												</div>
											</td>
										</tr>
									</thead>
								</table>
							</td>
						</tr> -->

						<tr>
							<td class="table-light">공급가</td>
							<td>
								<div class="d-flex align-items-center">
									<input type="text" class="form-control" id="cost" name="product_cost" placeholder="공급가 입력...">KRW
								</div>
							</td>
						</tr>

						<tr>

						</tr>


						<tr>
							<td class="table-light">판매가 계산</td>
							<td>
								<table table class="table table-bordered">
									<thead>
										<tr>
											<td class="table-light">마진율</td>
											<td class="table-light">추가금액</td>
											<td class="table-light">판매가적용</td>
										</tr>
										<tr>
											<td>
												<div class="d-flex align-items-center">
													<input type="text" class="form-control" style="width: 300px;" id="margin_rate" name="product_margin_rate" readonly="readonly">%
												</div>
											</td>
											<td>
												<div class="d-flex align-items-center">
													<input type="text" class="form-control" style="width: 300px;" id="add_price" name="product_margin" readonly="readonly">KRW
												</div>
											</td>
											<td>
												<button type="button" class="btn btn-dark" style="border-radius: 1" id="" onclick="javascript:applyPrice()">판매가적용</button>
											</td>
										</tr>
									</thead>
								</table>
							</td>
						</tr>

						<tr>
							<td class="table-light">판매가</td>
							<td>
								<table class="table table-bordered">
									<thead>
										<tr>
											<td>판매가
												<div class="d-flex align-items-center">
													<input type="text" class="form-control" style="width: 300px;" id="price" name="product_price">KRW
												</div>
											</td>

											<td>상품가
												<div class="d-flex align-items-center">
													<input type="text" class="form-control" style="width: 300px;" id="product_price" readonly="readonly">KRW
												</div>
											</td>

											<td>과세금액
												<div class="d-flex align-items-center">
													<input type="text" class="form-control" style="width: 300px;" id="gwase_price" readonly="readonly">KRW
												</div>
											</td>
										</tr>
									</thead>
								</table>
							</td>
						</tr>

						<!-- 	<tr>
							<td class="table-light">주문수량 제한</td>
							<td>
								<table table class="table table-bordered">
									<thead>
										<tr>
											<td class="table-light">주문수량 기준</td>
											<td><select id="dropdown-select" name="search" class="form-select" onchange="handleDropdownChange(this)">
													<option value="product-standard">상품 기준</option>
													<option value="Item basis">품목 기준</option>
											</select></td>
										</tr>
										<tr>
											<td class="table-light">최소 주문수량</td>
											<td>
												<div class="d-flex align-items-center">
													<input type="text" class="form-control" style="width: 40px;" id="" placeholder="">개 이상
												</div>
											</td>
										</tr>
										<tr>
											<td class="table-light">최대 주문수량</td>
											<td>
												<div class="d-flex align-items-center">
													<div class="form-check form-check-inline">
														<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> <label class="form-check-label" for="inlineRadio1">제한없음</label>
													</div>
													<div class="form-check form-check-inline">
														<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> <label class="form-check-label" for="inlineRadio2"> <input type="text" class="form-control" style="width: 40px; ime-mode: disabled;" id="" placeholder=""> 개 이하로 제한함
														</label>
													</div>
												</div>
											</td>
										</tr>
									</thead>
								</table>
							</td>
						</tr> -->

						<!-- <tr>
							<td class="table-light">쿠폰</td>
							<td>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> <label class="form-check-label" for="inlineRadio1">사용 가능</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> <label class="form-check-label" for="inlineRadio2">사용 불가능</label>
								</div>
							</td>
						</tr>

						<tr>
							<td class="table-light">적립금</td>
							<td>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> <label class="form-check-label" for="inlineRadio1">사용 가능</label> 사용 가능 체크했을때 가능한 쿠폰 선택할 수 있게 하는 거 추가해야함
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> <label class="form-check-label" for="inlineRadio2">사용 불가능</label>
								</div>
							</td>
						</tr> -->

					</tbody>

					</tbody>
				</table>

			</tbody>
		</table>
		<p style="border-right: none;">이미지 정보</p>
		<div>
			<img src="resources/product_images/${getProd.product_image1}">
		</div>
		<div>${getProd.product_image2}</div>
		<div>${getProd.product_image3}</div>
		<div>${getProd.product_image4}</div>
		<div>${getProd.product_image5}</div>
		<div>${getProd.product_image6}</div>
		<div>${getProd.product_image7}</div>
		<div>${getProd.product_image8}</div>
		<div>${getProd.product_image9}</div>
		<div>${getProd.product_image10}</div>

		<div>
			<div class="form-group file-group" id="file-list">
				<c:set var="number" value="1" />
				<c:forEach items="${imageList}" var="file">
					<div class="file-input">

						<c:if test="${file != null }">
							<img src="${upPath}/${file}" width="50" height="50">
							<br>
										${file} 
										<c:if test="${dto.del eq 'N' }">
								<a href='#this' name='file-delete'>삭제</a>
							</c:if>
							<input type="hidden" name="prod_image${number}" value="${file}">
						</c:if>
					</div>
					<c:set var="number" value="${number+1}" />
				</c:forEach>
			</div>
			<c:if test="${dto.del eq 'N' }">
				<div id="attachFileDiv">
					<div id="file0">
						<input type="file" id="file_img0" name="file_img0" value="" size="20" onchange="javascript:attachFile.add(0)">
					</div>
				</div>
			</c:if>
		</div>

		<div id="attachFileDiv">
			<div id="file0">
				<input type="file" id="file_img0" name="file_img0" value="" size="20" onchange="attachFile.add(0)">
			</div>
		</div>
		<div id="image-preview" class="image-preview"></div>
	</div>



	<div align="center">
		<button type="submit" class="btn btn-dark" style="border-radius: 0; width: 100px;">등록</button>
		<button type="button" class="btn btn-dark" style="border-radius: 0; width: 100px;" onclick="javascript:hitory.back()">취소</button>
	</div>

	</div>
	</div>



	</body>
	</html>
</form>