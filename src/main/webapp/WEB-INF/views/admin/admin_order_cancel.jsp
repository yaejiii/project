<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  admin_order_list.jsp -->
<%@include file="admin_top.jsp" %>
<link rel="stylesheet" href="resources/css/admin_order_list.css?after">
<head>
<script src="resources/js/plugin/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
 
 
 $(function() {
     fn_default_datepicker();
});
     
function fn_default_datepicker()
{
 var start = $( "#datepicker_start" ).datepicker({
     dateFormat: 'y/mm/dd' //Input Display Format 변경
     ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
     ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
     ,changeYear: true //콤보박스에서 년 선택 가능
     ,changeMonth: true //콤보박스에서 월 선택 가능                
     //,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
     //,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
     //,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
     ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
     ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
     ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
     ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
     ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
     ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
     ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
     ,maxDate: "+5Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
 });
     
 var end = $( "#datepicker_end" ).datepicker({
     dateFormat: 'y/mm/dd' //Input Display Format 변경
     ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
     ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
     ,changeYear: true //콤보박스에서 년 선택 가능
     ,changeMonth: true //콤보박스에서 월 선택 가능                
     //,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
     //,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
     //,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
     ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
     ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
     ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
     ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
     ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
     ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
     ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
     ,maxDate: "+5Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
        ,defaultDate: "+1w"
   });
 
 //초기값을 오늘 날짜로 설정
 $('#datepicker_start').datepicker('setDate', '-7D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
 $('#datepicker_end').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
}

function getDate( element ) {
 var date;
 var dateFormat = "yy-mm-dd";
 try {
   date = $.datepicker.parseDate( dateFormat, element.value );
 } catch( error ) {
   date = null;
 }
 return date;
}
 
$(document).ready(function(){
    
    $("#datepicker_start").on("click",function(){
        
    });
 
     $("#datepicker_start").on("change",function(e){
         var end = $( "#datepicker_end" ).datepicker( "option", "minDate", getDate( e.target ) );
     });
     
     $("#datepicker_end").on("change",function(e){
         
     });
     
     $("#date_search").on("click",function(){
         var start = $("#datepicker_start").val();
         var end = $("#datepicker_end").val();
     });    
});

function check() {
	
	if (document.f.searchString.value == "") {
		alert("검색할 내용을 입력하세요.")
		document.f.searchString.focus()

		return false
	}
	document.f.submit()
}

 
 
 </script>


<body>
  		
		
									<tr>
						
								<form name="f" action="admin_order_cancel_search.do" method="post"
									>
							
									<div class="row">
										<div class="col" align="center" style="padding: 10px 10px">
												<select name="search">							
												<option value="order_history_num">주문번호</option>
												<option value="order_history_password">주문패스워드</option>											
											</select> <input type="text"
												name="searchString" placeholder="검색할 내용을 입력하세요...">																							
								
								</tr>
								<tr>
								
													
       <div class="ui-grid-b">
     
        <div class="ui-block-c">
        </div>
    </div>
    <div class="ui-grid-b">
    
        <div class="ui-block-a">주문 시작일
            <input type="text" name = "datepicker_start" id="datepicker_start" readonly="readonly">
        </div>
 
  
        <div class="ui-block-b">주문 마지막일
            <input type="text" name = "datepicker_end" id="datepicker_end" readonly="readonly">
        </div>
      
        <div class="ui-block-c">
        
           <button type="submit" onclick = "check()" class="btn btn-dark">검색</button>
											<button type="reset" class="btn btn-dark">초기화</button>
		   </form>
        </div>
        
    </div>
    </tr>
								
								
								
								<!-- <th scope="row">상품분류</th>
												<td >
													<ul >
														<li>
															<select class="option-name" style="margin-right:5px">
																<option value="productname">상품명</option>
																
															</select>
                                                          <select class="option-name" style="margin-right:5px">
																<option value="productname">상품명</option>
																
															</select>
                                                          <select class="option-name" style="margin-right:5px">
																<option value="productname">상품명</option>
																
															</select>
                                                          <select class="option-name">
																<option value="productname">상품명</option>
																
															</select>
														</li>
													</ul>
												</td>
                                           
								 -->
						
                                   <!--    <tr>
										<th scope="row">상품등록일</th>
												<td>
													<ul>
														<li>
															<select class="option-name" style="margin-right:5px">
																<option value="productname">상품명</option>
																
															</select>
                                                          <select class="date" style="margin-right:5px">
																<option value="productname" >상품명</option>
																
															</select>
                                                          <select class="date" style="margin-right:5px">
																<option value="productname">상품명</option>
																
															</select>
                                                          <select class="#" style="margin-right:5px">
																<option value="productname">상품명</option>
																
															</select>
                                                          <select class="#" style="margin-right:5px">
																<option value="productname">상품명</option>
																
															</select>
                                                          <select class="#">
																<option value="productname">상품명</option>
																
															</select>
														</li>
													</ul> -
												</td>
										</tr>
				
					
								</tbody>
							</table>
						</div>
					</div>
				</form>
              
			</div>
	
	</div> 
	
	

    <div class="container">
      <div class="row">
        <div class="col-12">상품목록</div>

        <div class="col-8">[총 n개]</div>

   

        <!-- <div class="col-2">
          <select
            id="dropdown-select"
            name="search"
            class="form-select"
            onchange="handleDropdownChange(this)"
          >
            <option value="content">10개씩 보기</option>
            <option value="content">20개씩 보기</option>
            <option value="content">30개씩 보기</option>
            <option value="content">50개씩 보기</option>
            <option value="content">100개씩 보기</option>
          </select>
        </div> -->



      <div class="row">
        

        <div class="col-12">
          <table class="table">
            <thead>
            <th><a href  ="admin_order_cancel.do">전체목록으로</a></th>
              <tr>
              
                 <th>
                 
	              <!--   <div class="form-check"> -->
		               <input  type="checkbox"  id ="allCheck" name = "allCheck"/>전체선택
		          <!--        <label class="form-check-label" for="flexCheckDefault">
		                </label> -->
	                 </div> 
                </th>
                <th>주문번호</th>
                <th>총합 금액</th>
                <th>사용 포인트</th>
                <th>주문패스워드</th>
                <th>주문날짜</th>
          		<th>할인적용금액</th>
          		<th>배송비</th>  
                        
              </tr>
            </thead>
            <tbody>
              <tr>
            
                <c:if test = "${empty listOrderCancel}">
                <td colspan = "8" align = "center">주문 취소 목록이 존재하지 않습니다.</td>
              
                </c:if>
                
                <c:if test = "${not empty listOrderCancel }">
                 <c:forEach var = "dto" items = "${listOrderCancel}" >
               <td>   
                             		                            
		                  <input  type="checkbox" name="RowCheck"  value = "${dto.order_history_num}" >
		            <!-- 	 <label class="form-check-label" for="flexCheckDefault">
		                </label>       -->
		                                              
                </td>  
                <td><a href ="admin_order_view.do?order_history_num=${dto.order_history_num}">${dto.order_history_num}</td>
                <td>${dto.total_price}</td>
                <td>${dto.used_point }</td>
                <td>${dto.order_history_password}</td>
                <td>${dto.order_history_date}</td>      
                <td>${dto.discount}</td>      
                <td>${dto.delivery_fee}</td>             
              </tr>
			</c:forEach>
			</c:if>
            </tbody>
          </table>
        </div>
   </div>
     
    </div>
<div>
<c:if test="${count >0}">
			<c:if test="${mode != 'Y'}">
				<c:if test="${startPage > pageBlock}">
					[<a href="admin_order_cancel.do?pageNum=${startPage - 1}">이전</a>]	
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					[<a href="admin_order_cancel.do?pageNum=${i}">${i}</a>]		
				</c:forEach>
				<c:if test="${endPage < pageCount}">
					[<a href="admin_order_cancel.do?pageNum=${endPage+1}">다음</a>]
				</c:if>
			</c:if>	
</c:if>
</div>
<!-- 	</form> -->
</body>
</html>