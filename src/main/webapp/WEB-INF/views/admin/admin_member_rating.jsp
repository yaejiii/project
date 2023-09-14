<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
 
 
function updateRating(){
	 
	 var update = confirm("해당 회원의 등급을 수정하시겠습니까?");
	 //alert(update)
	 if(update){
		 var rank = document.getElementById('rating2').value;
		 var up = document.getElementsByName('RowCheck');
		 const arr = [];
		 for(i=0;i<up.length;++i){
			 if(up[i].checked == true){
				 	arr.push(up[i].value);
				 	//alert(up[i].value)
	 
			 }
	 
	 }
	 
	 $.ajax({
		 				
		 				url : './admin_member_updateRating.do',
		 				type : 'post',
		 				data : {
		 						list : JSON.stringify(arr),
		 						rank:rank
		 				},
		 				cache : false,
		 				success : function(res){
		 					if(res==1){
		 						alert("수정 완료하였습니다.")
		 						document.getElementsByName('string2').value;
		 						location.reload()
		 					}else{
		 						alert("수정 실패하였습니다.")
		 						document.getElementsByName('string2').focus();
		 						location.href('admin_member_rating.do')				
		 					}
		 							  location.href='admin_member_rating.do'
		 				},
		 				error : function(){
							alert("에러")
		 					
		 				}

		 });
	 }
}	 

function adminUpgradePower(number){

		 var member_num =	Number(number)
		 var check =	confirm("어드민 권한을 부여 하시겠습니까?");
		 //alert(check)
		 if(check){
			 	
			location.href="admin_upgradeAdminPower.do?member_num="+member_num
		 	}else{
		 		alert("취소하였습니다.")
		 	}
		}
	
function adminDowngradePower(number){

	 var member_num =	Number(number)
	 var check =	confirm("일반회원으로 변경 하시겠습니까?");
	 //alert(check)
	 if(check){
		 	
		location.href="admin_downgradeAdminPower.do?member_num="+member_num
	 	}else{
	 		alert("취소하였습니다.")
	 	}
	}



function check() {
	
	if (document.f.searchString.value == "") {
		alert("검색할 내용을 입력하세요.")
		document.f.searchString.focus()

		return false
	}
	document.f.submit()
}



</script>
<div class="container">
	<p style="font-weight: bold; font-size: 30px;'">회원 등급별 관리</p>
	<div>
			<form name="f" action="admin_member_rating.do" method="post" role="search" ">
				<div>
					<table class="table" style="border : 2px solid #000000">
						<tbody>
							<tr>
								<th scope="row">회원 검색</th>
								<td>
									<ul>
										<li><select class="option-name" name ="rating" style="margin-right: 5px">							
												<option value="bronze">브론즈 회원</option>
												<option value="silver">실버 회원</option>
												<option value="gold">골드 회원</option>
										</select></li>
									</ul>				
								<td>
									<ul>
										<li><select class="option-name" style="margin-right: 5px" name ="search">
												<option value="all">전	체</option>
												<option value="id">아이디</option>
												<option value="name">이름</option>
										</select><input type="text" name = "searchString" style="margin: 5 5px;">
<!-- 											<div class="input-group input-group-sm mb-3">
												<input type="text" class="text-size" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"> -->
													<input type = "button" onclick ="check()" value = "검색">
									<!-- 		</div> -->
										
											</li>
									</ul>
								</td>
							</tr>
							
							
							
							
							
							
							
						</tbody>
					</table>
				</div>
			
		</form>
	</div>




	<div class="row">
		<div class="col-12">회원 목록</div>

		
		<div>
			<table class="table" style="border : 2px solid #000000">
				<thead>
					<tr>
						 <th>
	              		<!--   <div class="form-check"> -->
	              				
		                <input  type="checkbox"  id ="allCheck" name = "allCheck"/>전체선택
		          		<!--        <label class="form-check-label" for="flexCheckDefault">
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
					<td>어드민권한여부</td>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty  listMember}">
						<tr>

							<td colspan="9">검색된 회원 내역이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${not empty listMember }">

				<c:forEach var="dto" items="${listMember}">
				<c:if test ="${memInfo.member_num != dto.member_num}">
					<tr>
					      <th>   
                             		                            
		                <input  type="checkbox" name="RowCheck"  value = "${dto.id}" >
		            <!-- 	 <label class="form-check-label" for="flexCheckDefault">
		                </label>       -->                                
               			 </th>  
						<td>${dto.join_date}</td>
						<td>${dto.name }</td>
						<td>${dto.id}</td>
						<td>${dto.member_rating}</td>
						<td>${dto.hp1}-${dto.hp2}-${dto.hp3}</td>
						<td>${dto.gender}</td>
						<td>${dto.birth_year}/${dto.birth_month}/${dto.birth_day}</td>
						<td>${dto.email}</td>
						
						<c:if test="${dto.admin_power == 'admin'}">
						<td>어드민<input type = "button" onclick = "adminDowngradePower(${dto.member_num})" value = "일반회원으로 변경"></td>			
						</c:if>
						<c:if test="${dto.admin_power == 'client'}">
						<td>일반회원
						<input type = "button" onclick = "adminUpgradePower(${dto.member_num})" value = "어드민으로 변경"></td>
						</c:if>
					</tr>
					</c:if>

				</c:forEach>			
			</c:if>			
				</tbody>
			</table>
			<tr align = "center">
			
<c:if test="${count >0}">

			<c:if test="${mode != 'Y'}">
				<c:if test="${startPage > pageBlock}">
					[<a href="admin_member_rating.do?pageNum=${startPage - 1}">이전</a>]	
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					[<a href="admin_member_rating.do?pageNum=${i}">${i}</a>]		
				</c:forEach>
				<c:if test="${endPage < pageCount}">
					[<a href="admin_member_rating.do?pageNum=${endPage+1}">다음</a>]
				</c:if>
			</c:if>	
</c:if>

			
			</tr>
			
			
			
			<p style="font-weight: bold; font-size: 15px;'">추가 설정</p>
				<table class="table" style="border : 2px solid #000000; height:40px;">
						<tbody>
							<tr>
								<th scope="row">회원등급변경</th>
							<td>
									<ul>
										<li>선택된 회원을<select class="option-name" style="margin-right: 5px" id="rating2"name="rating2">							
										<option value="bronze">브론즈 회원</option>
										<option value="silver">실버 회원</option>
										<option value="gold">골드 회원</option>
								</select>으로<button onclick="updateRating()" class="btn btn-dark" style="border-radius: 1; maring:5 5px;">등급변경</button>합니다.</li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
		</div>
		
		
		
	</div>
</div>

</body>
</html>