<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../mall_client/mall_index_top.jsp" %>
    <link rel="stylesheet" media="all" href="https://assets9.cre.ma/latte/assets/pc/application-578223ee960686070b8a2ae8cb3a6426fd06c633a3975c04405ae1f25304bbfe.css" />
    
    <script>
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
    </script>


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
        <div class="widget_reviews js-pagination-list ">
  
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
      
        <ul
  class="filter_sort_basic__sort_list js-review-sort-list"
  data-path="/covernat.net/reviews?aloading=.page&amp;app=0&amp;group=1&amp;iframe=1&amp;iframe_id=crema-reviews-1&amp;nonmember_token=5a6cd1d45b2b177aa2652b6030e88644&amp;parent_url=https%3A%2F%2Fcovernat.net%2Fboard%2Fproduct%2Flist.html%3Fboard_no%3D4%26crema-reviews-1-group%3D1%26crema-reviews-1-sort%3D20&amp;secure_device_token=V21662b320d641885d14a82eb87c9a87f46d12348449f1dd2061c0f9d6e4deffd32fb8e25021b535b47cf0b5b564c3472c&amp;widget_env=100&amp;widget_id=1"
>
  
    <li
      class="
        filter_sort_basic__sort_list_item
        filter_sort_basic__sort_list_item--selected
        js-review-sort-list-item
      "
      data-value="20"
    >
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
  
    <li
      class="
        filter_sort_basic__sort_list_item
        
        js-review-sort-list-item
      "
      data-value="40"
    >
      이름순

      
        
      
        
          <div class="filter_sort_basic__sort_desc">
            <div class="filter_sort_basic__sort_desc_title">
              리뷰 정렬 기준
            </div>
            <div class="filter_sort_basic__sort_desc_message">
              ‘이름순’ 정렬은 특수문자 &gt; 숫자 &gt; 영어 &gt; 한글 순으로 정렬합니다.
            </div>
          </div>
        
      
        
      
        
      
    </li>
  
    <li
      class="
        filter_sort_basic__sort_list_item
        
        js-review-sort-list-item
      "
      data-value="50"
    >
      리뷰 많은 순

      
        
      
        
      
        
          <div class="filter_sort_basic__sort_desc">
            <div class="filter_sort_basic__sort_desc_title">
              리뷰 정렬 기준
            </div>
            <div class="filter_sort_basic__sort_desc_message">
              ‘리뷰 많은 순’ 정렬은 리뷰가 많은 상품을 우선으로 정렬합니다.
            </div>
          </div>
        
      
        
      
    </li>
  
    <li
      class="
        filter_sort_basic__sort_list_item
        
        js-review-sort-list-item
      "
      data-value="70"
    >
      판매량순

      
        
      
        
      
        
      
        
          <div class="filter_sort_basic__sort_desc">
            <div class="filter_sort_basic__sort_desc_title">
              리뷰 정렬 기준
            </div>
            <div class="filter_sort_basic__sort_desc_message">
              ‘판매량순’ 정렬은 쇼핑몰에서 최근 판매량이 많은 상품을 우선으로 정렬합니다.
            </div>
          </div>
        
      
    </li>
  
</ul>

      

      <div
  class="dropdown_component filter_sort_basic__sort_dropdown js-dropdown-component"
  data-path="/covernat.net/reviews?aloading=.page&amp;app=0&amp;group=1&amp;iframe=1&amp;iframe_id=crema-reviews-1&amp;nonmember_token=5a6cd1d45b2b177aa2652b6030e88644&amp;parent_url=https%3A%2F%2Fcovernat.net%2Fboard%2Fproduct%2Flist.html%3Fboard_no%3D4%26crema-reviews-1-group%3D1%26crema-reviews-1-sort%3D20&amp;secure_device_token=V21662b320d641885d14a82eb87c9a87f46d12348449f1dd2061c0f9d6e4deffd32fb8e25021b535b47cf0b5b564c3472c&amp;widget_env=100&amp;widget_id=1"
  data-name="sort"
  data-box-offset-x="8"
>
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
    data-value="40"
    class="
      dropdown_box_component__radio_select_item
      js-dropdown-box-radio-select-item
      notranslate
      
    "
  >
    이름순
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__radio_button">
    <rect width="14" height="14" x="2" y="2" rx="7.5"></rect>
    <rect width="6" height="6" x="6" y="6" stroke="none" fill="#fff" rx="3"></rect>
</svg>

  </div>

  <div
    data-value="50"
    class="
      dropdown_box_component__radio_select_item
      js-dropdown-box-radio-select-item
      notranslate
      
    "
  >
    리뷰 많은 순
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__radio_button">
    <rect width="14" height="14" x="2" y="2" rx="7.5"></rect>
    <rect width="6" height="6" x="6" y="6" stroke="none" fill="#fff" rx="3"></rect>
</svg>

  </div>

  <div
    data-value="70"
    class="
      dropdown_box_component__radio_select_item
      js-dropdown-box-radio-select-item
      notranslate
      
    "
  >
    판매량순
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
      
  <div class="review_sort_description js-review-sort-description" data-url="/covernat.net/review_sort_descriptions?group_by=1&amp;media_reviews_first=false&amp;nonmember_token=5a6cd1d45b2b177aa2652b6030e88644&amp;widget_env=100&amp;widget_id=1">
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
    
    
    <input
      type="text" style="border:0px; padding:0px 0px 12px 30px; width:238px;" placeholder="리뷰 키워드 또는 상품 검색">
    <button
      class="
        filter_sort_basic__search_close_button
        js-filter-search-input-icon
        js-filter-search-input-reset
        hidden
      "
    >
      <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18" class="filter_sort_basic__search_input_icon">
    <path stroke-linecap="round" stroke-linejoin="round" d="M2.207 2.25L15.75 15.793"></path>
    <path stroke-linecap="round" stroke-linejoin="round" d="M0.5 -0.5L19.652 -0.5" transform="scale(-1 1) rotate(45 -10.966 -18.792)"></path>
</svg>

    </button>
    <a
      data-path="/covernat.net/reviews?aloading=.page&amp;app=0&amp;group=1&amp;iframe=1&amp;iframe_id=crema-reviews-1&amp;nonmember_token=5a6cd1d45b2b177aa2652b6030e88644&amp;parent_url=https%3A%2F%2Fcovernat.net%2Fboard%2Fproduct%2Flist.html%3Fboard_no%3D4%26crema-reviews-1-group%3D1%26crema-reviews-1-sort%3D20&amp;secure_device_token=V21662b320d641885d14a82eb87c9a87f46d12348449f1dd2061c0f9d6e4deffd32fb8e25021b535b47cf0b5b564c3472c&amp;widget_env=100&amp;widget_id=1"
      class="
        filter_sort_basic__search_submit_button
        js-filter-search-input-icon
        js-filter-search-trigger
        
      "
    >
      <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="none" viewBox="0 0 18 18" class="filter_sort_basic__search_input_icon">
    <rect width="10.5" height="10.5" x="2.25" y="2.25" stroke-width="1.5" rx="5.25"></rect>
    <path stroke-width="1.5" d="M11.78 11.47L16.28 15.97"></path>
</svg>

    </a>
  </div>

        
      </li>
    
    
      <li class="filter_sort_basic__show_review_per_products">
        
        <a href="/covernat.net/reviews?aloading=.page&amp;app=0&amp;group=0&amp;iframe=1&amp;iframe_id=crema-reviews-1&amp;nonmember_token=5a6cd1d45b2b177aa2652b6030e88644&amp;parent_url=https%3A%2F%2Fcovernat.net%2Fboard%2Fproduct%2Flist.html%3Fboard_no%3D4%26crema-reviews-1-group%3D1%26crema-reviews-1-sort%3D20&amp;secure_device_token=V21662b320d641885d14a82eb87c9a87f46d12348449f1dd2061c0f9d6e4deffd32fb8e25021b535b47cf0b5b564c3472c&amp;widget_env=100&amp;widget_id=1" data-remote="true">
          <div class="
  toggle_button_component
  js-toggle-button-component
  filter_sort_basic__toggle_button
  js-toggle-button
  active
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
    
    <div class="
  filter_button_component
  
  js-filter-button-component
">
  <div
  class="dropdown_component  js-dropdown-component"
  data-path="/covernat.net/reviews?aloading=.page&amp;app=0&amp;group=1&amp;iframe=1&amp;iframe_id=crema-reviews-1&amp;nonmember_token=5a6cd1d45b2b177aa2652b6030e88644&amp;parent_url=https%3A%2F%2Fcovernat.net%2Fboard%2Fproduct%2Flist.html%3Fboard_no%3D4%26crema-reviews-1-group%3D1%26crema-reviews-1-sort%3D20&amp;secure_device_token=V21662b320d641885d14a82eb87c9a87f46d12348449f1dd2061c0f9d6e4deffd32fb8e25021b535b47cf0b5b564c3472c&amp;widget_env=100&amp;widget_id=1"
  data-name="category_id"
  data-box-offset-x=""
>
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
    
    <div class="
  filter_button_component
  
  js-filter-button-component
">
  <div
  class="dropdown_component  js-dropdown-component"
  data-path="/covernat.net/reviews?aloading=.page&amp;app=0&amp;group=1&amp;iframe=1&amp;iframe_id=crema-reviews-1&amp;nonmember_token=5a6cd1d45b2b177aa2652b6030e88644&amp;parent_url=https%3A%2F%2Fcovernat.net%2Fboard%2Fproduct%2Flist.html%3Fboard_no%3D4%26crema-reviews-1-group%3D1%26crema-reviews-1-sort%3D20&amp;secure_device_token=V21662b320d641885d14a82eb87c9a87f46d12348449f1dd2061c0f9d6e4deffd32fb8e25021b535b47cf0b5b564c3472c&amp;widget_env=100&amp;widget_id=1"
  data-name="min_product_score"
  data-box-offset-x=""
>
  <div class="
  dropdown_button_component
  js-dropdown-button
">
  
  
    
      
        전체  상품 평점
      
    
  
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
        상품 평점
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
    전체  상품 평점
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__radio_button">
    <rect width="14" height="14" x="2" y="2" rx="7.5"></rect>
    <rect width="6" height="6" x="6" y="6" stroke="none" fill="#fff" rx="3"></rect>
</svg>

  </div>


  <div
    data-value="4.5"
    class="
      dropdown_box_component__radio_select_item
      js-dropdown-box-radio-select-item
      notranslate
      
    "
  >
    평점 4.5점 이상
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__radio_button">
    <rect width="14" height="14" x="2" y="2" rx="7.5"></rect>
    <rect width="6" height="6" x="6" y="6" stroke="none" fill="#fff" rx="3"></rect>
</svg>

  </div>

  <div
    data-value="4.0"
    class="
      dropdown_box_component__radio_select_item
      js-dropdown-box-radio-select-item
      notranslate
      
    "
  >
    평점 4.0점 이상
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__radio_button">
    <rect width="14" height="14" x="2" y="2" rx="7.5"></rect>
    <rect width="6" height="6" x="6" y="6" stroke="none" fill="#fff" rx="3"></rect>
</svg>

  </div>

  <div
    data-value="3.5"
    class="
      dropdown_box_component__radio_select_item
      js-dropdown-box-radio-select-item
      notranslate
      
    "
  >
    평점 3.5점 이상
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


  <div class="widget_reviews__body">
    <div class="page">
    <ul class="group_by_products">
<li class="group_by_product" id="product_6380">
  <div class="group_by_product__product_container">
    <a class="group_by_product__product_image_link js-link-iframe" data-url="http://covernat.net/product/detail.html?cate_no=1&amp;product_no=4718">
      <img
        
          src="//assets9.cre.ma/p/covernat-net/products/00/00/00/63/80/image/small_5f4815c3dd3f25fe.jpg"
        
        class="group_by_product__product_image smooth"
        width="234"
        height="234"
        alt="부클 어센틱 C 로고 기모 후디 멜란지 그레이"
      >
    </a>
    <div class="group_by_product__info_container">
      <div class="group_by_product__title_wrapper">
        <a class="group_by_product__product_link js-link-iframe" data-url="http://covernat.net/product/detail.html?cate_no=1&amp;product_no=4718">
          <span class="group_by_product__product_name"> ${product_name}부클 어센틱 C 로고 기모 후디 멜란지 그레이</span>
        </a>
        <a class="group_by_product__product_link js-link-iframe" data-url="http://covernat.net/product/detail.html?cate_no=1&amp;product_no=4718&amp;scroll_to_product_reviews_widget=1">
          <span class="group_by_product__see_all_reviews">23 ${rownum}개의 리뷰 전체 보기</span>
        </a>
      </div>
      <div class="group_by_product__reviews_info">
        <div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #F8E71C">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div>
        <span class="group_by_product__score">4.9${everage_score}</span>
        <span class="group_by_product__reviews_count">리뷰 ${rownum}23</span>
      </div>
      <ul class="group_by_product__reviews_list">
        
          <li class="group_by_product__review">
            <div class="group_by_product__review_image_wrapper">
              
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 40 40" class="group_by_product__text_review_thumbnail">
    <rect width="40" height="40" fill="#EBEFF5" stroke="#D8DDE6" rx="4"></rect>
    <path stroke="#BCC2CC" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M25 18H11M29 14H11M29 22H11M25 26H11"></path>
</svg>

              
            </div>
            <div class="group_by_product__review_info">
              <a class="group_by_product__review_link js-link-fullscreen-popup" data-url="/covernat.net/reviews/42560/photo_review_popup?app=0&amp;group=1&amp;iframe=1&amp;iframe_id=crema-reviews-1&amp;nonmember_token=5a6cd1d45b2b177aa2652b6030e88644&amp;parent_url=https%3A%2F%2Fcovernat.net%2Fboard%2Fproduct%2Flist.html%3Fboard_no%3D4%26crema-reviews-1-group%3D1%26crema-reviews-1-sort%3D20&amp;parent_widget_id=1&amp;parent_widget_type=0&amp;product_id=6380&amp;secure_device_token=V21662b320d641885d14a82eb87c9a87f46d12348449f1dd2061c0f9d6e4deffd32fb8e25021b535b47cf0b5b564c3472c&amp;widget_env=100">
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
                <span class="group_by_product__review_score_text">아주 좋아요</span>
                
                  <span class="group_by_product__sperator">&#8226;</span>
                  <span class="group_by_product__review_message js-translate-text">디자인이 이쁘고 좋아요</span>
                
              </a>
            </div>
          </li>
        
          <li class="group_by_product__review">
            <div class="group_by_product__review_image_wrapper">
              
                <img
                  src="//assets9.cre.ma/p/covernat-net/reviews/00/00/03/87/18/image1/thumbnail_74dcd15bc4940b35.jpg"
                  class="smooth"
                  width="32"
                  height="32"
                  alt="부클 어센틱 C 로고 기모 후디 멜란지 그레이"
                >
                
              
            </div>
            <div class="group_by_product__review_info">
              <a class="group_by_product__review_link js-link-fullscreen-popup" data-url="/covernat.net/reviews/38718/photo_review_popup?app=0&amp;group=1&amp;iframe=1&amp;iframe_id=crema-reviews-1&amp;nonmember_token=5a6cd1d45b2b177aa2652b6030e88644&amp;parent_url=https%3A%2F%2Fcovernat.net%2Fboard%2Fproduct%2Flist.html%3Fboard_no%3D4%26crema-reviews-1-group%3D1%26crema-reviews-1-sort%3D20&amp;parent_widget_id=1&amp;parent_widget_type=0&amp;product_id=6380&amp;secure_device_token=V21662b320d641885d14a82eb87c9a87f46d12348449f1dd2061c0f9d6e4deffd32fb8e25021b535b47cf0b5b564c3472c&amp;widget_env=100">
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
                <span class="group_by_product__review_score_text">아주 좋아요</span>
                
                  <span class="group_by_product__sperator">&#8226;</span>
                  <span class="group_by_product__review_message js-translate-text">깔끔하고 무난해서 잘 입어져요

(2023-02-28 22:25:01 에 등록된 네이버 페이 구매평)</span>
                
              </a>
            </div>
          </li>
        
          <li class="group_by_product__review">
            <div class="group_by_product__review_image_wrapper">
              
                <img
                  src="//assets9.cre.ma/p/covernat-net/reviews/00/00/03/78/10/image1/thumbnail_6871f1118f7eaa37.jpg"
                  class="smooth"
                  width="32"
                  height="32"
                  alt="부클 어센틱 C 로고 기모 후디 멜란지 그레이${product_name}"
                >
                
              
            </div>
            <div class="group_by_product__review_info">
              <a class="group_by_product__review_link js-link-fullscreen-popup" data-url="/covernat.net/reviews/37810/photo_review_popup?app=0&amp;group=1&amp;iframe=1&amp;iframe_id=crema-reviews-1&amp;nonmember_token=5a6cd1d45b2b177aa2652b6030e88644&amp;parent_url=https%3A%2F%2Fcovernat.net%2Fboard%2Fproduct%2Flist.html%3Fboard_no%3D4%26crema-reviews-1-group%3D1%26crema-reviews-1-sort%3D20&amp;parent_widget_id=1&amp;parent_widget_type=0&amp;product_id=6380&amp;secure_device_token=V21662b320d641885d14a82eb87c9a87f46d12348449f1dd2061c0f9d6e4deffd32fb8e25021b535b47cf0b5b564c3472c&amp;widget_env=100">
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
                <span class="group_by_product__review_score_text">아주 좋아요${score_comment}</span>
                
                  <span class="group_by_product__sperator">&#8226;</span>
                  <span class="group_by_product__review_message js-translate-text">한겨울에 딱이예요 두툼해요

(2023-01-30 17:19:11 에 등록된 네이버 페이 구매평)</span>
                
              </a>
            </div>
          </li>
        
      </ul>
    </div>
  </div>
</li>



    </ul>
</div>

  </div>
  <div>
      <c:if test="${count>0}">
		<c:if test="${startPage > pageBlock}">
			<a href="list_review.do?pageNum=${startPage-pageBlock}">&lt;</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="list_rebview.do?pageNum=${i}">${i}</a>
		</c:forEach>
		<c:if test="${endPage < pageCount}">
			<a href="list_review.do?pageNum=${startPage+pageBlock}">></a>
		</c:if> 
	</c:if>		


  </div>
</div>

    </div>
    </div>
<!--     <script src="https://assets9.cre.ma/latte/assets/pc/application-a2437bbd6724a8e78f873f26ecbffd8ec195364b828783aa39a7f30c6d3864b5.js"></script>
    <script>
//<![CDATA[

      var ajax_setup_args = {cache: true, dataType: "script", accepts: {
        script: "text/javascript, application/javascript"
      }};
      $.ajaxSetup(ajax_setup_args);
      

//]]>
</script>    
    <script>
//<![CDATA[

//]]>
</script>
 -->
    <form id="form-upload-image" class="hidden" data-type="json" enctype="multipart/form-data" action="/covernat.net/preview_images/upload?nonmember_token=5a6cd1d45b2b177aa2652b6030e88644&amp;widget_env=100" accept-charset="UTF-8" data-remote="true" method="post">
  <div id="upload-fields-container"></div>
</form>


<%@include file="../mall_client/mall_index_bottom.jsp" %>
