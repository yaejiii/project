<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- INSERT.JSP -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="admin_top.jsp"%>
<link rel="stylesheet" href="resources/css/admin_product_insert.css?after">


<script type="text/javascript" src="resources/js/admin_product_insert.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
	
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

	function storeCheck() {

		if (document.f.store_name.value == "") {
			alert("지점명을 입력하세요.")
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
		

	}
</script>
<form name="f" action="admin_store_edit.do" method="post" enctype="multipart/form-data" onsubmit="return storeCheck()">

	<div class="row" style="margin-left: 80px;">
		<input type="hidden" value="${getStore.store_num}" name="store_num">
		<table table class="table table-bordered">
			<thead>
				<tr>
					<th style="border-right: none;">정보 입력</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>지점명</td>

					<td>
						<div style="display: flex; align-items: center; justify-content: left;">
							<input type="text" class="form-control" name="store_name" id="store_name" value="${getStore.store_name}" placeholder="지점명 : 영어 또는 한글(자음,모음만x)만 입력가능하며 공백을 없애고 입력하세요." style="width: 800px;"> 
							<input type="button" onclick="pNameCheck()" class="btn btn-dark" value="중복확인" style="margin-left: 3px;">
						</div>
					</td>

				</tr>
				
				<tr>
					<td>지점 관리자</td>
					<td>
						<div style="display: flex; align-items: center; justify-content: left;">
							 <input type="text" class="form-control" name="store_manager" id="store_manager" value="${getStore.store_manager}" placeholder="담당자 이름">
						</div>
					</td>
				</tr>

				<tr>
					<td >지점 관리자 연락처</td>
					<td>
									<input type = "text" name = "store_manager_tel1" id = "phone" maxlength="4" value="${getStore.store_manager_tel1}" placeholder="*휴대폰 번호" >
									<span class = "ele">-</span>
									<input type = "text" name = "store_manager_tel2" id = "phone" maxlength="4" value="${getStore.store_manager_tel2}" placeholder="*휴대폰 번호" >
									<span class = "ele">-</span>
									<input type = "text" name = "store_manager_tel3" id = "phone" value="${getStore.store_manager_tel3}" maxlength="4" >
								</td>
							</tr>
							
				<tr>
					<td>지점연락처</td>
					<td>
						<div class="d-flex align-items-center">
							<input type ="text" name = "store_tel" id="phone" value="${getStore.store_tel}" maxlength="11" >
						</div>
					</td>
				</tr>

				<tr>
					<td>지점 주소</td>
					<td> <input type="text" class="form-control" name="store_address" id="store_address" value="${getStore.store_address}" placeholder="지점 주소"></td>
				</tr>

				<tr>
					<td>지점 운영 시작 시간</td>
					<!-- 밑에 3개 area는 클라페이지로 바로 이동 -->
					<td><input type="text" class="form-control" name="store_open" id="store_open" value="${getStore.store_open}" placeholder="오픈 시간"></td>
				</tr>

				<tr>
					<td>지점 운영 마감 시간</td>
					<td><input type="text" class="form-control" name="store_close" id="store_close" value="${getStore.store_close}" placeholder="마감시간"></td>
				</tr>

				<tr>
					<td>지점 특이사항</td>
					<td><textarea placeholder="문구 입력..."  class="border-0" rows="9" style="width: 100%;" name="store_memo" id="store_memo">${getStore.store_memo}</textarea></td>
				</tr>

</tbody>
</table>
<div align="center">
		<button type="submit" class="btn btn-dark" style="border-radius: 0; width: 100px;">등록</button>
		<button type="button" class="btn btn-dark" style="border-radius: 0; width: 100px;" onclick="javascript:hitory.back()">취소</button>
	</div>
	</div>



	</body>
	</html>
</form>