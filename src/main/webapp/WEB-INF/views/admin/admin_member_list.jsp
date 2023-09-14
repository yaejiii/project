<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
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
 
function deleteMember(){
	 
	 var memDel = confirm("해당 회원을 탈퇴 및 삭제하시겠습니까?");
	 if(memDel){
	 	//alert("삭제확인")
	 	var del = document.getElementsByName('RowCheck');
	 	const arr = [];
	 	for(i=0;i<del.length;++i){
			if(del[i].checked == true) {
				arr.push(del[i].value);
				//alert(del[i].value)
			}
		}
	 	
		$.ajax({
			
			url : './admin_member_delete.do',
			type : 'post',
			data : {
				list : JSON.stringify(arr)
			},
			cache : false,
			success : function(res){
				//alert("진짜여기")
					location.href='admin_member_list.do'
			}
		});  
	 
	 
 } 
 }
 
function moveBlackList(mode){
	
	var isBlack = confirm('해당 회원을 이동시키겠습니까?')
	if(isBlack){
			
			var mode = document.getElementById('mode').value;
			var black = document.getElementsByName('RowCheck');
			
			const arr2=[];
			for(i=0;i<black.length;++i){
				if(black[i].checked == true){
							arr2.push(black[i].value);
														
					
				}
			}
			if(arr2 == null || arr2 == ""){
				alert("이동할 회원을 체크해주세요.")
				return;
			}
			//alert(arr2[0]) 
			 $.ajax({
				url : './admin_member_moveBlackList.do',
				type : 'post',
				data : {
					dlist : JSON.stringify(arr2),
					mode : mode
				},
				cache : false,
				success : function(res){
				
				 if(res==1){ 				 	
				 		location.href='admin_member_list.do'					 
				 }
				 if(res==-1){
					 location.href='admin_member_list.do?mode=Y'
				 }
				 if(res==0){
					 alert("에러")
					 
				 }
				}
			});  		
		 
	}
	}
	
	
	
valueVal = $("#dropdown-select").val();     
valueVal2 = $("#dropdown-select > option:selected").attr("value2");
valueVal3 = $("#dropdown-select > option:selected").attr("value3");


 </script>
<div class="container">
	<div>
		<p style="font-weight: bold; font-size: 30px;'">회원정보 조회</p>
	</div>
	<table class="table table-bordered"
		style="border: 2px solid #000000; text-align: center;">
		<tbody>
			<tr>
				<form name="f" action="admin_member_search.do" method="post"
					role="search" onsubmit="return check()">
					<input type="hidden" name="mode" value="${mode}">
					<td class="table-light">개인정보</td>
					<td colspan="3">
						<div class="d-flex align-items-center">
							<select id="dropdown-select" name="search" class="form-select" style ="width:40%;display:inline;"
								onchange="handleDropdownChange(this)">
								<option value="id">아이디</option>
								<option value="email">이메일</option>
								<option value="hp1" value2="hp2" value3= "hp3" >전화번호</option>
								<option value="nickname">닉네임</option>
								<option value="address">주소</option>
							</select> <input type="text" name="searchString" style="margin: 5 5px;">

						</div>

					</td>
			</tr>

			<tr>
				<td class="table-light">회원등급</td>
				<td>
					<ul>
						<select class="option-name" name="rating"
							style="margin-right: 5px">
							<option value="bronze">브론즈 회원</option>
							<option value="silver">실버 회원</option>
							<option value="gold">골드 회원</option>
						</select>
					</ul>
				</td>

	
			</tr>
			<tr>
				<td class="table-light">성별</td>
				<td>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="gender"
							id="gender" value="all" checked> <label
							class="form-check-label" for="inlineRadio2">전 체</label>
					</div>		
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="gender"
							id="gender" value="male"> <label
							class="form-check-label" for="inlineRadio2">남</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="gender"
							id="gender" value="female"> <label
							class="form-check-label" for="inlineRadio2">여</label>
					</div>
					
					</td>
						<td>
						<button type="submit" class="btn btn-dark"
							style="border-radius: 1">검색</button>
						</form>
						</td>			
				</tr>


			
		</tbody>
		
		
		
	</table>






	<div>
		<p style="font-weight: bold; font-size: 20px;'">회원 목록</p>
	</div>
	<div>[총 회원수 n명] 검색 결과 n 건</div>
	<table class="table table-bordered"
		style="border: 2px solid #000000; text-align: center;">
		<tbody>
			<tr>
				<td colspan="9"><c:if test="${mode =='N' }">
						<button onclick="moveBlackList('${mode}')" class="btn btn-dark"
							style="border-radius: 1; float: left; margin: 1px;">불량회원
							설정</button>
					</c:if> <c:if test="${mode=='Y' }">
						<button onclick="moveBlackList('${mode}')" class="btn btn-dark"
							style="border-radius: 1; float: left; margin: 1px;">일반회원
							설정</button>
					</c:if>
					<button onclick="deleteMember()" class="btn btn-dark"
						style="border-radius: 1; float: left; margin: 1px;">
						탈퇴/삭제</button> <!-- 		<div style="float: right;">
						<select id="dropdown-select" name="search"
							onchange="handleDropdownChange(this)">
							<option value="content">10개씩 보기</option>
							<option value="content">20개씩 보기</option>
							<option value="content">30개씩 보기</option>
							<option value="content">50개씩 보기</option>
							<option value="content">100개씩 보기</option>
						</select>
					</div> --></td>
			</tr>

			<tr>


				<th>
					<!--   <div class="form-check"> --> <input type="checkbox"
					id="allCheck" name="allCheck" />전체선택 <!--        <label class="form-check-label" for="flexCheckDefault">
		                </label> -->

				</th>

				<td>등록일</td>
				<td>이름</td>
				<td>아이디</td>
				<td>등급</td>
				<td>휴대전화</td>
				<td>성별</td>
				<td>생년월일</td>
				<td>이메일</td>
			</tr>
			<c:if test="${empty  listMember}">
				<tr>

					<td colspan="9">검색된 회원 내역이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty listMember }">

				<c:forEach var="dto" items="${listMember}">
						<c:if test ="${memInfo.member_num != dto.member_num}">
					<tr>
						<th><input type="checkbox" name="RowCheck" value="${dto.id}">
							<!-- 	 <label class="form-check-label" for="flexCheckDefault">
		                </label>       --></th>
						<td>${dto.join_date}</td>
						<td>${dto.name }</td>
						<td>${dto.id}</td>
						<td>${dto.member_rating}</td>
						<td>${dto.hp1}-${dto.hp2}-${dto.hp3}</td>
						<td>${dto.gender}</td>
						<td>${dto.birth_year}/${dto.birth_month}/${dto.birth_day}</td>
						<td>${dto.email}</td>
						
						
						
					</tr>

						</c:if>
				</c:forEach>
		



			</c:if>

		</tbody>
		
	
		
	</table>
	
	<input type="hidden" id="mode" value="${mode}">
	
		<div>					
<c:if test="${count >0}">
			<c:if test="${mode != 'Y'}">
				<c:if test="${startPage > pageBlock}">
					[<a href="admin_member_list.do?pageNum=${startPage - 1}">이전</a>]	
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					[<a href="admin_member_list.do?pageNum=${i}">${i}</a>]		
				</c:forEach>
				<c:if test="${endPage < pageCount}">
					[<a href="admin_member_list.do?pageNum=${endPage+1}">다음</a>]
				</c:if>
			</c:if>	
</c:if>
	
		<c:if test="${count >0}">
			<c:if test="${mode == 'Y'}">
				<c:if test="${startPage > pageBlock}">
					[<a href="admin_member_list.do?mode=Y&pageNum=${startPage - 1}">이전</a>]	
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					[<a href="admin_member_list.do?mode=Y&pageNum=${i}">${i}</a>]		
				</c:forEach>
				<c:if test="${endPage < pageCount}">
					[<a href="admin_member_list.do?mode=Y&pageNum=${endPage+1}">다음</a>]
				</c:if>
			</c:if>
</c:if>	
</div>
</div>
	
</body>
</html>