<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../mall_client/mall_index_top.jsp" %>


<div class="container-fluid" style="width:80%;">
<div class="row" style=" justify-content: center; flex-wrap: nowrap;">
<div class="col-1 col-lg-3"></div>
<div class="col-10 col-lg-6" style="width:100%; max-width:800px; text-align:center;">

<h2>적립금</h2>

<div class="input">
	<ul style="text-align:left">
		<li>총 적립금  0원 </li>
		<li>사용가능 적립금 0원 </li>
		<li>사용된 적립금 0원 </li>
		<li>미가용 적립금 0원 </li>
	</ul>
</div>

<div>
<p style="text-align: left;">적립 내역</p>

<table style="border:0px;">
  <tbody>
	<c:if test="${empty list_point}">
		<tr>
        	<td>
        		적립내역이 없습니다.
        	</td>
        </tr>
    </c:if>
   <c:forEach var="dto" items="${list_point}">
      <tr>
        <td>내역</td><td>적요</td><td>날짜</td>
      </tr>
    </c:forEach>
  </tbody>
  </table>

</div>

  <div style="margin-top:10px; text-align:center;"><strong>
   	<%-- <c:if test="${count>0}">
		<c:if test="${startPage > pageBlock}">
	 --%>		<a href="list_reboard.do?pageNum=${startPage-pageBlock}"> 
	 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="10" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
  		<path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
	 </svg> </a>
	<%-- 	</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
	 --%>		<a href="list_reboard.do?pageNum=${i}"> ${i} 1 </a>
		<%-- </c:forEach>
		<c:if test="${endPage < pageCount}"> --%>
			<a href="list_reboard.do?pageNum=${startPage+pageBlock}">
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="10" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
		  <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
		</svg></a>
	<%-- 	</c:if> 
	</c:if> --%>
	</strong>		
</div>


</div>
<div class="col-1 col-lg-3"></div>
</div>
</div>
<%@include file="../mall_client/mall_index_bottom.jsp" %>
