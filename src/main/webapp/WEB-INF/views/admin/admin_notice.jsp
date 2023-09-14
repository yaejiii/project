<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@include file="admin_top.jsp" %>

<div class="d-flex justify-content-center align-items-center" style="margin-top:30px;">
	<div style="float:left; padding:10px;">
		<button onClick="location.href='admin_write_notice_board.do'" class="btn btn-dark"  style="border-radius: 0">공지사항 등록하기</button>
	</div> 
</div>
<div style="clear:both;">
</div>
<div class="container-fluid" style="width:80%;">
	<div>
		<hr style="margin:10px 0px; padding:0px;">
	</div>
		<c:if test="${empty list_notice}"> 
			<div style="text-align:center;margin: 30px 0px ;">
				등록된 공지사항이 없습니다.
			</div> 
		</c:if>
	
	<c:forEach var="dto" items="${list_notice}">
		<c:set var="rowNum" value="${rowNum}"/>
		<div class="d-flex align-itmes-center justiry-content-center" >
			<div class="col-1" style="margin:3px 0px; padding: 40px 10px ;text-align:left;">
				${rowNum}
			</div>
			<c:set var="rowNum" value="${rowNum-1}"/>	
			<div class="col-9" style="margin:3px 0px; padding: 40px 10px ;text-align:left; vertical-align: middle;">
				<div>
				<a href="admin_content_notice_board.do?num=${dto.notice_board_num}"> ${dto.notice_board_subject}</a>
				</div>
			</div>
			<div class="col-2" style="margin:3px 0px; padding: 30px 10px ;text-align:right;">
				<div><strong>${dto.notice_board_writer}</strong></div>
				<div style="margin-top:15px;">${dto.notice_board_input_date}</div>
			</div>
		</div>

		<div>
			<hr style="color:gray">
		</div>
	</c:forEach>
	<div style="margin-top:10px; text-align:center;">
		<strong>
 			<c:if test="${count>0}">
				<c:if test="${startPage > pageBlock}">
	 				<a href="admin_notice.do?pageNum=${startPage-pageBlock}"> 
	 					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="10" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
							<path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
	 					</svg>
					</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="admin_notice.do?pageNum=${i}">&nbsp;&nbsp;${i}&nbsp;&nbsp;</a>
				</c:forEach>
				<c:if test="${endPage < pageCount}">
					<a href="admin_notice.do?pageNum=${startPage+pageBlock}">
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
			<select style="width:100%; border: solid black 1px; padding:12px; margin-top:10px">
				<option>일주일</option>
				<option>한달</option>
				<option>세달</option>
				<option>전체</option>
			</select>
		</div>
		<div class="col-sm-12 col-md-2">
			<select style="width:100%; border: solid black 1px; padding:12px; margin-top:10px">
				<option>제목</option>
				<option>내용</option>
				<option>글쓴이</option>
				<option>아이디</option>
				<option>별명</option>
			</select>
		</div>
		<div class="col-sm-12 col-md-6">
			<input style="width:100%; border: solid black 1px; padding:10px; margin-top:10px">
		</div>
		<div class="col-sm-12 col-md-2" style="margin-bottom:50px;">
			<button class="btn" style="border-radius:0; width:100%; margin-top:10px; padding:15px;" type="submit">검색</button>
		</div>
	</div>
</div>
