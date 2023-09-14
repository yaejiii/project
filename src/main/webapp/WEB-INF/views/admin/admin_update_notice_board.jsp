<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="admin_top.jsp" %>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script>
  ClassicEditor.create( document.querySelector( '#editor' ), {
    language: "ko"
  } );
</script>

<style>
table, table tbody, table tr td{
	border : 1px solid #D2D2D2;
}

thead {
	background-color : #E2E2E2;
}
</style>


<form action="admin_update_notice_board_ok.do" method="post">
<input type="hidden" name="notice_board_num" value="${get_notice_board_content.notice_board_num}"/>
<div class="d-flex justify-content-center align-items-center" style="margin-top:50px;">
</div>

<div style="clear:both;"></div>

    <div class="container-fluid" style="width:80%; font-size:12px">
      <div>
          <div>
            <strong style="min-width:70px; display:inline-block; padding:5px;">제목</strong>
            <input type="text" name="notice_board_subject" value="${get_notice_board_content.notice_board_subject}">
          </div>
          <div>
            <strong style="min-width:70px; display:inline-block; padding:5px;">작성자</strong>
            ${get_notice_board_content.notice_board_writer} <span style="visibility:hidden;">(ip: ${get_notice_board_content.notice_board_writer_ip})</span>
          </div>
          <div>
            <strong style="min-width:70px; display:inline-block; padding:5px;">작성일</strong>
            ${get_notice_board_content.notice_board_input_date}
          </div>
   <%--        <div>
            <strong style="min-width:70px; display:inline-block; padding:5px;">조회</strong>
            ${get_notice_board_content.notice_board_readcount}
          </div> --%>
        </div>
       	
       	

    <div class="container-fluid" style="width:80%;">

    <div class="row d-flex" style="flex-wrap: nowrap;">
      <div class="col-1"></div>
      <div class="col-10" style="text-align:center; padding:10px;min-width:250px; max-width:1000px;">
  <div style="margin:3px 0px; width:100%">
 
   <textarea name="notice_board_content" id="editor" style="width:100%">
   		${get_notice_board_content.notice_board_content}
    </textarea>
    <script>
        ClassicEditor
            .create( document.querySelector( '#editor' ) )
            .catch( error => {
                console.error( error );
            } );
    </script>
    </div>

       	
  	  <div style="margin-top:30px;"></div>
  	  
			<button class="btn btn-transparent" style="border:1px solid black; border-radius:0" onclick="location.href='admin_update_notice_board_ok.do'">수정</button>
			<button class="btn btn-transparent" style="border:1px solid black; border-radius:0;" onclick="location.href='admin_content_notice_board.do'">취소</button>
	
        <div style="clear:both; margin-bottom:50px;"></div>
        </div>
         <div class="col-1"></div>
        </div>
</div>
</form>


