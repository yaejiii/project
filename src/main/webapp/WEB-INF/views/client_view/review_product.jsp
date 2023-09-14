<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../mall_client/mall_index_top.jsp" %>


<div class="container-fluid" style="width:80%;">

<nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    <a class="navbar-brand">REVIEW(${count_review})</a>
 <a href="review.do">전체 상품 리뷰 보기</a>

<form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>


<div style="float:left border:solid 1px black">
별점 구현 <br>
${percent_review}%의 구매자가 이 상품을 좋아합니다.
<form name="writeReview" action="write_review.do" method="get">
<input type="hidden" name="product_num" value="${product_num }">
<input type="hidden" name="member_num" value="${member_num }">
<input type="submit" value="상품 리뷰 작성하기">
</form>
</div>
<div style="float:right">
그래프 javascript?<br>
<br>
아주 좋아요${score_string}  ${count_score5}
<br><br>
맘에 들어요  ${count_score4}
<br><br>
보통이에요  ${count_score3}<br><br>
그냥 그래요  ${count_score2}<br><br>
별로예요  ${count_score1}<br>
</div>
<div style="float:clear">
<br>
포토&동영상 (${count_image})| <a href="">전체보기</a> 
<br>
<hr>
최신순 별점순 추천순	<input type="checkbox">포토/동영상 먼저 보기<input type="search" name="search_key" vlaue="리뷰 키워드 검색">
<br><br>  
</div>
<table>
<c:if test="${empty list_review}">
	리뷰가 없습니다.
</c:if>
<%-- <c:forEach var="dto" items="${list_review}"> --%>
<tr><td><div style="float:left">
${dto.score}
<br><br><pre>
${dto.content}
</pre><br><br>
추천하기(를 누르면++recommend)
</div><div style="float:right">
${dto.write_date}
</div>
<div style="float:clear"></div></td><td>
${member_name}님의 리뷰입니다.<br>
키 ${dto.height} <br>
몸무게 ${dto.weight}<br> 
사이즈 ${dto.product_size}</td></tr>
<%-- </c:forEach> --%>
</table>
    <c:if test="${count>0}">
		<c:if test="${startPage > pageBlock}">
			[<a href="list_review.do?pageNum=${startPage-pageBlock}">&lt;</a>]
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			[<a href="list_rebview.do?pageNum=${i}">${i}</a>]
		</c:forEach>
		<c:if test="${endPage < pageCount}">
			[<a href="list_review.do?pageNum=${startPage+pageBlock}">다음</a>]
		</c:if> 
	</c:if>		

</body>
</html>