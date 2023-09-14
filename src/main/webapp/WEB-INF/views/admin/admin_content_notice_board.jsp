<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="admin_top.jsp" %>

<script type="text/javascript">
	function checkDel(notice_board_num){
		var isDel = window.confirm("공지사항을 삭제하시겠습니까?")
		if (isDel) {
			document.f.notice_board_num.value = notice_board_num
			document.f.submit()
		}
	}
</script>

<style>
table, table tbody, table tr td{
	border : 1px solid #D2D2D2;
}

thead {
	background-color : #E2E2E2;
}
</style>

<div class="d-flex justify-content-center align-items-center" style="margin-top:50px;">
</div>

<div style="clear:both;"></div>

    <div class="container-fluid" style="width:80%; font-size:12px">
      <div>
          <div>
            <strong style="min-width:70px; display:inline-block; padding:5px;">제목</strong>
            ${content.notice_board_subject}
          </div>
          <div>
            <strong style="min-width:70px; display:inline-block; padding:5px;">작성자</strong>
            ${content.notice_board_writer} <c:if test="${memInfo.admin_power == 'admin' }"><span>(ip: ${content.notice_board_writer_ip})</span></c:if>
          </div>
          <div>
            <strong style="min-width:70px; display:inline-block; padding:5px;">작성일</strong>
            ${content.notice_board_input_date}
          </div>
<%--           <div>
            <strong style="min-width:70px; display:inline-block; padding:5px;">조회</strong>
            ${content.notice_board_readcount}
          </div> --%>
        </div>
      
      <div style="margin:10px 0px; padding: 50px 20px; text-align:left; border: solid black 1px;"> ${content.notice_board_content}</div>
  	  <div style="margin-top:30px;"></div>
  	  
<!-- 		<div class="col-sm-12 col-md-2 float-start" style="margin:3px 10px;"> -->
			<button class="btn btn-transparent" style="border:1px solid black; border-radius:0" onclick="location.href='admin_update_notice_board.do?notice_board_num=${content.notice_board_num}'">수정</button>
			<button class="btn btn-transparent" style="border:1px solid black; border-radius:0" onClick="checkDel('${content.notice_board_num}');">삭제</button>
			
			<button class="btn btn-transparent" style="border:1px solid black; border-radius:0; float: right;" onclick="location.href='admin_notice.do'">목록</button>
<!-- 		</div> -->
        
        <div style="clear:both; margin-bottom:50px;"></div>
</div>

<form name="f" action="admin_delete_notice_board.do" method="post">
	<input type="hidden" name="notice_board_num"/>
</form>