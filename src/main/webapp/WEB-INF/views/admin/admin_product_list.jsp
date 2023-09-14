<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--  LIST.JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="admin_top.jsp"%>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<script type="text/javascript">



function findPage(pageNum,search,searchString){
	location.href = 'admin_product_list.do?mode=Y?pageNum='+pageNum+'&search='+search+'&searchString='+encodeURI(searchString)
}
 

	$(function() {
		var chkObj = document.getElementsByName("RowCheck");
		var rowCnt = chkObj.length;

		$("input[name='allCheck']").click(function() {
			var chk_listArr = $("input[name='RowCheck']");
			for (var i = 0; i < chk_listArr.length; i++) {
				chk_listArr[i].checked = this.checked;

			}
		});
		$("input[name='RowCheck']").click(function() {
			if ($("input[name='RowCheck']:checked").length == rowCnt) {
				$("input[name='allCheck']")[0].checked = true;
			} else {
				$("input[name='allCheck']")[0].checked = false;
			}
		});
	});

	function check() {

		if (f.searchString.value == "") {
			alert("검색란에 내용을 입력해주세요.")
			f.searchString.focus()
			return false
		}

	}

	function realDeleteList() {

		var realDel = confirm("완전 삭제하시겠습니까");
		if (realDel) {
			//alert("삭제확인")
			var del2 = document.getElementsByName('RowCheck');
			const arr2 = [];
			for (i = 0; i < del2.length; ++i) {
				if (del2[i].checked == true) {
					arr2.push(del2[i].value);
					//alert(del2[i].value)
				}
			}

			$.ajax({

				url : './admin_product_realDelete.do',
				type : 'post',
				data : {
					dlist : JSON.stringify(arr2)
				},
				cache : false,
				success : function(res) {
					alert("삭제가 완료되었습니다.")
					document.location.href = document.location.href;
					location.href('admin_product_list.do?mode=Y')
				}
			});

		}
	}

	function moveDeleteList() {

		var isDel = confirm("삭제목록으로 이동하시겠습니까?");
		if (isDel) {
			//alert("이동확인")
			//alert(document.getElementById('mode').value)
			var mode = document.getElementById('mode').value;
			var del = document.getElementsByName('RowCheck');

			const arr = [];
			for (i = 0; i < del.length; ++i) {
				if (del[i].checked == true) {
					arr.push(del[i].value);

					/* 		alert(del[i].value) */
				}

			}
			if (arr == null || arr == "") {
				alert("이동할 상품을 체크해주세요.")
				return;
			}
			/* 	alert(arr[0]) */
			$.ajax({
				url : './admin_product_moveDeleteList.do',
				type : 'post',
				data : {
					list : JSON.stringify(arr)

				},
				cache : false,
				success : function(res) {
					//alert("진짜여기")
					/*  	if(mode == 'Y'){ /* 재등록 할거면 필요한 로직 
								alert("")
					 			document.location.href = document.location.href;
								 location.href('admin_product_list.do?mode=N')
							 }  */
					if (mode == null || mode == '' || mode == 'N') {
						alert("상품삭제목록으로 이동했습니다.")
						document.location.href = document.location.href;
						location.href='admin_product_list.do?mode=Y'
					}
				}
			});
		}
	}

	function restoreProduct() {
		var isRestore = confirm("상품을 복구하시겠습니까?");
		if (isRestore) {
			var del = document.getElementsByName('RowCheck');

			const arr = [];
			for (i = 0; i < del.length; ++i) {
				if (del[i].checked == true) {
					arr.push(del[i].value);
				}
			}
			if (arr.length === 0) {
				alert("복구할 상품을 체크해주세요.");
				return;
			}

			$.ajax({
				url : './admin_product_restore.do',
				type : 'post',
				data : {
					list : JSON.stringify(arr)
				},
				cache : false,
				success : function(res) {
					alert("상품이 복구되었습니다.");
					document.location.href = document.location.href;
					location.href='admin_product_list.do'
				}
			});
		}
	}
</script>

<!--  <div class="container">
		<div class="col-12 main-content">
			      
				<div class="container">
					<div class="detail-content">
						 <table class="table" border="1">
								<tbody> -->
<!-- 
										<tr>
											<th scope="row">검색분류</th>
												<td>
													<ul>
														<li>
															<select class="option-name" style="margin-right:5px">
																<option ="productname">상품명</option>
															</select>
                                                          <div class="input-group input-group-sm mb-3">
                                                            <input type="text" class="text-size" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                                          </div>
														</li>
													</ul>
												</td>
               
											
										</tr>
                                      <tr>
											<th scope="row">상품분류</th>
												<td >
													<ul >
														<li>
															<select class="option-name" style="margin-right:5px">
																<option ="productname">상품명</option>
																
															</select>
                                                          <select class="option-name" style="margin-right:5px">
																<option ="productname">상품명</option>
																
															</select>
                                                          <select class="option-name" style="margin-right:5px">
																<option ="productname">상품명</option>
																
															</select>
                                                          <select class="option-name">
																<option ="productname">상품명</option>
																
															</select>
														</li>
													</ul>
												</td>
                                           
								
										</tr>
                                      <tr>
											<th scope="row">상품등록일</th>
												<td>
													<ul>
														<li>
															<select class="option-name" style="margin-right:5px">
																<option ="productname">상품명</option>
																
															</select>
                                                          <select class="date" style="margin-right:5px">
																<option ="productname" >상품명</option>
																
															</select>
                                                          <select class="date" style="margin-right:5px">
																<option ="productname">상품명</option>
																
															</select>
                                                          <select class="#" style="margin-right:5px">
																<option ="productname">상품명</option>
																
															</select>
                                                          <select class="#" style="margin-right:5px">
																<option ="productname">상품명</option>
																
															</select>
                                                          <select class="#">
																<option ="productname">상품명</option>
																
															</select>
                                                          
														</li>
													</ul>
												</td>
               
										
										</tr>
								
								</tbody>
							</table>
						</div>
					</div> 
				-->
<div>
	<c:if test="${mode != 'Y'}">
	<p style="font-weight: bold; font-size: 30px;'">상품목록</p>
	</c:if>
	<c:if test="${mode == 'Y'}">
	<p style="font-weight: bold; font-size: 30px;'">상품삭제목록</p>
	</c:if>
</div>
<form name="f" action="admin_product_search.do" method="post" role="search" onsubmit="return check()">
	<input type="hidden" name="mode" value="${mode}">
	<div class="row">
		<div class="col" align="center" style="padding: 10px 10px;">
			<select id="dropdown-select" name="search" class="form-select" onchange="handleDropdownChange(this)" style="width: 500px;">
				<option value="product_name">상품명</option>
				<option value="product_code">상품코드</option>
			</select> <input class="form-control me-2" type="text" name="searchString" placeholder="검색할 상품을 입력하세요..." aria-label="Search" style="width: 500px;">
			<button type="submit" class="btn btn-dark">검색</button>
			<button type="reset" class="btn btn-dark">초기화</button>
</form>
</div>
</div>

<!--  
			</div> 
	
	 </div>

    <div class="container">
      <div class="row">
        <div class="col-12">상품목록</div>

        <div class="col-8">[총 n개]</div> -->

<!--    <div class="col-2">
          <select
            id="dropdown-select"
            name="search"
            class="form-select"
            onchange="handleDropdownChange(this)"
          >
            <option ="content">등록일 역순</option>
            <option ="hashTag_name">등록일 순</option>
            <option ="content">수정일 역순</option>
            <option ="hashTag_name">수정일 순</option>
            <option ="content">상품명 역순</option>
            <option ="hashTag_name">상품명 순</option>
            <option ="content">판매가 역순</option>
            <option ="hashTag_name">판매가 순</option>
            <option ="content">공급가 역순</option>
            <option ="hashTag_name">공급가 순</option>
            <option ="content">진열 역순</option>
            <option ="hashTag_name">진열열 순</option>
            <option ="content">장바구니수 역순</option>
            <option ="hashTag_name">장바구니수 순</option>
            <option ="content">조회수 역순</option>
            <option ="hashTag_name">조회수 순</option>
            <option ="content">좋아요 역순</option>
            <option ="hashTag_name">좋아요 순</option>
          </select>
        </div> -->

<!--         <div class="col-2">
          <select
            id="dropdown-select"
            name="search"
            class="form-select"
             onchange="handleDropdownChange(this)" 
          >
            <option ="content">10개씩 보기</option>
            <option ="content">20개씩 보기</option>
            <option ="content">30개씩 보기</option>
            <option ="content">50개씩 보기</option>
            <option ="content">100개씩 보기</option>
          </select>
        </div>  -->

<!--  <div class="col-11" style="padding: 10px">
          <button type="submit" class="btn btn-dark" style="border-radius: 1">
            진열함
          </button>
          <button type="submit" class="btn btn-dark" style="border-radius: 1">
            진열안함
          </button>
          <button type="submit" class="btn btn-dark" style="border-radius: 1">
            판매함
          </button>
          <button type="submit" class="btn btn-dark" style="border-radius: 1">
            판매안함
          </button>
          <button type="submit" class="btn btn-dark" style="border-radius: 1">
            복사
          </button>
     -->
<c:if test="${mode!='Y' }">
	<button onclick="moveDeleteList()" class="btn btn-dark" style="border-radius: 0">삭제목록으로 이동</button>
</c:if>
<c:if test="${mode=='Y' }">
	<button onclick="restoreProduct()" class="btn btn-dark" style="border-radius: 0">상품 복구</button>
	<button onclick="realDeleteList()" class="btn btn-dark" style="border-radius: 0">완전 삭제</button>

</c:if>

<div class="col-12">
	<table class="table">
		<thead>
			<tr width="90%">
				<th width="10%">
					<!--   <div class="form-check"> --> <input type="checkbox" id="allCheck" name="allCheck"/> <!--        <label class="form-check-label" for="flexCheckDefault">
		                </label> -->
				</th>
				<th width="10%">No</th>
				<th width="15%" style="text-align:center;">상품코드</th>
				<th width="15%" style="text-align:center;">상품명</th>
				<th width="10%">상품색상</th>
				<th width="10%">판매가</th>
				<th width="20%" style="text-align:center;">상품이미지</th>
				<th width="5%">수량</th>
				<th width="5%">마진</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<table class="table">
					<tr>
						<c:if test="${empty listProd}">
							<td colspan="10" align="center">해당 상품이 존재하지 않습니다.</td>
							<td><a href="admin_product_list.do">상품 목록으로 넘어가기</a></td>
						</c:if>
						<c:if test="${not empty listProd}">
							<c:forEach var="dto" items="${listProd}">
								<th width="10%" valign="middle">
									<input type="checkbox" name="RowCheck" value="${dto.product_num}">
									<!-- <label class="form-check-label" for="flexCheckDefault"></label> -->
								</th>
								<td width="10%">${dto.product_num}</td>
								<td width="15%">${dto.product_code}</td>
								<td width="15%">${dto.product_name}</td>
								<td width="10%">${dto.product_color}</td>
								<td width="10%">${dto.product_price}</td>
								<td width="20%" align="center">
									<a href="admin_product_view.do?product_num=${dto.product_num}">
										<img src="resources/product_images/${dto.product_image1}" class="card-img" alt="..."
												style="width: 50%; height: 50%;">
									</a>
								</td>
								<td width="5%">${dto.product_pqty}</td>
								<td width="5%">${dto.product_margin}</td>
								<!-- 기능구현이후에 필요한 컬럼값 넘기기 -->
	</tr>
							</c:forEach>
						</c:if>
						<!--  checkbox div -->
				
				</table>
				<input type="hidden" id="mode" value="${mode}">
			</tr>
			<div>
<c:if test="${count >0}">

			<c:if test="${mode != 'Y'}">
				<c:if test="${startPage > pageBlock}">
					[<a href="admin_product_list.do?pageNum=${startPage - 1}">이전</a>]	
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					[<a href="admin_product_list.do?pageNum=${i}">${i}</a>]		
				</c:forEach>
				<c:if test="${endPage < pageCount}">
					[<a href="admin_product_list.do?pageNum=${endPage+1}">다음</a>]
				</c:if>
			</c:if>	
</c:if>
	
		<c:if test="${count >0}">
			<c:if test="${mode == 'Y'}">
				<c:if test="${startPage > pageBlock}">
					[<a href="admin_product_list.do?mode=Y&pageNum=${startPage - 1}">이전</a>]	
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					[<a href="admin_product_list.do?mode=Y&pageNum=${i}">${i}</a>]		
				</c:forEach>
				<c:if test="${endPage < pageCount}">
					[<a href="admin_product_list.do?mode=Y&pageNum=${endPage+1}">다음</a>]
				</c:if>
			</c:if>
		</c:if>	


</div>
		</tbody>
	</table>
</div>
</div>


</body>
</html>