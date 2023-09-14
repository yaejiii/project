<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="admin_top.jsp"%>
<link rel="stylesheet" href="resources/css/admin_product_insert.css?after">


<script type="text/javascript" src="resources/js/admin_product_insert.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
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
	
	function deleteStore() {

		var realDel = confirm("해당 지점을 삭제하시겠습니까");
		if (realDel) {
			alert("삭제확인")
			var del2 = document.getElementsByName('RowCheck');
			const arr2 = [];
			for (i = 0; i < del2.length; ++i) {
				if (del2[i].checked == true) {
					arr2.push(del2[i].value);
					alert(del2[i].value)
				}
			}

			$.ajax({

				url : './admin_delete_store.do',
				type : 'post',
				data : {
					slist: JSON.stringify(arr2)
				},
				cache : false,
				success : function(res) {
					alert("삭제가 완료되었습니다.")
					document.location.href = document.location.href;
					location.href('admin_store_list.do?store_num')
				}
			});

		}
	}
	
</script>
<div class="container">
	<div>
		<p style="font-weight: bold; font-size: 30px;'">지점 목록</p>
	</div>
	<table class="table table-bordered" style="border: 2px solid #000000; text-align: center;">
		<tbody>
			<tr>
				<td colspan="9">
					<button onclick="deleteStore()" class="btn btn-dark" style="border-radius: 1; float: left; margin: 1px;">지점 삭제</button></td>
			</tr>
			<tr>
				<th>
				<input type="checkbox" id="allCheck" name="allCheck" />전체선택 
				</th>
				<td>지점이름</td>
				<td>지점관리자</td>
				<td>지점관리자 휴대전화</td>
				<td>지점전화</td>
				<td>지점주소</td>
				<td>오픈/마감시간</td>
			</tr>
			<c:if test="${empty listStore}">
				<tr>
					<td colspan="8">검색된 지점 내역이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty listStore}">
				<c:forEach var="dto" items="${listStore}">
					<tr>
						<th><input type="checkbox" name="RowCheck" value="${dto.store_num}"> <!-- 	 <label class="form-check-label" for="flexCheckDefault">
		                </label>       --></th>
						<td><a href="admin_store_edit.do?store_num=${dto.store_num}">${dto.store_name}</a></td>
						<td>${dto.store_manager}</td>
						<td>${dto.store_manager_tel1}-${dto.store_manager_tel2}-${dto.store_manager_tel3}</td>
						<td>${dto.store_tel}</td>
						<td>${dto.store_address}</td>
						<td>${dto.store_open}/${dto.store_close}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</div>

</body>
</html>