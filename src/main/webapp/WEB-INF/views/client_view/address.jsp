<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../mall_client/mall_index_top.jsp" %>

<script type="text/javascript">
	function checkDel(address_num){
		var isDel = window.confirm("배송지주소를 삭제하시겠습니까?")
		if (isDel) {
			document.f.address_num.value = address_num
			document.f.submit()
		}
	}
</script>

<div class="container-fluid" style="width:80%;">
<div class="row" style="justify-content: center; flex-wrap: nowrap;">
<div class="col-1 col-lg-3"></div>
<div class="col-10 col-lg-6" style="width:100%; max-width:500px; text-align:center; margin-top:30px;">
<h2><strong>주소록 관리</strong></h2>

<c:if test="${empty listAddress}">
<div style="border: black solid 0px; width:100%; padding:10px; margin:30px 0px; text-align:center;">
<strong>등록된 주소가 없습니다.</strong>
</div>
</c:if>

<c:forEach var="dto" items="${listAddress}">
 
<div style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px; text-align:left;">
<c:if test="${dto.rcv_default == 0}">
	<p style="padding:10px 0px 20px 0px;"><strong>기본 배송지</strong></p>
</c:if>

<p style="padding:10px 0px 20px 0px;">${dto.address_name}(${dto.rcv_name})</p>
<p style="padding:5px 0px;">[${dto.zip_code}] ${dto.address} ${dto.address_detail}</p>
<p style="padding:5px 0px;">${dto.rcv_tel1}-${dto.rcv_tel2}-${dto.rcv_tel3} | ${dto.rcv_hp}-${dto.rcv_hp2}-${dto.rcv_hp3}</p>
<p>${dto.rcv_request}</p>


<div class="d-flex justify-content-center align-items-center" style="margin:3px 0px;">
<div class="d-flex justify-content-end align-items-center" style="width:100%; padding:4px; max-width:500px;">
<div class="float-start" style="width:80px;">
<button type="button" class="btn" style="width:100%; padding:14px; margin:10px 0px;" onClick="location.href='edit_address.do?address_num=${dto.address_num}'">수정</button>
</div>
<div class="float-start" style="width:4px;">
</div>
<div class="float-start" style="width:80px">
<button type="button" class="btn" style="width:100%; padding:14px; margin:10px 0px;" onClick="checkDel('${dto.address_num}');">삭제</button>
</div>
</div>
</div> 

</div>
</c:forEach>
<div>
<button type="button" class="btn s-btn" style="width:100%; padding:16.5px; margin:10px 0px;" onClick="location.href='regist_address.do'">등록</button>
</div>
</div>
<div class="col-1 col-lg-3"></div>
</div>
</div>

<form name="f" action="delete_address.do" method="post">
	<input type="hidden" name="address_num"/>
</form>
<%@include file="../mall_client/mall_index_bottom.jsp" %>

