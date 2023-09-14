<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="admin_top.jsp"%>

<head>
<script type="text/javascript" src="resources/js/admin_product_update.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<script type="text/javascript">

//배송변경
function updateStatusDeliver(number,number2){
	 var order_product_num = Number(number);
	 var order_history_num = number2;
	 var isCheck =	confirm("배송중으로 변경하시겠습니까?")
	 if(isCheck){
		 location.href="admin_order_statusDeliver.do?order_product_num="+order_product_num+"&order_history_num="+(order_history_num);
	 	}else{
	 		alert("취소하였습니다.")
	 	}
} 

//환불변경
function orderRefundComplete(number,number2){
	 var order_product_num = Number(number);
	 var order_history_num =number2;
	 var check =	confirm("환불처리완료 로 변경하시겠습니까?")
	 if(check){
		 	
		location.href="admin_order_refundComplete.do?order_product_num="+order_product_num+"&order_history_num="+(order_history_num);
	 	}else{
	 		alert("취소하였습니다.")
	 	}
	}

function orderRefundWaiting(number,number2){
	 var order_product_num = Number(number);
	 var order_history_num = number2;
	 var check =	confirm("환불대기중 으로 변경하시겠습니까?")
	 if(check){
		 	
		location.href="admin_order_refundWaiting.do?order_product_num="+order_product_num+"&order_history_num="+(order_history_num);
	 	}else{
	 		alert("취소하였습니다.")
	 	}
	}
//반품
function orderReturnComplete(number,number2){
	 var order_product_num = Number(number);
	 var order_history_num = number2;
	 var check =	confirm("반품처리완료 로 변경하시겠습니까?")
	 if(check){
		 	
		location.href="admin_order_returnComplete.do?order_product_num="+order_product_num+"&order_history_num="+(order_history_num);
	 	}else{
	 		alert("취소하였습니다.")
	 	}
	}

function orderReturnWaiting(number,number2){
	 var order_product_num = Number(number);
	 var order_history_num = number2;
	 var check =	confirm("반품대기중 으로 변경하시겠습니까?")
	 if(check){
		 	
		location.href="admin_order_returnWaiting.do?order_product_num="+order_product_num+"&order_history_num="+(order_history_num);
	 	}else{
	 		alert("취소하였습니다.")
	 	}
	}
	
//교환
function orderExchangeComplete(number,number2){
	 var order_product_num = Number(number);
	 var order_history_num = number2;
	 var check =	confirm("교환처리완료 로 변경하시겠습니까?")
	 if(check){
		 	
		location.href="admin_order_exchangeComplete.do?order_product_num="+order_product_num+"&order_history_num="+(order_history_num);
	 	}else{
	 		alert("취소하였습니다.")
	 	}
	}

function orderExchangeWaiting(number,number2){
	 var order_product_num = Number(number);
	 var order_history_num = number2;
	 var check =	confirm("교환대기중 으로 변경하시겠습니까?")
	 if(check){
		 	
		location.href="admin_order_exchangeWaiting.do?order_product_num="+order_product_num+"&order_history_num="+(order_history_num);
	 	}else{
	 		alert("취소하였습니다.")
	 	}
	}
	
//주문	
function orderCancel(number,number2){
	 var order_product_num = Number(number);
	 var order_history_num = number2;
	 var check =	confirm("주문취소 로 변경하시겠습니까?")
	 if(check){
		 	
		location.href="admin_order_orderCancel.do?order_product_num="+order_product_num+"&order_history_num="+(order_history_num);
	 	}else{
	 		alert("취소하였습니다.")
	 	}
	}

function orderProceeding(number,number2){
	 var order_product_num = Number(number);
	 var order_history_num = number2;
	 var check =	confirm("주문진행중 으로 변경하시겠습니까?")
	 if(check){
		 	
		location.href="admin_order_orderProceeding.do?order_product_num="+order_product_num+"&order_history_num="+(order_history_num);
	 	}else{
	 		alert("취소하였습니다.")
	 	}
	}

function goList(){
	
	var go = confirm("주문목록으로 이동하시겠습니까?")
	if(go){
		
		location.href="admin_order_list.do"
	}else{
		alert("취소하였습니다.")
	}
}


</script>
<div>
	<p style="font-weight: bold; font-size: 30px;'">주문 상세 내역</p>
</div>
<form name="f" action="admin_category_insert.do" method="post" >
	<div class="container">
		<div class="row">
			<c:forEach var = "gdto" items = "${getListOrderProd}" >
			<input type="hidden" value="${gdto.order_history_num}" name="order_history_num">
			<table class="table table-bordered">
				<thead>
					<tr>
						<td class="table-light">상품구매번호</td>
						<td><input type="text" style="width: 100%;" name="order_product_num" value="${gdto.order_product_num}" readOnly></td>
					</tr>
					<tr>
						<td class="table-light">상품 번호</td>
						<td><input type="text" style="width: 100%;" name="product_num" value="${gdto.product_num}" readOnly></td>
					</tr>
					<tr>
						<td class="table-light">주문 번호</td>
						<td><input type="text" style="width: 100%;" name="order_history_num" value="${gdto.order_history_num } "readOnly></td>
					</tr>
					<tr>
						<td class="table-light">송장 번호</td>
						<td><input type="text" style="width: 100%;" name="tracking_number" value="${gdto.tracking_number}"readOnly></td>
					</tr>
						<tr>
						<td class="table-light">상품 구매 가격</td>
						<td><input type="text" style="width: 100%;" name="order_product_price" value="${gdto.order_product_price}"readOnly></td>
					</tr>
					<tr>
						<td class="table-light">구매한 상품 개수</td>
						<td><input type="text" style="width: 100%;" name="order_product_qty" value="${gdto.order_product_qty}"readOnly></td>
					</tr>	
					<tr>
						<td class="table-light">구매한 상품 상태</td>
						<td><input type="text" style="width: 100%;" name="order_product_status" value="${gdto.order_product_status}" readOnly>
						<c:if test="${gdto.order_product_status eq '환불대기중' }">
                		<input type="button"	 value = "환불처리완료 로 변경" onclick = "orderRefundComplete('${gdto.order_product_num}','${gdto.order_history_num}')" >       
              			</c:if>
                		<c:if test="${gdto.order_product_status eq '환불처리완료' }">
                		<input type="button"	 value = "환불대기중으로 변경" onclick = "orderRefundWaiting('${gdto.order_product_num}','${gdto.order_history_num}')" > 
                		</c:if>
						<c:if test="${gdto.order_product_status eq '반품대기중' }">
               			<input type="button"	 value = "반품처리완료 로 변경" onclick = "orderReturnComplete('${gdto.order_product_num}','${gdto.order_history_num}')" >    
              			</c:if>
                		<c:if test="${gdto.order_product_status eq '반품처리완료' }">
                		<input type="button"	 value = "반품대기중으로 변경" onclick = "orderReturnWaiting('${gdto.order_product_num}','${gdto.order_history_num}')" > 
                		</c:if>
						<c:if test="${gdto.order_product_status eq '교환대기중' }">
                		<input type="button"	 value = "교환처리완료 로 변경" onclick = "orderExchangeComplete('${gdto.order_product_num}','${gdto.order_history_num}')" >   
              			</c:if>
                		<c:if test="${gdto.order_product_status eq '교환처리완료' }">
               			<input type="button"	 value = "교환대기중으로 변경" onclick = "orderExchangeWaiting('${gdto.order_product_num}','${gdto.order_history_num}')" > 
                		</c:if>
						<c:if test="${gdto.order_product_status eq '주문진행중' }">
                		<input type="button"	 value = "주문취소 로 변경"  onclick = "orderCancel('${gdto.order_product_num}','${gdto.order_history_num}')" >  
              			</c:if>
                		<c:if test="${gdto.order_product_status eq '주문취소' }">
               			<input type="button"	 value = "주문진행중으로 변경" onclick ="orderProceeding('${gdto.order_product_num}','${gdto.order_history_num}')" > 
               			</c:if>
               			<c:if test = "${gdto.order_product_status eq '배송준비중' }">
                		<input type="button"  value= "배송중으로 변경" onclick = "updateStatusDeliver('${gdto.order_product_num}','${gdto.order_history_num}')" > 
                		</c:if>  
						</td>
					
					</tr>
				</c:forEach>		
				<br></br>
				</thead>

			</table>
		</div>
	</div>
	<div align="center">
	
		<td><input type ="button" value = "주문목록으로"  onclick = "goList()"></td>
		
	</div>


</form>
</body>
</html>
