<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../mall_client/mall_index_top.jsp" %>

<link href="resources/star.css" rel="stylesheet"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="resources/add_images.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Sortable/1.13.0/Sortable.min.js"></script>

<form name="" action="">
 	<div class="container-fluid" style="width:80%;">
 		<div class="row" style=" justify-content: center; flex-wrap:nowrap;">
	      <div class="col-1 col-lg-3"></div>
	      <div class="col-10 col-lg-6" style="text-align:center; padding:10px;min-width:250px; max-width:500px;">후기작성
	      <div style="margin:3px 0px;">
	        <input class="input" style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" placeholder="키(cm)">
	      </div>
	      <div style="margin:3px 0px;">
	     <input class="input" style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" placeholder="몸무게(kg)">
	    </div>
	    <div style="margin:3px 0px; padding: 0px 10px ;text-align:left;"> 
		  <fieldset class="rate">
		    <input type="radio" id="rating5" name="score" value="5"><label for="rating5" title="5점"></label>
		    <input type="radio" id="rating4" name="score" value="4"><label for="rating4" title="4점"></label>
		    <input type="radio" id="rating3" name="score" value="3"><label for="rating3" title="3점"></label>
		    <input type="radio" id="rating2" name="score" value="2"><label for="rating2" title="2점"></label>
		    <input type="radio" id="rating1" name="score" value="1"><label for="rating1" title="1점"></label>
		  </fieldset>
	  <p style="font-size:11px">별점을 선택해주세요.</p>
	    </div>
	  <div style="margin:3px 0px;">
	  <textarea id="textarea" onkeyup="resizeTextarea()" style="border: black solid 1px; width:100%; padding:10px; margin:10px 0px; resize: none;
	            overflow: hidden;" placeholder="리뷰내용을 작성해주세요."></textarea>
		</div>
	<div style="margin:3px 0px;">
		<div id="drop-zone" style="padding:10px; margin:10px 0px;">
			<input type="file" id="file-input" accept="image/*" multiple >
				<label for="file-input" class="image-drag-and-drop-label">이곳에 후기 이미지 파일을 드래그 앤 드롭하거나 클릭하여 파일을 선택하세요.</label>
					<div id="image-preview" class="image-preview"></div>
		</div>
	</div>
	<div><button id="submit-button">글쓰기</button></div>
 </div>      
 <div class="col-1 col-lg-3"></div>
</div>
</div>
    
	<input type="hidden" name="member_num" value="1">
	<input type="hidden" name="product_num" value="1">
	<input type="hidden" id="imagesArray" name="imagesArray">
	</form>	

<script>
        function resizeTextarea() {
            const textarea = document.getElementById("textarea");
            textarea.style.height = "auto"; // 초기 높이로 재설정
            textarea.style.height = textarea.scrollHeight + "px"; // 스크롤 높이만큼 조절
        }
    </script>

<%@include file="../mall_client/mall_index_bottom.jsp" %>