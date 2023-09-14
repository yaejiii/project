<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="admin_top.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<form name="f" action="admin_edit_category.do" method="post" onsubmit="return checkInput()">
<div class="row"> 
	<table table class="table table-bordered"> 
	<thead>
		<tr>
			<th style="border-right: none;">카테고리 수정</th>
		</tr>
			</thead>
					<tbody>
							<tr>
								<td>
									카테고리 분류
								</td>
								<td>
									<div id="select_container">
	 									<select class="category1">
											<option value="">대분류</option>
										</select>
										
										<select class="category2">
											<option value="">중분류</option>
										</select>
										
										
										<select class="category3">
											<option value="">소분류</option>
										</select>
									</div>
<%-- 									<c:if test="${categoryDTO.category_level == 2}">
										${categoryDTO.category_parent}>${categoryDTO.category_name}
									</c:if>
									<c:if test="${categoryDTO.category_level == 3}">
										${categoryDTO.category_parent}>${categoryDTO.category_name}
									</c:if>
 --%>									
								</td>
							</tr>
							<tr>
								<td>
									수정 카테고리
								</td>
								<td>
								<c:choose>
									<c:when test="${categoryDTO.category_level == 1}">
										<input type="radio" id="category_level1" name="category_level" value="1" checked readonly>대분류
									</c:when>
									<c:when test="${categoryDTO.category_level == 2}">
										<input type="radio" id="category_level2" name="category_level" value="2" checked readonly>중분류
									</c:when>
									<c:when test="${categoryDTO.category_level == 3}">
										<input type="radio" id="category_level3" name="category_level" value="3" readonly>소분류
									</c:when>
									</c:choose>
								</td>
							</tr>
							
							<tr>
								<td>카테고리 코드</td>
								<td>
									<input name="category_code" id="new_category_code" value="${categoryDTO.category_code}" readonly>
								</td>
							</tr>
							<tr>
								<td>카테고리 이름</td>
								<td><input name="category_name" value="${categoryDTO.category_name}"></td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<button class="btn btn-dark">수정</button>
									<button type="button" class="btn btn-light" onclick="javascript:history.back()">취소</button>
								</td>
							</tr>
					</tbody>
				</table>
			</form>
			</div>
		</div>
	</body>
	<script type="text/javascript">
function checkInput(){

	if (document.f.category_name.value == "") {
		alert("카테고리명을 입력하세요.")
		document.f.category_name.focus()

		return false
	}
	if (document.f.new_category_code.value == "") {
		alert("카테고리 코드를 입력하세요.")
		document.f.new_category_code.focus()

		return false
	}

	return true
}
var jsonData = JSON.parse('${listCate}');
if(jsonData == ""){
	  alert('등록된 카테고리가 없습니다. 카테고리를 등록해주세요.')
	}

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
					+ cate1Arr[i].category_name + "</option>");
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

										var selectVal = $(this)
												.val();
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
						}
					}

					var cate3Select = $("select.category3");

					cate3Select.children().remove();

					$("option:selected", this)
							.each(
									function() {

										var selectVal = $(this)
												.val();
										cate3Select
												.append("<option value=''>전체</option>");

										for (var i = 0; i < cate3Arr.length; i++) {
											if (selectVal == cate3Arr[i].category_parent) {
												cate3Select
														.append("<option value='" + cate3Arr[i].category_code + "'>"
																+ cate3Arr[i].category_name
																+ "</option>");
											}
										}
									});

				});

</script>

</html>