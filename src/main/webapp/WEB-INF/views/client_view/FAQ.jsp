<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../mall_client/mall_index_top.jsp" %>

<div class="d-flex justify-content-center align-items-center" style="margin-top:30px;">
	<div style="float:left; padding:10px;">
		<a href="list_faq.do" style="font-size:15px; text-decoration: underline;" class="link-dark"> 자주묻는 질문</a>
	</div> 
	<div style="float:left;padding:10px;">
		<a href="" style="font-size:15px;" class="link-dark">챗봇문의 </a>
	</div> 
	<div style="float:left;padding:10px;">
		<a href="notice.do" style="font-size:15px;" class="link-dark">공지사항 </a>
	</div> 
	<div style="float:left;padding:10px;">
		<a href="review.do"style="font-size:15px;" class="link-dark"> 제품 후기</a>
	</div> 
</div>

<div style="clear:both;"></div>
    <div class="container-fluid" style="width:80%; margin-top:30px;">
      <div ><hr style="margin:10px 0px; padding:0px;"></div>
		<c:forEach var="dto" items="${list_faq}">
			<a data-bs-toggle="collapse" href="#collapse_map_api">

				<c:set var="rowNum" value="${rowNum}"/>
		      <div class="row" >
  	 			<div class="col-2" style="margin:3px 0px; padding: 0px 10px ;text-align:left;"> ${rownum}</div>
  	 			<c:set var="rowNum" value="${rowNum-1}"/>
   				<div class="col-8" style="margin:3px 0px; padding: 0px 10px ;text-align:left;"> ${dto.faq_board_subject}</div>
				<div class="col-2">
  					<div>{member_name}</div>
       					<div>${dto.faq_board_input_date}</div>
				</div>
	  			</div>
  				<div>
  					<hr>
  				</div>
			</a>
	    <div class="collapse" id="collapse_map_api">
      		<div style="margin:5px 0px;">
      			${dto.faq_board_content}      
      		<div><hr></div>
      		<c:if test="${memInfo.admin_power == 'admin' }">
			<button class="btn btn-transparent" style="border:1px solid black; border-radius:0" onclick="location.href='admin_update_faq_board.do?faq_board_num=${dto.faq_board_num}'">수정</button>
			<button class="btn btn-transparent" style="border:1px solid black; border-radius:0" onClick="checkDel('${dto.faq_board_num}');">삭제</button>				<div><hr></div>
      		</c:if>
    		</div>
    	</div>
     </c:forEach>
	<div style="margin-top:10px; text-align:center;">
		<strong>
 			<c:if test="${count>0}">
				<c:if test="${startPage > pageBlock}">
	 				<a href="list_faq.do?pageNum=${startPage-pageBlock}"> 
	 					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="10" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
							<path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
	 					</svg>
					</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="list_faq.do?pageNum=${i}">&nbsp;&nbsp;${i}&nbsp;&nbsp;</a>
				</c:forEach>
				<c:if test="${endPage < pageCount}">
					<a href="list_faq.do?pageNum=${startPage+pageBlock}">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="10" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
							<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
						</svg>
					</a>
				</c:if> 
			</c:if>
		</strong>		
	</div>
<div class="row">
	<div class="col-sm-12 col-md-2">
		<form name="search_form" action="search_faq.do" method="post">
			<select name="search_date" style="width:100%; border: solid black 1px; padding:12px; margin-top:10px">
				<option value="week">일주일</option>
	  			<option value="month">한달</option>
	  			<option value="month_3">세달</option>
	  			<option value="all">전체</option>
			</select></div>
		<div class="col-sm-12 col-md-2">
			<select name="search" style="width:100%; border: solid black 1px; padding:12px; margin-top:10px">
				<option value="faq_board_subject">제목</option>
		  		<option value="faq_board_content">내용</option>
		  		<option value="faq_board_wirter">글쓴이</option>
			</select>
		</div>
	<div class="col-sm-12 col-md-6">
		<input name="search_string" style="width:100%; border: solid black 1px; padding:10px; margin-top:10px">
	</div>
		<div class="col-sm-12 col-md-2">
			<button class="btn btn-dark" style="border-radius:0; width:100%; margin-top:10px; padding:15px;" type="submit">검색</button>
		</form>
		</div>
	</div>
</div> 
<script type="text/javascript">
	function checkDel(faq_board_num){
		var isDel = window.confirm("자주묻는질문 게시글을 삭제하시겠습니까?")
		if (isDel) {
			document.f.faq_board_num.value = faq_board_num
			document.f.submit()
		}
	}
</script>
<form name="f" action="admin_delete_faq_board.do" method="post">
	<input type="hidden" name="faq_board_num"/>
</form>
<%@include file="../mall_client/mall_index_bottom.jsp" %>
