<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="admin_top.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<form name="f" action="admin_insert_category.do" method="post" onsubmit="return inputCheck()">
<div class="row"> 
	<table table class="table table-bordered"> 
	<thead>
		<tr>
			<th style="border-right: none;">카테고리 추가</th>
		</tr>
			</thead>
					<tbody>
							<tr>
								<td>
									전체 카테고리 보기
								</td>
								<td>
									<div id="select_container">
	 									<select class="category1" id="category_parent1" name="category_parent_code1">
											<option value="">대분류</option>
										</select>
										<select class="category2" id="category_parent2" name="category_parent_code2">
											<option value="">중분류</option>
										</select>
										<select class="category3">
											<option value="">소분류</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td>
								카테고리 분류
								</td>
								<td>
 									<input type="radio" id="category_level1" name="category_level" value="1">대분류
									<input type="radio" id="category_level2" name="category_level" value="2">중분류
									<input type="radio" id="category_level3" name="category_level" value="3">소분류
 								
						<br>소속 카테고리와 추가할 카테고리 분류를 선택하고	 자동으로 입력되는 카테고리 코드를 확인해주세요.
						<br>카테고리 코드는 대분류 추가일 경우, 100,000단위, 중분류 추가일 경우, 1,000단위, 소분류 추가일 경우, 1단위로 더한 값이 입력됩니다.  
 	 
 								</td>
							</tr>
							
							<tr>
								<td>카테고리 코드</td>
								<td>
									<input name="category_code" id="new_category_code">
  									<!-- 	<button type="button" id="ajax_btn" class="btn btn-dark" onclick="insertCode()">신규 코드 자동 입력</button> -->
 								</td>
							</tr>
							<tr>
								<td>카테고리 이름</td>
								<td><input name="category_name"></td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<button class="btn btn-dark">등록</button>
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

var jsonData = JSON.parse('${listCate}');

console.log(jsonData);

var cate1Arr = new Array();
var cate1Obj = new Object();
var cate2Arr = new Array();
var cate2Obj = new Object();
var cate3Arr = new Array();
var cate3Obj = new Object();
var count1 = 0;
var count2 = 0;
var count3 = 0;
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
					+ cate1Arr[i].category_code + cate1Arr[i].category_name + "</option>");
			++count1;
}

$(document).on("change","select.category1",
	function() {
	// 배열 초기화
		cate2Arr = new Array();

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
				.each(function() {
					var selectVal = $(this).val();
					cate2Select.append("<option value=''>전체</option>");
					count2 = 0;
					for (var i = 0; i < cate2Arr.length; i++) {
						if (selectVal == cate2Arr[i].category_parent) {
							cate2Select.append("<option value='" + cate2Arr[i].category_code + "'>"
									+ cate2Arr[i].category_code + cate2Arr[i].category_name
															+ "</option>");
								++count2;
								}
							}

					});

			});

$(document).on("change","select.category2",
	function() {
		// 3차 분류 셀렉트 박스에 삽입할 데이터 준비
		cate3Arr = new Array();
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

		$("option:selected", this).each(
		function() {
		var selectVal = $(this).val();
		cate3Select.append("<option value=''>전체</option>");
		count3 = 0; 
		for (var i = 0; i < cate3Arr.length; i++) {
			if (selectVal == cate3Arr[i].category_parent) {
				cate3Select.append("<option value='" + cate3Arr[i].category_code + "'>"
						+ cate3Arr[i].category_code + ' / ' + cate3Arr[i].category_name + "</option>");
					++count3;}
					}
				});
	
			});
</script>

<script type="text/javascript">
//라디오 버튼 요소
var radio1 = document.getElementById("category_level1");
var radio2 = document.getElementById("category_level2");
var radio3 = document.getElementById("category_level3");

// 라디오 버튼 이벤트 리스너 등록
radio1.addEventListener("change", handleRadioChange);
radio2.addEventListener("change", handleRadioChange);
radio3.addEventListener("change", handleRadioChange);

// 라디오 버튼 변경 시 실행되는 함수
function handleRadioChange() {
 	insertCode();
}

 function insertCode() {
	var input_code = document.getElementById('new_category_code')
	var input_parent1 = document.getElementById('category_parent_code1')
	var input_parent2 = document.getElementById('category_parent_code2')
	
	var parent1 = document.getElementById('category_parent1').value
	var parent2 = document.getElementById('category_parent2').value

	  if (radio1.checked) {
		if(cate1Arr == ""){
			input_code.value = '100000'
		}
		input_code.value = parseInt(cate1Arr[cate1Arr.length-1].category_code)+100000
		input_parent1.value = null	
		input_parent2.value = null
	}else if(radio2.checked){
		if(parent1 == ""){
			alert('대분류 카테고리를 먼저 선택해주세요.')
			radio1.checked = true
			handleRadioChange()
			return
		}
		
		if(cate2Arr == ""){
			input_code.value = parseInt(parent1)+1000
		}
			input_code.value = parseInt(parent1)+count2*1000+1000
			input_parent1.value = parent1	
			input_parent2.value = null
	}else if(radio3.checked){
		if(parent2 == ""){
			alert('중분류 카테고리를 먼저 선택해주세요.')
			radio2.checked = true
			handleRadioChange()
			return
		}	
		if(cate3Arr == ""){
			input_code.value = parseInt(parent2)+1
		}

		input_code.value = parseInt(parent2)+count3*1+1
		input_parent2.value = parent2
	}
		
}
 

	function inputCheck() {
		
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

</script>


<!-- <script type="text/javascript">
	function codeCheck() {

		var isCheck = document.getElementById("new_category_code").value;
		$.ajax({
			url : "./admin_category_codeCheck.do",
			type : "post",
			data : {
				code : isCheck
			},
			success : function(res) {

				var isSpace = /^[0-9]+$/;

				if (isCheck.match(isSpace) == null) {
					alert("카테고리 코드를 입력하세요.");
					document.getElementById("new_category_code").focus();
					return false;
				}

				if (res == 0) {
					alert("등록 가능한 카테고리코드입니다.")
					document.getElementByid("isCheck").value = "Y";
				} else {
					alert("중복되는 카테고리 코드가 존재합니다.")
					document.getElementByid("isCheck").focus();

				}

				location.href("admin_insert_category.do")
			},
			error : function() {
				alert("에러")
			}
		});
	}

	function inputCheck() {
		
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
</script> -->

</html>