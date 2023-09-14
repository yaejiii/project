<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../mall_client/mall_index_top.jsp" %>
    
<script type="text/javascript">
function couponDownload(coupon_name) {
	const today = new Date();
	alert(today.toLocaleDateString("kr-KR")+' '+coupon_name+'쿠폰이 발행되었습니다.')

    var id = sessionStorage.getItem('member_id');
	var coupon = document.getElementById("coupon_num").value;;
	var data  = {member_id : id, coupon_num  : coupon };

	$.ajax({
      type		: "POST",
      url 		: "reqBodyPost.do",
      data		:  JSON.stringify(data), 
      success 	: function(res) {
    	      if(res == 1){
    	    	  changeButton()
    	      }
      	console.log(data);
      	
      },
      error		: function(error) {
      	console.log(error);
      }
  });
}
	function changeButton() {
		const target = document.getElementById('issue_coupon_button');
		  target.disabled = true;
	}
</script>    
<div class="container-fluid" style="width:80%;">
	<div class="row d-flex align-items-center" style=" justify-content: center; flex-wrap:nowrap;">
		<div class="col-1 col-lg-3"></div>
			<div class="col-10 col-lg-6" style="text-align:center; padding:10px;min-width:250px; max-width:500px;">
					<div style="margin:30px;">
						<h2>쿠폰 페이지</h2>
					</div>
				      	<div class="d-flex align-items-center" style="height:100%; border: 1px solid black">
<%-- 				  
<%-- 			      	<c:forEach var="dto" items="${list_coupon}">
 --%>				      	<div class="float-start" style="text-align: left; padding:10px;">
							<input type="hidden" id="coupon_num" value="${coupon_num}">
					      	<p>쿠폰이름 ${coupon_name}</p>
					      	<p>할인율(10%25%) ${coupon_discount_value}</p>
					      	<p>사용기한 ${coupon_life_date}</p>
					      	<p>만료일  ${coupon_end_date}</p>
					      	<p>최대할인금액 ${max_discount}</p>
				      	</div>
				      	<div class="float-end mx-auto">
				      		<%-- <c:if test="${member_coupon_num == coupon_num}"> --%>
				      			<button class="btn s-btn" disabled="disabled">다운로드</button>
				      		<%-- </c:if> --%>
<%-- 				      		<c:if test="${member_coupon_num != coupon_num}">
 --%>				      			<button id="issue_coupon_button" class="btn s-btn" onclick="couponDownload(${coupon_name})">다운로드</button>
	<%-- 			      		</c:if> --%>
				      		</div>
				      	</div>
				      	<div style="clear: both;"></div>
<%-- 				    </c:forEach>
 --%>				      	
	      	
	      	
	      	</div>
	    <div class="col-1 col-lg-3"></div>
	</div>
</div>
	      
<%@include file="../mall_client/mall_index_bottom.jsp" %>
	      