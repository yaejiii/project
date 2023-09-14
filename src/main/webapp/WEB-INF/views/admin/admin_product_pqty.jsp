<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- pqty. -->
<%@include file="admin_top.jsp"%>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<script type="text/javascript">

 $(function(){
	var chkObj = document.getElementsByName("RowCheck");
	var rowCnt = chkObj.length;
	
	$("input[name='allCheck']").click(function(){
		var chk_listArr = $("input[name='RowCheck']");
		for (var i=0; i<chk_listArr.length; i++){
			chk_listArr[i].checked = this.checked;
		
		}
	});
	$("input[name='RowCheck']").click(function(){
		if($("input[name='RowCheck']:checked").length == rowCnt){
			$("input[name='allCheck']")[0].checked = true;
		}
		else{
			$("input[name='allCheck']")[0].checked = false;
		}
	});
}); 
 
function moveSoldoutList(){
	
	location.href='admin_product_moveSoldoutList.do?mode=Y'
	
	
}
 
 function movePqtyList(){
	 
	 location.href='admin_product_pqty.do'
 }
 
/* function letgo() {
		//alert(document.asdf.offline_pqty1.value)
		//document.asdf.submit()
		
		location.href='admin_update1_pqty.do'
	} 
	 */
</script>


<div class="container">
	<p style="font-weight: bold; font-size: 30px;'">상품재고 관리</p>
	<form name="f" action="admin_product_pqty_search.do" method="post" role="search" onsubmit="return check()">
	<input type ="hidden" name = "mode" value = "${mode}">
		<table class="table" style="border: 2px solid #000000; text-align: center;">
			<tbody>
				<tr>
					<th scope="row">검색분류</th>
					<td>
						<ul>
							<li>
								<select class="option-name" name="search" onchange="handleDropdownChange(this)" style="margin-right: 5px">
									<option value="product_name">상품명</option>
									<option value="product_code">상품코드</option>
								</select>
								
								<div class="input-group input-group-sm mb-3">	
									<input type="text" name = "searchString" placeholder="검색할 상품을 입력하세요..." aria-label="Search" class="text-size" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
								</div>
							</li>
						</ul>
					</td>

				</tr>
				
			</tbody>
		</table>


	<div class="row">
		<div class="col" align="center" style="padding: 10px 10px">
			<button type="submit" class="btn btn-dark">검색</button>
			<button onclick="location.href='admin_product_pqty.do'" type="submit" class="btn btn-dark">초기화</button>
			
		</div>
	</div>
</form>
	
	
	
	<div>
		
		<table class="table table-bordered" style="border: 2px solid #000000; text-align: center;">
			<thead>
				<!-- <tr>
					<td colspan="9"><select id="dropdown-select" name="search" onchange="handleDropdownChange(this)" style="float: right;">
							<option value="content">등록일 역순</option>
							<option value="hashTag_name">등록일 순</option>
							<option value="content">수정일 역순</option>
							<option value="hashTag_name">수정일 순</option>
							<option value="content">상품명 역순</option>
							<option value="hashTag_name">상품명 순</option>
							<option value="content">판매가 역순</option>
							<option value="hashTag_name">판매가 순</option>
							<option value="content">공급가 역순</option>
							<option value="hashTag_name">공급가 순</option>
							<option value="content">진열 역순</option>
							<option value="hashTag_name">진열열 순</option>
							<option value="content">장바구니수 역순</option>
							<option value="hashTag_name">장바구니수 순</option>
							<option value="content">조회수 역순</option>
							<option value="hashTag_name">조회수 순</option>
							<option value="content">좋아요 역순</option>
							<option value="hashTag_name">좋아요 순</option>
					</select> <select id="dropdown-select" name="search" onchange="handleDropdownChange(this)" style="float: right; margin-right: 5px;">
							<option value="content">10개씩 보기</option>
							<option value="content">20개씩 보기</option>
							<option value="content">30개씩 보기</option>
							<option value="content">50개씩 보기</option>
							<option value="content">100개씩 보기</option>
					</select></td>
				</tr> -->
				<tr>
					<td colspan="9">
						<c:if test = "${mode != 'Y' }">
						<button onclick= "javascript:moveSoldoutList()" class="btn btn-dark"  style="border-radius: 1; float: left;">
							품절목록으로 이동
						</button>
						</c:if>
						
						<c:if test = "${mode == 'Y' }">
						<button onclick="movePqtyList()" class="btn btn-dark"  style="border-radius: 1; float: left; margin-left: 5px;">
          					재고목록으로 이동
          				</button>
         				</c:if>
         				<c:if test = "${mode != 'Y' }">
						<button onclick="location.href='admin_offline_pqty.do'" class="btn btn-dark"  style="border-radius: 1; float: left; margin-left: 5px;">
							지점별 재고목록으로 이동
						</button>
						</c:if>
						<form name="pqty_go" method="post" action="admin_update1_pqty.do">
						<!-- <button onclick="letgo()" type="button" class="btn btn-dark" style="border-radius: 1; float: right;">저장</button> -->
						<input type="submit" class="btn btn-dark" value = "저장" style="border-radius: 1; float: right;">
					</td>
				
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<th>상품번호</th>
					<th>상품이미지</th>
					<th>상품코드</th>
					<th>상품명</th>
					<th>총 재고수량</th>
					<th>온라인 재고수량</th>
					<th>오프라인 재고수량</th>
					<th>판매상태</th>
				</tr>
				
				<c:if test="${empty listPqty}">
					<tr>
						<th colspan="9">등록된 상품이 없습니다.</th>
					</tr>
				</c:if>
				
				<c:if test="${not empty listPqty }">
						  <c:forEach var="listPqty" items="${listPqty }">
							<tr>
								<td>${listPqty.product_num }</td>
								
								<td>
									<%-- <img src="${sessionScope.upPath}/${listPqty.product_image1}" width="30" height="30"> --%>
									<img src="resources/product_images/${listPqty.product_image1}" width="30" height="30">								
								</td>
								
								<td>${listPqty.product_code }</td>
								<td>${listPqty.product_name}</td>
								
								<td>
									<input type="text" style="width: 100%;" name="product_pqty" value="${listPqty.product_pqty}" >
								</td>
									
								<td>
									<%-- ${listPqty.product_pqty-listPqty.store_nowon_pqty-listPqty.store_gangnam_pqty-listPqty.store_hongdae_pqty} --%>
									<input type="text" style="width: 100%;" name="online_pqty" value="${listPqty.product_pqty - listPqty.offline_pqty}" readOnly>
								</td>
								
								<td>
									<input type="text" style="width: 100%;" name="offline_pqty" value="${listPqty.offline_pqty}" readOnly>
								</td>
								
								<c:if test = "${listPqty.product_del eq 'N'}">
									<td>판매중</td>
								</c:if>
								
								<c:if test = "${listPqty.product_del eq 'Y'}">
									<td>품	절</td>
								</c:if>
								
								<c:if test = "${listPqty.product_del eq 'N'}">

										<input type="hidden" name="product_num" value="${listPqty.product_num}"/>
									
								</c:if>
								
								<%-- <input type="hidden" id = "mode" name = "mode" value = "${mode}"> --%>
							</tr>
						</c:forEach>
					</form>
				</c:if>
			</tbody>
		</table>
	</div>

</div>
<!-- 	</form> -->

</body>
</html>