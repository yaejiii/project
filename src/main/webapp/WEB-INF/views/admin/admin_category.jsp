<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- admin_category_management -->
<%@include file="admin_top.jsp" %>
<link rel="stylesheet" href="resources/css/admin_category.css?after">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
function reallyDelete(){
	var code = document.getElementById('category3').value
	alert(code)
	if(code == ""){
		code = document.getElementById('category2').value
		alert(code)
	}if(code == ""){
			code = document.getElementById('category_parent1').value
		alert(code)
		}
	if(confirm('카테고리를 삭제하시겠습니까?\n카테고리 삭제 시, 해당 카테고리의 상품들은 모두 상품삭제리스트로 이동됩니다.')){
	location.href='admin_delete_category.do?caterory_code='+code+''
	}
}

 function check() {

		if (document.f.category_parent1.value == "") {
			alert('수정할 카테고리를 선택하세요.')
			document.f.category_parent1.focus()

			return false
		}	
		return true
	}
</script>
</head>	
		<div class="container">
			<div class="row">
				<div class="col-12 main-content">
					<table class="table" border="1" style="table-layout: fixed">
						<thead>
						<form name = "f" action="admin_category_edit.do" method="post" onsubmit="return check()">
							<tr>
							
							<div class = "cate_wrap">
								<th scope="col">대분류
								<select class="category1" name="category1" id="category_parent1">
								<option value="">전체</option>
								</select>	
								</th>		
											
							</div>
							
							<div class = "cate_wrap">	
								<th scope="col">중분류
									<select class="category2" name="category2" id="category2">
									<option  value="">전체</option>
								</select>
								</th>
							</div>
							
							<div class = "cate_wrap">	
								<th scope="col">소분류
								<select class="category3" name="category3" id="category3">
									<option value="">전체</option>
								</select>
								</th>
							</div>		
							<th>
							<button type="submit" class="btn btn-dark" onsubmit="check()">카테고리 수정</button>
							
							</th>
							<th>
							<!-- <button type="button" class="btn btn-dark" onclick="reallyDelete()">카테고리 삭제</button> -->
							
							</th>
							</tr>
							<tr><td colspan="4">수정 또는 삭제할 카테고리를 선택해주세요.</td></tr>
				</thead>

					</table>
				</form>	
					
					<table class="table" border="1" style="table-layout: fixed">
						
						<tr>
						<th>No</th>
						<th>카테고리 분류</th>
						<th>카테고리 코드</th>
						<th>카테고리명</th>

					</tr>
					<c:if test="${empty listCate }">
							<tr><td colspan="4" align="center">등록된 카테고리가 없습니다.</td></tr>
						</c:if>
					    <c:forEach var = "dto" items = "${listCate}" >
					<tr>
						<td>${rownum}</td>
              			<td>${category_level}</td>
               			<td>${dto.category_code}</td>
                		<td>${dto.category_name}</td>
					  </tr>
    			            </c:forEach>
					
					
					
					
				</div>
			</div>
		</div>
			<script>

				/*			카테고리			*/
				// 컨트롤러에서 데이터 받기
				var jsonData = ${listCate};

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
	</body>
</html>