<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../mall_client/mall_index_top.jsp" %>

<script type="text/javascript">
function updateSpan(radio) {
      	  var selectedValue = radio.value;
       	  var outputSpan = document.getElementById('sort_by');
       	  outputSpan.textContent = selectedValue;
        	}

/* 체크박스 클릭 시, div 보이기 */
 var checkbox = document.getElementById("sort_by_product");
var content = document.getElementById("content");

checkbox.addEventListener("change", function() {
  if (checkbox.checked) {
    content.style.display = "block";
  } else {
    content.style.display = "none";
  }
});

/* 드랍다운 */
document.addEventListener("DOMContentLoaded", function() {
	  var dropdownBtn = document.querySelector(".dropdown-btn");
	  var dropdownMenu = document.querySelector(".dropdown-menu");

	  dropdownBtn.addEventListener("click", function() {
	    dropdownMenu.classList.toggle("show");
	  });

	  var dropdownLinks = dropdownMenu.getElementsByTagName("a");
	  for (var i = 0; i < dropdownLinks.length; i++) {
	    dropdownLinks[i].addEventListener("click", function() {
	      dropdownMenu.classList.remove("show");
	    });
	  }
	});

/* 링크 누르면 해당하는 순서대로 리스트 데이터 불러오기 */
var links = [
	  { text: "최신순 -date 기준 내림차순 ", url: "https://www.example.com/link1" }, 
	  { text: "별점순 -score 기준 내림차순", url: "https://www.example.com/link2" },
	  { text: "추천순 -recommand 기준 내림차순", url: "https://www.example.com/link3" }
	];

/* 	function fetchData(url) {
	  // Ajax로 데이터를 주고받는 로직을 구현합니다.
	  // 예시로서 fetch API를 사용하여 데이터를 가져오는 방식을 사용합니다.
	  return fetch(url)
	    .then(response => response.json())
	    .then(data => {
	      // 데이터를 받아온 후에 원하는 동작을 수행합니다.
	      console.log(data);
	    })
	    .catch(error => {
	      // 에러 처리를 수행합니다.
	      console.error(error);
	    });
	} */
	
/* 화면 줄어들면  링크 셀렉트로 줄이기*/
	function updateLayout() {
	  var container = document.getElementById("container");
	  var windowWidth = window.innerWidth;

	  if (windowWidth >= 768) {
	    var linkElements = "";

	    for (var i = 0; i < links.length; i++) {
	      linkElements += '<a href="' + links[i].url + '" style=' + '"font-size:13px; padding:10px;' + '">' + links[i].text + '</a>';
	    }

	    container.innerHTML = linkElements;
	  } else {
	    var selectElement = document.createElement("select");

	    for (var i = 0; i < links.length; i++) {
	      var option = document.createElement("option");
	      option.text = links[i].text;
	      option.value = links[i].url;
	      selectElement.add(option);
	    }

	    selectElement.addEventListener("change", function() {
	      var selectedUrl = selectElement.value;
	      if (selectedUrl) {
	        fetchData(selectedUrl);
	      }
	    });

	    container.innerHTML = "";
	    container.appendChild(selectElement);
	  }
	}

	window.addEventListener("DOMContentLoaded", updateLayout);
	window.addEventListener("resize", updateLayout);

</script>

<div class="d-flex justify-content-center align-items-center" style="margin-top:30px;">
	<div style="float:left; padding:10px;">
		<a href="fanda.do" style="font-size:15px;" class="link-dark"> 자주묻는 질문</a>
	</div> 
	<div style="float:left;padding:10px;">
		<a href="" style="font-size:15px;" class="link-dark">챗봇문의 </a>
	</div> 
	<div style="float:left;padding:10px;">
		<a href="notice.do" style="font-size:15px;" class="link-dark">공지사항 </a>
	</div> 
	<div style="float:left;padding:10px;">
		<a href="review.do"style="font-size:15px; text-decoration: underline;" class="link-dark" > 제품 후기</a>
	</div> 
</div>

<!-- 컨테이너 시작 -->
<div class="container-fluid" style="width:80%; margin:30px auto;">

	<div class=row style="max-width:900px;">
		<div><h2>REVIEW | 전체리뷰</h2></div>
	</div>
		<div>
			<hr style="border: solid 1px black; color: black; background: black;">
		</div>

	<div class="row">
		<div class="col-5" id="container"></div>
		<div class="col-4" style="text-align:right;"><input type="radio"> 상품별 리뷰 보기</div>
		<div class="col-3" style="text-align:right;"> 
			<form class="d-flex">
				<button class="btn btn-transparant" style="padding: 10px; width: 30px; border: solid black 1px; border-right: 0; border-radius: 0;" type="submit">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
    					<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
  					</svg>
				</button>
				<input style="padding: 10px; border: solid black 1px; border-left: 0; border-radius: 0; width:100%;" type="search" placeholder="리뷰 키워드 또는 상품 검색" aria-label="Search">
			</form>
		</div>
	<div>
		<hr>
	</div>
	
	<div class="dropdown">
		<button class="dropdown-btn" style="padding:10px; border:0px; background-color:transparent;">전체 카테고리
			<svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
				<path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
			</svg>
		</button>
		<div class="dropdown-menu" style="padding:10px; font-size:12px;">
			<a href="https://www.example.com">최신순</a><br>
	    	<a href="https://www.example.com">별점순</a><br>
	    	<a href="https://www.example.com">추천순</a><br>
		</div>
	</div>

<div><hr></div>

 <c:if test="empty list_review"> 
	<div style="text-align: center;">
		<p>
			리뷰가 없습니다. <br>리뷰를 작성해보세요!
		</p>
		<button class="btn s-btn" style="border-radius: 0">상품 리뷰
			작성하기</button>
	</div>
</c:if>
<%-- <c:forEach var="dto" items="${list_review}">  --%>
	<div>
		<hr>
	</div>
	<div class="row">
		<div class="col-8" >
			<c:if test="${is_new}">
				<div>
					<span class="badge bg-secondary">NEW</span>
				</div>
 			</c:if>
			<div class="float-start" style="padding: 5px 0px;"><h3>${score_review}별점
 						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  <path
								d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
</svg>
 						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  <path
								d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
</svg>
 						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  <path
								d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
</svg>
 						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  <path
								d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
</svg>
 						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  <path
								d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
</svg>
 </h3>
 </div>
			<div class="float-end" style="text-align: right;">${date}날짜</div>
			<div style="clear: both;"></div>
			
          <a href="detail_product.do?prod_num=${prod_num}">
				<div class="float-start" >
					<img src="resources/images/${path}/${product_thumnail_image}"
						style="width: 48px; height: 48px;">
				</div>
				<div class="float-none">
					<div style="padding: 5px;">${product_name}상품명</div>
					<div style="padding: 5px;">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  <path
								d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
</svg>
						평점5.0${ave_score} 리뷰 ${count_review}개수
					</div>
            </div></a>
				<div style="clear: both;"></div>

					<div style="padding: 20px 0px;"><pre>${content_review}리뷰내용</pre></div>
					
						<div class="float-start">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-hand-thumbs-up"
								viewBox="0 0 16 16">
  <path
									d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z" />
</svg>
							도움돼요</div>
						<div class="d-flex float-start" style="padding: 5px 10px;">
							<div class="vr"></div>
						</div>
						<div class="float-none">
							<a class="link-secondary" data-bs-toggle="collapse"
								href="#collapseExample" role="button" aria-expanded="false"
								aria-controls="collapseExample"> 댓글 
								<svg xmlns="http://www.w3.org/2000/svg" width="5px" height="5px" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
							  		<path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
								</svg>
							</a>
						</div>
						<div style="clear:both"></div>
					
					<div class="collapse" id="collapseExample">
						<div>
							<hr>
							<textarea class="form-control" id="textarea" onkeyup="resizeTextarea()" placeholder="댓글을 작성해 주세요." style="resize: none; overflow: hidden;"></textarea>
						</div>
                      <div>
                        <input type="submit" style="width:100%; border: solid 1px black; background:transparent; font-size:11px;padding:10px; margin-top:10px;">
                      </div>
                    </div>

					</div>
					
					<div class="col-1 d-flex justify-content-center">
						<div class="vr"></div>
					</div>
					<div class="col-3 text-start" style="min-size:200px">
						<div style="padding: 5px 0px;">${member_name}님의 리뷰입니다.</div>
                      	<div style="padding: 5px 0px;"><strong>키</strong> ${height}cm</div>
						<div style="padding: 5px 0px;"><strong>몸무게</strong> ${weight}kg</div>
						<div style="padding: 5px 0px;"><strong>구매 사이즈</strong> ${size}</div>
					</div>
                    <div>
                    <hr></div>
				</div>
<%-- </c:forEach>
 --%></div>

<!-- 페이	징 -->
<div style="margin-top: 20px;">
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

<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<%@include file="../mall_client/mall_index_bottom.jsp" %>