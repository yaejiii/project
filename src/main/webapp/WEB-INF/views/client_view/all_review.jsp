<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../mall_client/mall_index_top.jsp" %>
    <link rel="stylesheet" media="all" href="https://assets9.cre.ma/latte/assets/pc/application-578223ee960686070b8a2ae8cb3a6426fd06c633a3975c04405ae1f25304bbfe.css">
<script>
function repleToggle() {
  var reple_div = document.getElementById("reple_div");
  
  if (reple_div.style.display === "none") {
	  reple_div.style.display = "block";
  } else {
	  reple_div.style.display = "none";
  }
}

function resizeTextarea() {
    const textarea = document.getElementById("textarea");
    textarea.style.height = "auto"; // 초기 높이로 재설정
    textarea.style.height = textarea.scrollHeight + "px"; // 스크롤 높이만큼 조절
}

function heightToggle() {
	  var review_comment = document.getElementById("review_comment");
	  
	  if (review_comment.style.height === "18px") {
		  review_comment.style.height = "100%";
	  } else {
		  review_comment.style.height = "18px";
	  }
	}

</script>
    <!--  <script>
      function fimg(id, w, h) {
        var img = document.getElementById(id);
        if(img && !img.complete) {
          var width = img.width || img.offsetWidth;
          img.style.height = Math.round(img.width / w * h) + "px";
          img.onload = function() {
            this.style.height = "";
          }
        }
      }
    </script> -->


    <div id="i18n" style="display: none" data-image-size-too-large="첨부한 이미지 파일이 너무 큽니다. 더 작은 이미지를 첨부해주세요." data-close="닫기" data-error-403="접근 권한이 없습니다." data-error-404="요청하신 페이지를 찾을 수 없습니다." data-error-422="요청이 거부되었습니다." data-error-etc="요청을 처리하던 중 오류가 발생했습니다. 조속히 해결하겠습니다." data-image-field-cant-add-photo-without-file-input="파일 선택창이 없어 사진을 추가할 수 없습니다." data-image-field-cant-add-photo-without-file-reader="파일 미리 보기가 지원되는 브라우저가 아니어서 사진을 추가할 수 없습니다." data-image-field-cant-add-photo-without-file="선택된 파일이 없어 사진을 추가할 수 없습니다." data-image-field-cant-add-photo-with-file-type="선택된 파일이 이미지 형식이 아닙니다. (선택된 형식:%{file_type})" data-image-field-cant-add-photo-with-file-name="이미지 형식의 파일만 첨부할 수 있습니다. (선택된 파일명:%{file_name})" data-app-restrict-image-upload="파일 업로드를 하려면 모바일 기본브라우저에서 쇼핑몰 모바일웹(%{url})으로 접속해주세요." data-review-already-posted="이미 리뷰를 작성한 상품입니다." data-review-already-largest-image="현재 이미지가 원본 크기입니다." data-require-update-app="원활한 사진첨부를 위해서 앱 업데이트가 필요합니다. 업데이트 하시겠습니까?" data-input-prompt="값을 입력해주세요."></div>


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


    <div id="content">
        <div class="reviews_index reviews_index--list js-pagination-list  reviews_index--renewed">
    <div class="reviews_index__head">
      
  <div class="widget_header_basic">
  <div class="widget_header_basic__title_container">
    
      <span class="widget_header_basic__title js-translate-text">
        <strong>REVIEW</strong><span class="divider">|</span>전체 리뷰
      </span>
    
    
 <div class="widget_header_basic__description">
      <span></span>
    </div>
  </div>
  <div class="widget_header_basic__links_container">
    
    
  </div>
</div>


<div class="js-renewed-products-reviews-summary">
  
</div>


<div class="filter_sort_basic menu">
  <ul class="
    filter_sort_basic__sort_search_list
    filter_sort_basic__sort_search_list--review_searchable
  ">
    <li class="filter_sort_basic__sort">
      
        <ul class="filter_sort_basic__sort_list js-review-sort-list" data-path="/covernat.net/reviews?aloading=.page&amp;app=0&amp;group=0&amp;iframe=1&amp;iframe_id=crema-reviews-1&amp;parent_url=https%3A%2F%2Fcovernat.net%2Fboard%2Fproduct%2Flist.html%3Fboard_no%3D4%26crema-reviews-1-group%3D0&amp;secure_device_token=V21662b320d641885d14a82eb87c9a87f46d12348449f1dd2061c0f9d6e4deffd32fb8e25021b535b47cf0b5b564c3472c&amp;widget_env=100&amp;widget_id=1">
  
    <li class="
        filter_sort_basic__sort_list_item
        filter_sort_basic__sort_list_item--selected
        js-review-sort-list-item
      " data-value="20">
      최신순

      
        
          <div class="filter_sort_basic__sort_desc">
            <div class="filter_sort_basic__sort_desc_title">
              리뷰 정렬 기준
            </div>
            <div class="filter_sort_basic__sort_desc_message">
              ‘최신순’ 정렬은 최신 리뷰를 우선으로 정렬합니다.
            </div>
          </div>
        
      
        
      
        
      
    </li>
  
    <li class="
        filter_sort_basic__sort_list_item
        
        js-review-sort-list-item
      " data-value="30">
      별점순

      
        
      
        
          <div class="filter_sort_basic__sort_desc">
            <div class="filter_sort_basic__sort_desc_title">
              리뷰 정렬 기준
            </div>
            <div class="filter_sort_basic__sort_desc_message">
              ‘별점순’ 정렬은 별점이 높은 리뷰를 우선으로 정렬합니다.
            </div>
          </div>
        
      
        
      
    </li>
  
    <li class="
        filter_sort_basic__sort_list_item
        
        js-review-sort-list-item
      " data-value="10">
      추천순
        
          <div class="filter_sort_basic__sort_desc">
            <div class="filter_sort_basic__sort_desc_title">
              리뷰 정렬 기준
            </div>
            <div class="filter_sort_basic__sort_desc_message">
              ‘추천순’ 정렬은 쇼핑몰 추천 리뷰와 고객들에게 도움이 많이 된 리뷰를 우선으로 정렬합니다.
            </div>
          </div>
        
      
    </li>
  
</ul>

      

      <div class="dropdown_component filter_sort_basic__sort_dropdown js-dropdown-component" data-path="/covernat.net/reviews?aloading=.page&amp;app=0&amp;group=0&amp;iframe=1&amp;iframe_id=crema-reviews-1&amp;parent_url=https%3A%2F%2Fcovernat.net%2Fboard%2Fproduct%2Flist.html%3Fboard_no%3D4%26crema-reviews-1-group%3D0&amp;secure_device_token=V21662b320d641885d14a82eb87c9a87f46d12348449f1dd2061c0f9d6e4deffd32fb8e25021b535b47cf0b5b564c3472c&amp;widget_env=100&amp;widget_id=1" data-name="sort" data-box-offset-x="8">
  <div class="
  dropdown_button_component
  js-dropdown-button
">
  
  
    
      최신순
    
  
  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 8 8" class="dropdown_button_component__arrow js-dropdown-button-arrow">
    <path stroke-linecap="round" stroke-linejoin="round" d="M.667 2.333L4 5.667l3.333-3.334"></path>
</svg>

</div>

   <script type="text/x-jquery-tmpl" class="js-dropdown-box-script">
    <div
  class="
    dropdown_box_component
    filter_sort_basic__sort_dropdown
    js-dropdown-box
    hidden
  "
  data-dropdown-type="radio"
>
  <div class="dropdown_box_component__item_wrapper">
    
    
    
      

  <div
    data-value="20"
    class="
      dropdown_box_component__radio_select_item
      js-dropdown-box-radio-select-item
      notranslate
      dropdown_box_component__radio_select_item--selected
    "
  >
    최신순
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__radio_button">
    <rect width="14" height="14" x="2" y="2" rx="7.5"></rect>
    <rect width="6" height="6" x="6" y="6" stroke="none" fill="#fff" rx="3"></rect>
</svg>

  </div>

  <div
    data-value="30"
    class="
      dropdown_box_component__radio_select_item
      js-dropdown-box-radio-select-item
      notranslate
      
    "
  >
    별점순
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__radio_button">
    <rect width="14" height="14" x="2" y="2" rx="7.5"></rect>
    <rect width="6" height="6" x="6" y="6" stroke="none" fill="#fff" rx="3"></rect>
</svg>

  </div>

  <div
    data-value="10"
    class="
      dropdown_box_component__radio_select_item
      js-dropdown-box-radio-select-item
      notranslate
      
    "
  >
    추천순
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__radio_button">
    <rect width="14" height="14" x="2" y="2" rx="7.5"></rect>
    <rect width="6" height="6" x="6" y="6" stroke="none" fill="#fff" rx="3"></rect>
</svg>

  </div>


    
  </div>
  
  
    <div class="
      dropdown_box_component__radio_select_item
      dropdown_box_component__radio_select_item--custom
      js-dropdown-box-radio-select-item
    ">
      
  <div class="review_sort_description js-review-sort-description" data-url="/covernat.net/review_sort_descriptions?group_by=0&amp;media_reviews_first=false&amp;widget_env=100&amp;widget_id=1">
    <div class="review_sort_description__description_container">
      <a>
        <span class="review_sort_description__description">
          리뷰 정렬 기준
        </span>
        <span class="review_sort_description__icon"></span>
      </a>
    </div>
  </div>


    </div>
  
</div>

  </script>
   
</div>

    </li>
    
      <li class="
        filter_sort_basic__search
        js-filter-search-component
        js-search-toggle
        
      ">
        
          
  <div class="filter_sort_basic__search_input_container">
    
    
    <input type="text" placeholder="리뷰 키워드 또는 상품 검색" style="border:0px; padding: 0px; margin-left:30px; margin-top:0px;">
    <button class="
        filter_sort_basic__search_close_button
        js-filter-search-input-icon
        js-filter-search-input-reset
        hidden
      ">
      <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18" class="filter_sort_basic__search_input_icon">
    <path stroke-linecap="round" stroke-linejoin="round" d="M2.207 2.25L15.75 15.793"></path>
    <path stroke-linecap="round" stroke-linejoin="round" d="M0.5 -0.5L19.652 -0.5" transform="scale(-1 1) rotate(45 -10.966 -18.792)"></path>
</svg>

    </button>
    <a data-path="/covernat.net/reviews?aloading=.page&amp;app=0&amp;group=0&amp;iframe=1&amp;iframe_id=crema-reviews-1&amp;parent_url=https%3A%2F%2Fcovernat.net%2Fboard%2Fproduct%2Flist.html%3Fboard_no%3D4%26crema-reviews-1-group%3D0&amp;secure_device_token=V21662b320d641885d14a82eb87c9a87f46d12348449f1dd2061c0f9d6e4deffd32fb8e25021b535b47cf0b5b564c3472c&amp;widget_env=100&amp;widget_id=1" class="
        filter_sort_basic__search_submit_button
        js-filter-search-input-icon
        js-filter-search-trigger
        
      ">
      <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="none" viewBox="0 0 18 18" class="filter_sort_basic__search_input_icon">
    <rect width="10.5" height="10.5" x="2.25" y="2.25" stroke-width="1.5" rx="5.25"></rect>
    <path stroke-width="1.5" d="M11.78 11.47L16.28 15.97"></path>
</svg>

    </a>
  </div>

        
      </li>
    
    
      <li class="filter_sort_basic__show_review_per_products">
        
        <a href="/covernat.net/reviews?aloading=.page&amp;app=0&amp;group=1&amp;iframe=1&amp;iframe_id=crema-reviews-1&amp;parent_url=https%3A%2F%2Fcovernat.net%2Fboard%2Fproduct%2Flist.html%3Fboard_no%3D4%26crema-reviews-1-group%3D0&amp;secure_device_token=V21662b320d641885d14a82eb87c9a87f46d12348449f1dd2061c0f9d6e4deffd32fb8e25021b535b47cf0b5b564c3472c&amp;widget_env=100&amp;widget_id=1" data-remote="true">
          <div class="
  toggle_button_component
  js-toggle-button-component
  filter_sort_basic__toggle_button
  js-toggle-button
  
">
  
      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="toggle_button_component__icon toggle-check-off">
    <rect width="18.5" height="18.5" x="2.75" y="2.75" stroke-width="1.5" rx="9.25"></rect>
    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M7 12l4 4 6-7"></path>
</svg>

      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 16 16" class="toggle_button_component__icon toggle-check-on">
    <rect width="12.333" height="12.333" x="1.833" y="1.833" rx="6.167"></rect>
    <path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" d="M4.667 8l2.666 2.667 4-4.667"></path>
</svg>

    
  <span>상품별 리뷰 보기</span>
</div>

        </a>
      </li>
    
  </ul>
  
  <div class="filter_sort_basic__filter_wrapper">
    <ul class="filter_sort_basic__filter_list js-filter-list">
      
        
          
  <li class="
    filter_sort_basic__filter
    
  ">
    
    <div class="filter_button_component      js-filter-button-component">
  <div class="dropdown_component  js-dropdown-component" data-path="/covernat.net/reviews?aloading=.page&amp;app=0&amp;group=0&amp;iframe=1&amp;iframe_id=crema-reviews-1&amp;parent_url=https%3A%2F%2Fcovernat.net%2Fboard%2Fproduct%2Flist.html%3Fboard_no%3D4%26crema-reviews-1-group%3D0&amp;secure_device_token=V21662b320d641885d14a82eb87c9a87f46d12348449f1dd2061c0f9d6e4deffd32fb8e25021b535b47cf0b5b564c3472c&amp;widget_env=100&amp;widget_id=1" data-name="category_id" data-box-offset-x="">
  <div class="
  dropdown_button_component
  js-dropdown-button
">
  
  
    
      
        전체  카테고리
      
    
  
  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 8 8" class="dropdown_button_component__arrow js-dropdown-button-arrow">
    <path stroke-linecap="round" stroke-linejoin="round" d="M.667 2.333L4 5.667l3.333-3.334"></path>
</svg>

</div>

  <script type="text/x-jquery-tmpl" class="js-dropdown-box-script">
    <div
  class="
    dropdown_box_component
    
    js-dropdown-box
    hidden
  "
  data-dropdown-type="radio"
>
  <div class="dropdown_box_component__item_wrapper">
    
      <div class="
        dropdown_box_component__title
        
      ">
        카테고리
      </div>
      <div class="
        dropdown_box_component__reset_button
        js-dropdown-box-reset
      ">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 16 16" class="dropdown_box_component__reset_icon">
    <path stroke-linecap="round" stroke-linejoin="round" d="M14.667 7.667L12.56 9.792l-2.105-2.125"></path>
    <path stroke-linecap="round" stroke-linejoin="round" d="M6.948 13.333c-3.101 0-5.615-2.537-5.615-5.666C1.333 4.537 3.847 2 6.949 2c3.1 0 5.614 2.537 5.614 5.667v1.416"></path>
</svg>

        <span class="dropdown_box_component__reset_text">
          초기화
        </span>
      </div>
    
    
    
      
  <div
    data-value=""
    class="
      dropdown_box_component__radio_select_item
      js-dropdown-box-radio-select-item
      dropdown_box_component__radio_select_item--selected
    "
  >
    전체  카테고리
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__radio_button">
    <rect width="14" height="14" x="2" y="2" rx="7.5"></rect>
    <rect width="6" height="6" x="6" y="6" stroke="none" fill="#fff" rx="3"></rect>
</svg>

  </div>


  <div
    data-value="32"
    class="
      dropdown_box_component__radio_select_item
      js-dropdown-box-radio-select-item
      notranslate
      
    "
  >
    ACC
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__radio_button">
    <rect width="14" height="14" x="2" y="2" rx="7.5"></rect>
    <rect width="6" height="6" x="6" y="6" stroke="none" fill="#fff" rx="3"></rect>
</svg>

  </div>

  <div
    data-value="550"
    class="
      dropdown_box_component__radio_select_item
      js-dropdown-box-radio-select-item
      notranslate
      
    "
  >
    WOMAN
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__radio_button">
    <rect width="14" height="14" x="2" y="2" rx="7.5"></rect>
    <rect width="6" height="6" x="6" y="6" stroke="none" fill="#fff" rx="3"></rect>
</svg>

  </div>

  <div
    data-value="632"
    class="
      dropdown_box_component__radio_select_item
      js-dropdown-box-radio-select-item
      notranslate
      
    "
  >
    MEN
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__radio_button">
    <rect width="14" height="14" x="2" y="2" rx="7.5"></rect>
    <rect width="6" height="6" x="6" y="6" stroke="none" fill="#fff" rx="3"></rect>
</svg>

  </div>

  <div
    data-value="633"
    class="
      dropdown_box_component__radio_select_item
      js-dropdown-box-radio-select-item
      notranslate
      
    "
  >
    COLLECTION
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__radio_button">
    <rect width="14" height="14" x="2" y="2" rx="7.5"></rect>
    <rect width="6" height="6" x="6" y="6" stroke="none" fill="#fff" rx="3"></rect>
</svg>

  </div>

  <div
    data-value="637"
    class="
      dropdown_box_component__radio_select_item
      js-dropdown-box-radio-select-item
      notranslate
      
    "
  >
    OUTLET
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__radio_button">
    <rect width="14" height="14" x="2" y="2" rx="7.5"></rect>
    <rect width="6" height="6" x="6" y="6" stroke="none" fill="#fff" rx="3"></rect>
</svg>

  </div>


    
  </div>
  
  
</div>

  </script>
   
</div>

</div>

  </li>

        
        
          
  
    <li class="
      filter_sort_basic__filter
      
    ">
      
      <div class="filter_button_component      js-filter-button-component">
  <div class="dropdown_component  js-dropdown-component" data-path="/covernat.net/reviews?aloading=.page&amp;app=0&amp;group=0&amp;iframe=1&amp;iframe_id=crema-reviews-1&amp;parent_url=https%3A%2F%2Fcovernat.net%2Fboard%2Fproduct%2Flist.html%3Fboard_no%3D4%26crema-reviews-1-group%3D0&amp;secure_device_token=V21662b320d641885d14a82eb87c9a87f46d12348449f1dd2061c0f9d6e4deffd32fb8e25021b535b47cf0b5b564c3472c&amp;widget_env=100&amp;widget_id=1" data-name="scores" data-box-offset-x="">
  <div class="
  dropdown_button_component
  js-dropdown-button
">
  
  
    
      별점
    
  
  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 8 8" class="dropdown_button_component__arrow js-dropdown-button-arrow">
    <path stroke-linecap="round" stroke-linejoin="round" d="M.667 2.333L4 5.667l3.333-3.334"></path>
</svg>

</div>

  <script type="text/x-jquery-tmpl" class="js-dropdown-box-script">
    <div
  class="
    dropdown_box_component
    
    js-dropdown-box
    hidden
  "
  data-dropdown-type="score"
>
  <div class="dropdown_box_component__item_wrapper">
    
      <div class="
        dropdown_box_component__title
        
      ">
        별점
      </div>
      <div class="
        dropdown_box_component__reset_button
        js-dropdown-box-reset
      ">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 16 16" class="dropdown_box_component__reset_icon">
    <path stroke-linecap="round" stroke-linejoin="round" d="M14.667 7.667L12.56 9.792l-2.105-2.125"></path>
    <path stroke-linecap="round" stroke-linejoin="round" d="M6.948 13.333c-3.101 0-5.615-2.537-5.615-5.666C1.333 4.537 3.847 2 6.949 2c3.1 0 5.614 2.537 5.614 5.667v1.416"></path>
</svg>

        <span class="dropdown_box_component__reset_text">
          초기화
        </span>
      </div>
    
    
    
      
  <div
    data-value="5"
    data-selected="false"
    class="
      dropdown_box_component__score_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    <div class="dropdown_box_component__svg_score">
      <div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #F8E71C">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #F8E71C">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #F8E71C">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #F8E71C">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #F8E71C">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div>
    </div>
    아주 좋아요
    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__checkbox">
    <rect width="15" height="15" x="1.5" y="1.5" rx="2"></rect>
    <path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" d="M5.25 8.25l3 3L12.75 6"></path>
</svg>

  </div>

  <div
    data-value="4"
    data-selected="false"
    class="
      dropdown_box_component__score_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    <div class="dropdown_box_component__svg_score">
      <div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #F8E71C">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #F8E71C">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #F8E71C">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #F8E71C">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--blank review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #F8E71C">
    <defs>
        <path id="star-empty" fill="#E8E8E8" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-empty"></use>
</svg>
</div>
    </div>
    맘에 들어요
    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__checkbox">
    <rect width="15" height="15" x="1.5" y="1.5" rx="2"></rect>
    <path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" d="M5.25 8.25l3 3L12.75 6"></path>
</svg>

  </div>

  <div
    data-value="3"
    data-selected="false"
    class="
      dropdown_box_component__score_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    <div class="dropdown_box_component__svg_score">
      <div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #F8E71C">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #F8E71C">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #F8E71C">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--blank review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #F8E71C">
    <defs>
        <path id="star-empty" fill="#E8E8E8" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-empty"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--blank review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #F8E71C">
    <defs>
        <path id="star-empty" fill="#E8E8E8" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-empty"></use>
</svg>
</div>
    </div>
    보통이에요
    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__checkbox">
    <rect width="15" height="15" x="1.5" y="1.5" rx="2"></rect>
    <path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" d="M5.25 8.25l3 3L12.75 6"></path>
</svg>

  </div>

  <div
    data-value="2"
    data-selected="false"
    class="
      dropdown_box_component__score_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    <div class="dropdown_box_component__svg_score">
      <div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #F8E71C">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #F8E71C">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--blank review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #F8E71C">
    <defs>
        <path id="star-empty" fill="#E8E8E8" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-empty"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--blank review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #F8E71C">
    <defs>
        <path id="star-empty" fill="#E8E8E8" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-empty"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--blank review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #F8E71C">
    <defs>
        <path id="star-empty" fill="#E8E8E8" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-empty"></use>
</svg>
</div>
    </div>
    그냥 그래요
    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__checkbox">
    <rect width="15" height="15" x="1.5" y="1.5" rx="2"></rect>
    <path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" d="M5.25 8.25l3 3L12.75 6"></path>
</svg>

  </div>

  <div
    data-value="1"
    data-selected="false"
    class="
      dropdown_box_component__score_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    <div class="dropdown_box_component__svg_score">
      <div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #F8E71C">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--blank review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #F8E71C">
    <defs>
        <path id="star-empty" fill="#E8E8E8" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-empty"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--blank review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #F8E71C">
    <defs>
        <path id="star-empty" fill="#E8E8E8" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-empty"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--blank review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #F8E71C">
    <defs>
        <path id="star-empty" fill="#E8E8E8" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-empty"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--blank review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #F8E71C">
    <defs>
        <path id="star-empty" fill="#E8E8E8" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-empty"></use>
</svg>
</div>
    </div>
    별로예요
    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__checkbox">
    <rect width="15" height="15" x="1.5" y="1.5" rx="2"></rect>
    <path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" d="M5.25 8.25l3 3L12.75 6"></path>
</svg>

  </div>


    
  </div>
  
    <div class="dropdown_box_component__footer">
      <div class="
        dropdown_box_component__complete_button
        js-dropdown-box-complete-button
      ">
        <span class="dropdown_box_component__complete_text">완료</span>
      </div>
    </div>
  
  
</div>

  </script>
  
</div>

</div>

    </li>
  

        
      
    </ul>
    
    <div class="filter_sort_basic__reset_button_wrapper">
      <button class="filter_sort_basic__reset_button js-filters-reset-button">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 16 16" class="filter_sort_basic__reset_button_icon">
    <path stroke-linecap="round" stroke-linejoin="round" d="M14.667 7.667L12.56 9.792l-2.105-2.125"></path>
    <path stroke-linecap="round" stroke-linejoin="round" d="M6.948 13.333c-3.101 0-5.615-2.537-5.615-5.666C1.333 4.537 3.847 2 6.949 2c3.1 0 5.614 2.537 5.614 5.667v1.416"></path>
</svg>

      </button>
    </div>
  </div>
</div>

<div class="
    js-reviews_manager
    reviews_manager_v2
    reviews_manager_v2--right_align
    hidden
  ">
  
    

</div>


    </div>
  <div class="reviews_index__body">
      <div class="page">
  <div class="reviews_index__no_data_message"><div class="no_reviews_message_v2">
  <div class="no_reviews_message_v2__text">리뷰가 없습니다.</div>

  
</div>
</div>
  <ul class="reviews_index__reviews reviews">
    
<li class="
    review_list_v2 review_list_v2--collapsed
    renewed_review
    
    js-review-container
  " data-message-initial-rows="1" data-review-content-height="18" data-nonmember-review-check-edit-url="/covernat.net/nonmember_reviews/edit_popup?id=42554&amp;widget_env=100&amp;widget_id=1" data-nonmember-review-check-delete-url="/covernat.net/nonmember_reviews/delete_popup?id=42554&amp;widget_env=100" id="review_42554">
  <div class="review_list_v2__review_lcontent">
    <div class="review_list_v2__review_container">
      
        <div class="review_list_v2__tag_section">
          

  <span class="review_list_v2__tag review_badge__new">NEW</span>








        </div>
      

      <div class="review_list_v2__score_section">
        
          <div class="review_list_v2__score_container">
            <div class="review_list_v2__score_star">
              <div class="crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #F8E71C">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class="crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #F8E71C">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class="crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #F8E71C">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class="crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #F8E71C">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class="crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #F8E71C">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div>
              <span class="visually-hidden">별점: 5${score}점</span>
            </div>
            <div class="review_list_v2__score_text">아주 좋아요${score_ment}</div>
          </div>
        

        <div class="review_list_v2__edit_container">
          
            <div class="review_list_v2__date">2023.6.30${date}</div>
          
          
        </div>
      </div>

      
        
        <div class="review_list_v2__product_section ">
          <a class="review_list_v2__product_link js-link-iframe" data-url="http://covernat.net/product/detail.html?cate_no=1&amp;product_no=4426">
            <div class="review_list_v2__product_container">
              <div class="review_list_v2__product_image_container">
                <img src="//assets9.cre.ma/p/covernat-net/products/00/00/00/48/40/image/extra_small_9334a762c5c03aa9.jpg" class="review_list_v2__product_image smooth" alt="어센틱 필드 캠프 캡 블랙">
              </div>
              <div class="review_list_v2__info_container">
                
                <div class="review_list_v2__product_name">어센틱 필드 캠프 캡 블랙${product_name}</div>
                <div class="review_list_v2__review_info">
                  
                    <span class="review_list_v2__score_icon"><div class="crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #F8E71C">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div></span>
                    <span class="review_list_v2__score">5.0${score}</span>
                  
                  <span class="review_list_v2__reviews_count">리뷰 2{review_rownum}</span>
                </div>
              </div>
            </div>
          </a>
        </div>
      

      
      
        <div class="review_list_v2__content_section">
          <div class="review_list_v2__content_container review_content  js-review-content-container">
            <div class="review_list_v2__content review_content__collapsed">
              <div class="review_list_v2__message_container">
                <div class="review_list_v2__expand_link js-renewal-review-message-link js-renewal-link-expand">
                  <div id="review_comment" class="review_list_v2__message style=" style="height: 18px">
                    사이즈도 넉넉하고 배송도 빨랐어요.<br>재질도 면이 아니라서 요즘 같은 계절에도 잘어울려요. 커버낫 상표가 포인트라 더 좋네요.
                  </div>
                  <div class="mall-link-color review_list_v2__message_link_button">
                    <span class="review_list_v2__expand_link_text" onclick="heightToggle()">리뷰 더보기</span>
                    <span class="review_list_v2__expand_icon"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 8 8" class="review_list_v2__see_more_arrow_icon">
    <path stroke-linecap="round" stroke-linejoin="round" d="M.667 2.333L4 5.667l3.333-3.334"></path>
</svg>
</span>
                  </div>
                </div>
              </div>
            </div>

            <div class="review_list_v2__content review_content__expanded">
              

              <div class="review_list_v2__message_container">
                <div class="review_list_v2__collapse_link js-renewal-review-message-link js-renewal-link-collapse">
                  <div class="review_list_v2__message js-translate-text">
                    사이즈도 넉넉하고 배송도 빨랐어요.<br>재질도 면이 아니라서 요즘 같은 계절에도 잘어울려요. 커버낫 상표가 포인트라 더 좋네요.
                    

                  </div>
                  <div class="mall-link-color review_list_v2__message_link_button">
                    <span class="review_list_v2__collapse_link_text">리뷰 접기</span>
                    <span class="review_list_v2__collapse_icon"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 8 8" class="review_list_v2__see_more_arrow_icon">
    <path stroke-linecap="round" stroke-linejoin="round" d="M.667 2.333L4 5.667l3.333-3.334"></path>
</svg>
</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      

      
        <div class="review_list_v2__image_section">
          <div class="review_media_v2">
  <ul class="review_media_v2__media">
    
    
    
      
      

      <li class="review_media_v2__medium">
        <a class="js-link-fullscreen-popup" data-url="/covernat.net/reviews/42554/photo_review_popup?app=0&amp;group=0&amp;iframe=1&amp;iframe_id=crema-reviews-1&amp;media_index=1&amp;parent_url=https%3A%2F%2Fcovernat.net%2Fboard%2Fproduct%2Flist.html%3Fboard_no%3D4%26crema-reviews-1-group%3D0&amp;parent_widget_id=1&amp;parent_widget_type=0&amp;secure_device_token=V21662b320d641885d14a82eb87c9a87f46d12348449f1dd2061c0f9d6e4deffd32fb8e25021b535b47cf0b5b564c3472c&amp;widget_env=100">
          <div class="
            review_media_v2__medium_container
            
          ">
            <img class="review_media_v2__medium_image js-review-media smooth" alt="사이즈도 넉넉하고 배송도 빨랐어요.
" id="review-list-image-42554-1" src="//assets9.cre.ma/p/covernat-net/reviews/00/00/04/25/54/image1/portrait_4bbd6dc43e962acb.jpg">
            
          </div>
          <!-- <script>
            fimg('review-list-image-42554-1', function(dw){return (dw - 17) * 0.25 - 8;}, 215, 237);
          </script>  -->
          
        </a>
      </li>
    
  </ul>
</div>

        </div>
      

      
      

      

      <div class="review_list_v2__like_section">
        
  <div class="
      review_like_action_v2__like_container
      js-like-action
    " data-like-action-class="review_like_action_v2__like_container" data-url="/covernat.net/reviews/42554/like?widget_env=100">
    <span class="review_like_action_v2__like_total_count js-like-score-total hidden">0</span>
    <a class="review_like_action_v2__like_link js-link-like"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" class="review_like_action_v2__like_icon">
    <path stroke-linecap="round" stroke-linejoin="round" d="M8.725 6.2c-.051.152-.026.32.068.45s.245.207.406.207h3.477c.061 0 .121.006.181.017.55.1.914.626.814 1.175l-.962 5.288c-.087.48-.505.83-.994.83H6.177c-.558 0-1.01-.453-1.01-1.011v-6.24c0-.241.086-.474.243-.657l3.619-4.223c.174-.202.463-.26.702-.141.21.105.312.35.237.573L8.725 6.2zM2.333 14V7.333"></path>
</svg>
<span class="review_like_action_v2__like_text">도움돼요</span><span class="review_like_action_v2__like_count js-like-score-plus">0</span><span class="review_like_action_v2__like_count_text js-like-score-text" style="display: none;">0</span></a>
  </div>


          
          <div class="review_list_v2__comments_info">
            <a class="review_list_v2__comments_expand_link" onclick="repleToggle()"">
              
            <span class="review_list_v2__comments_text">댓글</span>
            <span class="review_list_v2__comments_count js-comments-count">0</span>
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 8 8" class="review_list_v2__small_arrow_icon">
    <path stroke-linecap="round" stroke-linejoin="round" d="M.667 2.333L4 5.667l3.333-3.334"></path>
</svg>

          
            </a>
          </div>
        
      </div>
        <div id="reple_div" class="review_list_v2__comments_container">
        <div>
  <div class="comments_v2__new_comment pc js-comment-form-container js-new-comment">
    <form novalidate="novalidate" class="comments_v2__new_comment_form" data-login-required="true" data-enable-user-comments="true" data-enable-user-comments-alert="관리자만 댓글을 작성할 수 있습니다." action="/covernat.net/comments?renewed_comments=false&amp;widget_env=100&amp;widget_id=1" accept-charset="UTF-8" data-remote="true" method="post">
      <div class="comments_v2__new_comment_container">
        <input name="utf8" type="hidden" value="✓">
        <input value="42554" type="hidden" name="comment[review_id]">
        <input type="hidden" name="tracking_id">
		
        <textarea onkeyup="resizeTextarea()" id="textarea" name="comment[message]" class="comments_v2__new_comment_input" placeholder="댓글을 작성해 주세요." rows="1" autocomplete="off"></textarea>
        
      </div>
      <div class="comments_v2__new_comment_buttons_container js-new-comment-buttons">
        <span class="comments_v2__new_comment_buttons">
          <button class="comments_v2__cancel_button js-new-comment-cancel" type="button">취소</button>
          <button class="comments_v2__submit_button comment_submit_button">등록</button>
        </span>
      </div>
    </form>
  </div>
</div>

        </div>
      
    </div>
  </div>
  <div class="review_list_v2__review_rcontent">
    
      <div class="review_list_v2__user_name_message">
        
        <b>손****${member_name}</b>님의 리뷰입니다.
      </div>
    
    <div class="review_list_v2__options_section">
      
        
  <div class="review_options_v2">
    
      <div class="review_options_v2__option">
        <span class="review_options_v2__name">키</span>
        <span class="review_options_v2__value">170cm</span>
      </div>
    
      <div class="review_options_v2__option">
        <span class="review_options_v2__name">몸무게</span>
        <span class="review_options_v2__value">70kg</span>
      </div>
    
  </div>

        
  <div class="review_options_v2">
    
      <div class="review_options_v2__option">
        <span class="review_options_v2__name">구매 사이즈</span>
        <span class="review_options_v2__value">F</span>
      </div>
    
  </div>


      
    </div>
  </div>

  <div class="review_list_v2__review_separator"></div>
 </li>
    
  </ul>
</div>

        </div>
      
    </div>
  </div>
  <div>
    <c:if test="${count>0}">
		<c:if test="${startPage > pageBlock}">
			<a href="list_review.do?pageNum=${startPage-pageBlock}">&lt;</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="list_review.do?pageNum=${i}">${i}</a>
		</c:forEach>
		<c:if test="${endPage < pageCount}">
			<a href="list_review.do?pageNum=${startPage+pageBlock}">></a>
		</c:if> 
	</c:if>		

  </div>
</div>
<!--      <script src="https://assets9.cre.ma/latte/assets/pc/application-a2437bbd6724a8e78f873f26ecbffd8ec195364b828783aa39a7f30c6d3864b5.js"></script> 
 -->
<script>

 //<![CDATA[

      var ajax_setup_args = {cache: true, dataType: "script", accepts: {
        script: "text/javascript, application/javascript"
      }};
      $.ajaxSetup(ajax_setup_args);
//]]>
</script>    
    <form id="form-upload-image" class="hidden" data-type="json" enctype="multipart/form-data" action="/covernat.net/preview_images/upload?widget_env=100" accept-charset="UTF-8" data-remote="true" method="post">
  <div id="upload-fields-container"></div>
</form>
    
<%@include file="../mall_client/mall_index_bottom.jsp" %>
