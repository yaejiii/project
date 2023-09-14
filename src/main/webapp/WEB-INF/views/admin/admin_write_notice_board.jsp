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

<form action="admin_write_notice_board.do" method="post">
    <div class="container-fluid" style="width:80%;">

    <div class="row d-flex" style="flex-wrap: nowrap;">
      <div class="col-1 col-lg-3"></div>
      <div class="col-10 col-lg-6" style="text-align:center; padding:10px;min-width:250px; max-width:1000px;">
      <div style="margin:3px 0px;">
        <input class="input" name="notice_board_subject" style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" placeholder="제목">
      </div>
  <div style="margin:3px 0px;">
 
   <textarea name="notice_board_content" id="editor" placeholder="게시글을 작성하세요.">
    </textarea>
    <script>
        ClassicEditor
            .create( document.querySelector( '#editor' ) )
            .catch( error => {
                console.error( error );
            } );
    </script>
    </div>

<div style="margin-bottom:50px;"><button type="submit" class="btn s-btn" style="width:100%">글쓰기</button></div>
    </div>      
      <div class="col-1 col-lg-3"></div>
      </div>
    </div>
</form>	
