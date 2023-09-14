<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file = "mall_index_top.jsp" %>
<style>
@media only screen and (max-width: 1680px) {
	.xans-product-image {
	    margin-top: 50px;
	}
}

.xans-product-image {
    clear: both;
    padding-top: 0;
    width: 100%;
    margin: 0 auto;
    margin-top: 100px;
    display: flex;
}
/* 



 */
@media only screen and (max-width: 1500px) {
	.xans-product-detail .detail-left, .xans-product-detail .detail-right {
	    width: 25% !important;
	}
}

@media only screen and (max-width: 1680px) {
	.xans-product-detail .detail-left, .xans-product-detail .detail-right {
	    width: 25% !important;
	}
}

.xans-product-detail .detail-left {
    padding-right: 2rem;
    padding-left: var(--layout-row-gap);
    width: 20%;
}

.xans-product-detail .detail-left .detail-scroll-fixed {
    display: flex;
    justify-content: flex-end;
}

@media only screen and (max-width: 1680px) {
	.detail-scroll-fixed {
	    top: calc(var(--header-h) + 50px);
	}
}

.detail-scroll-fixed {
    text-align: center;
    position: sticky;
    top: calc(var(--header-h) + 100px);
    left: 0;
    z-index: 1;
}

.detail-scroll-fixed .detail-content-container {
    width: 100%;
    height: auto;
}

.xans-product-detail .detail-left .detail-side-thumb {
    position: relative;
    min-width: 67px;
    display: none;
}

.xans-product-detail .detail-left .detail-side-thumb .swiper-container {
    min-height: 300px;
    height: 30vh;
}

.swiper-pointer-events.swiper-vertical {
    touch-action: pan-x;
}

body .swiper-container {
    width: 100%;
    height: auto;
    overflow: hidden;
    position: relative;
}

.swiper-free-mode>.swiper-wrapper {
    transition-timing-function: ease-out;
    margin: 0 auto;
}

.swiper-vertical>.swiper-wrapper {
    flex-direction: column;
}

.swiper-android .swiper-slide, .swiper-wrapper {
    transform: translate3d(0px,0,0);
}

.swiper-wrapper {
    position: relative;
    width: 100%;
    height: 100%;
    z-index: 1;
    display: flex;
    transition-property: transform;
    box-sizing: content-box;
}

.xans-product-detail .detail-left .detail-side-thumb .swiper-container .swiper-slide.swiper-slide-thumb-active {
    opacity: 0.5;
}

/* .swiper-slide {
    flex-shrink: 0;
    width: 100%;
    height: 100%;
    position: relative;
    transition-property: transform;
} */

.xans-product-detail .detail-left .detail-side-thumb .swiper-container .swiper-slide img {
    width: auto;
    height: 100%;
}

body .swiper-container .swiper-slide img {
    width: 100%;
}
/* 



 */
.xans-product-detail .detail-left .detail-side-thumb [class*="swiper-button-"].swiper-button-disabled {
    opacity: 0;
}

.xans-product-detail .detail-left .detail-side-thumb [class*="swiper-button-"] {
    position: absolute;
    text-align: center;
    width: 100%;
    left: 0;
    right: auto;
    top: -30px;
    bottom: auto;
    margin: 0;
    color: var(--color);
    font-size: 1rem;
    height: auto;
}

body .swiper-navigation > div > i {
    font-size: 1rem;
    color: #000;
}

.ti-angle-up:before {
    /* content: "\e648"; */
}

.xans-product-detail .detail-left .detail-side-thumb .swiper-button-next {
    top: auto;
    bottom: -30px;
}

.ti-angle-down:before {
	/* content: "\e64b"; */
}

.swiper-button-prev:after, .swiper-button-next:after {
    content: none !important;
}
/* 



 */
@media only screen and (max-width: 1500px) {
	.detail-center {
	    width: 50%;
	}
}

.detail-center {
    display: inline-block;
    max-width: 800px;
    margin: 0 auto;
    text-align: center;
}

.detail-center .imgArea-wrap {
    width: 100%;
    margin: 0 auto;
}

.m-listImg {
    display: none;
}

.m-listImg .swiper-scrollbar {
    position: static;
    margin: 1rem auto;
    width: 100%;
    transition-duration: 0ms;
}

body .swiper-scrollbar {
    overflow: hidden;
}

.detailArea {
    text-align: center;
    width: auto !important;
    max-width: 800px;
    height: auto;
    margin: 0 auto;
    margin-top: 100px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

@media only screen and (max-width: 1500px) {
	.detailArea {}
}

.detailArea img {
    width: 100% !important;
    max-width: 800px;
    height: auto !important;
    display: block;
    margin: 0 auto;
}
/* 



 */
.xans-product-detail .detail-right {
    display: inline-block;
    width: 20%;
    padding: 0 var(--layout-row-gap) 0 2rem;
}

.xans-product-detail .detail-right .innerbox {
    overflow: hidden;
    padding: 0;
}

.xans-product-detail .detail-right .xans-product-detaildesign {
    text-align: left;
}

.xans-product-detail .xans-product-detaildesign table {
    line-height: 0;
}

.xans-product-detail .infoArea table {
    margin: 0 0 10px 0;
}

.xans-product-detail .detail-right .xans-product-detaildesign tbody {
    display: flex;
    flex-direction: column;
}

.xans-product-detail .detail-right .xans-product-detaildesign tr[rel="상품명"] {
    margin-bottom: 20px;
}

.xans-product-detail .infoArea th {
    display: none;
    font-weight: normal;
    width: 115px;
    text-align: left;
    vertical-align: middle;
}

.xans-product-detail .infoArea td {
    padding: 0;
    vertical-align: middle;
    line-height: 20px;
}

.xans-product-detail .infoArea td #span_product_price_text {
    font-weight: inherit;
}

.xans-product-detail .detail-right .xans-product-detaildesign tr[rel="할인판매가"] .discountMember {
    display: none;
}

.xans-product-detail .infoArea td > span > ul.discountMember > li {
    position: relative;
    float: left;
}

.xans-product-detail .infoArea td ul.discountMember li a {
    display: block;
    margin: 0 4px 4px 0;
}
/* 



 */
.xans-product-detail .detail-right .xans-product-detaildesign tr[rel="자체상품코드"] {
    margin-top: 20px;
}
/* 



 */
.xans-product-detail .detail-right .xans-product-detaildesign tr[rel="상품간략설명"] {
	display: none;
}
/* 



 */
.xans-product-detail .detail-right .xans-product-relationlist {
    margin: 20px 0 0;
    text-align: left;
}

.xans-product-detail .detail-right .xans-product-relationlist h3 {
    display: none;
    font-size: inherit;
    letter-spacing: 0;
    padding-top: 5px;
    padding-bottom: 10px;
}

ul.prdList {
    margin: 0 -7px;
    display: flex;
    flex-wrap: wrap;
    flex: 1;
}

.xans-product-detail .detail-right .xans-product-relationlist li.item {
    margin-bottom: 10px;
}

li.item {
    width: 25%;
    padding: 0 7px;
    margin-bottom: 70px;
    text-align: center;
    line-height: 1.5;
}

li.item .box {
    position: relative;
}

li.item .box a {
    display: block;
    position: relative;
}

li.item .thumb-box {
    position: relative;
    display: block;
    overflow: hidden;
}

li.item .thumb {
    opacity: 1;
}

li .thumb {
    width: 100%;
}

.xans-product-detail .detail-right .xans-product-relationlist li.item .text-info {
    display: none;
    padding-top: 5px;
    padding-bottom: 0;
}

li.item .text-info {
    width: auto;
    padding: 10px 0;
    text-align: left;
    position: relative;
}

.xans-product-detail .detail-right .xans-product-relationlist li.item .text-info * {
    color: initial;
    font-weight: normal !important;
}

li.item .name *, li.item .text-info * {
    font-size: var(--font-size) !important;
}

li.item .name {
    margin-top: 0;
    margin-bottom: 0;
    white-space: normal;
}

li.item .name * {
    word-break: keep-all;
}
/* 



 */
.xans-product-detail .detail-right .xans-product-additional {
    padding-left: 0;
}

.xans-product-detail .detail-right #tabs {
    margin-top: 20px;
    margin-bottom: 30px;
}

.xans-product-detail .detail-right #tabs ul {
    margin: 0 0 20px 0;
    border-bottom: 0px;
    text-align: left;
}

.xans-product-detail .detail-right #tabs ul li.selected {}

.xans-product-detail .detail-right #tabs ul li {
    display: inline-block;
    border: 0px;
    padding: 0px 20px 0 0;
    margin: 0;
}

.xans-product-detail .detail-right #tabs ul li.selected a {
    text-decoration: underline;
    color: var(--color);
    font-weight: bold;
}

.xans-product-detail .detail-right #tabs ul li a {
    color: var(--disable-color);
}

.xans-product-detail .detail-right #tabs .tabs-content.show {
    display: block !important;
    font-weight: bold;
}

.xans-product-detail .detail-right #tabs .tabs-content {
    display: none;
    line-height: 1.8;
    font-size: inherit;
    color: #000;
    text-align: left;
    padding-right: 1rem;
    max-height: 250px;
    overflow-y: scroll;
    overflow-x: hidden;
}

#detail-info .close-btn {
    display: none;
}

.xans-product-detail .infoArea .xans-product-option tr:first-child td
, .xans-product-detail .infoArea .xans-product-option .xans-product-fileoption td {
    border-top: 0px solid var(--border-color);
}

.xans-product-detail .infoArea .xans-product-option tr td {
    display: block;
    padding: 5px 0;
    text-align: left;
}

.xans-product-detail .detail-right .infoArea .xans-product-option .ec-product-button {
    margin-bottom: 0;
}

.xans-product-detail .infoArea .xans-product-option .ec-product-button {
    margin-bottom: -10px;
}

.xans-product-detail .detail-right .infoArea .xans-product-option .ec-product-button li {
    margin: 0 -1px -1px 0;
}

.xans-product-detail .infoArea .xans-product-option .ec-product-button li:last-child {
    margin-right: 0;
}

.xans-product-detail .infoArea .xans-product-option .ec-product-button li {
    color: var(--color);
    width: auto;
    text-align: center;
    text-decoration: none;
    word-break: break-all;
    position: relative;
    overflow: hidden;
    display: inline-block;
    margin: 0 10px 10px 0;
    vertical-align: middle;
    border: var(--border-width) solid var(--border-color);
    background: transparent;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    -webkit-transition: border 300ms ease;
    transition: border 300ms ease;
}

.xans-product-detail .detail-right .infoArea .xans-product-option .ec-product-button li a {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 0;
    margin: 0;
    width: 45px;
    height: 45px;
}

.xans-product-detail .infoArea .xans-product-option .ec-product-button li a {
    padding: 9px 16px;
    display: block;
    text-align: center;
    text-decoration: none;
    word-break: break-all;
}

.xans-product-detail .infoArea .xans-product-option .ec-product-button li a span {
    display: inline-block;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}

.xans-product-detail .infoArea .xans-product-option .value {
    display: none;
    font-size: 10px;
    padding-top: 5px;
    word-break: break-all;
}

.xans-product-detail .infoArea .option-select {
    width: 100% !important;
}

.xans-product-detail .infoArea select {
    width: 100%;
}

.layout-contents select, body #userStyle #mCafe24Order select {
    width: auto;
    height: var(--select-height);
    position: relative;
    border-radius: 0;
    display: inline-block;
    vertical-align: middle;
    margin: 0;
    border: var(--border-width) solid var(--select-border-color);
    overflow: hidden;
    z-index: 2;
    padding: 13px 35px 13px 10px;
    line-height: 1;
    cursor: pointer;
    outline: none;
    appearance: none;
    transition: border 300ms ease;
    background-image: url(/web/upload/131/image/chevron-down.svg);
    background-repeat: no-repeat;
    background-position-y: center;
    background-position-x: calc(100% - 10px);
    background-size: 14px 14px;
}
/* 



 */
#totalProducts {
    margin: 0;
    overflow: hidden;
    color: var(--color);
}

#totalProducts .ec-base-help {
    display: none;
}

.txtWarn {
    color: #f76560;
}

#totalProducts table
, #totalProducts table tbody
, #totalProducts table tr {
    margin: 0;
    float: left;
    width: 100%;
    display: block;
}

#totalProducts thead {
    display: none;
}

#totalProducts table .option_products tr:first-of-type {
    border-top: var(--border-width) solid var(--border-color);
}

#totalProducts table tr {
    text-align: left;
    position: relative;
    padding: 10px 0;
    border-bottom: var(--border-width) solid var(--border-color);
}

#totalProducts tbody tr td:nth-of-type(1) {
    width: 34%;
    text-align: left;
    padding-right: 2%;
}

#totalProducts tbody tr td {
    width: auto;
    display: inline-block;
    text-align: right;
}

#totalProducts tbody td {
    font-size: 11px;
    padding: 0;
    vertical-align: middle;
    word-wrap: break-word;
    word-break: break-all;
}

#totalProducts tr[class*='_product'] td p.product {
    font-size: 0;
}

#totalProducts tbody td p {
    color: #000;
    padding: 0 10px 0 0;
    font-weight: normal;
    line-height: 1.5;
}

#totalProducts tr[class*='_product'] td p.product span {
    font-size: 11px;
}

#totalProducts tbody td p.product span {
    font-weight: normal;
    color: inherit;
}

#totalProducts tbody td .quantity
, #totalProducts tr[class*='_product'] td p.product + p:not(.product) {
    display: inline-block;
    position: absolute;
    top: 50%;
    right: 40%;
    width: 86px !important;
    height: 26px;
    border: var(--border-width) solid var(--border-color);
    vertical-align: top;
    text-align: left;
    transform: translateY(-50%);
}

#totalProducts tbody td .quantity input
, #totalProducts tr[class*='_product'] td p.product + p:not(.product) input {
    width: 28px;
    height: 100%;
    padding: 0 5px;
    border: 0px;
    border-radius: 0;
    text-align: center;
    letter-spacing: 0;
}

#totalProducts tbody td .quantity a:nth-of-type(1)
, #totalProducts tr[class*='_product'] td p.product + p:not(.product) > a:nth-of-type(1) {
    right: 0;
    border-left: var(--border-width) solid var(--border-color);
}

#totalProducts tbody td .quantity > a
, #totalProducts tr[class*='_product'] td p.product + p:not(.product) > a {
    width: 28px;
    height: 100%;
    display: block;
    position: absolute;
    top: 0;
}

#totalProducts tbody td .quantity a:nth-of-type(1)::before
, #totalProducts tr[class*='_product'] td p.product + p:not(.product) > a:nth-of-type(1)::before {
    width: 8px;
    height: 1px;
}

#totalProducts tbody td .quantity img
, #totalProducts tr[class*='_product'] td p.product + p:not(.product) img {
    opacity: 0;
    width: 100%;
    height: 100%;
}

#totalProducts tbody td img {
    vertical-align: middle;
}

.xans-product-detail .infoArea img {
    vertical-align: middle;
}

#totalProducts tbody td .quantity a:nth-of-type(1)::after
, #totalProducts tr[class*='_product'] td p.product + p:not(.product) > a:nth-of-type(1)::after {
    height: 8px;
    width: 1px;
}

#totalProducts tbody.option_products tr td .quantity .down
, #totalProducts tbody.add_products tr td .quantity .down {
    bottom: 0;
    top: auto;
}

#totalProducts tbody td .quantity a:nth-of-type(2)
, #totalProducts tr[class*='_product'] td p.product + p:not(.product) > a:nth-of-type(2) {
    right: 28px;
    border-left: var(--border-width) solid var(--border-color);
}

#totalProducts tbody td .quantity a:nth-of-type(2)::before
, #totalProducts tr[class*='_product'] td p.product + p:not(.product) > a:nth-of-type(2)::before {
    width: 8px;
    height: 1px;
}

#totalProducts tbody td .quantity a:nth-of-type(1)::before
, #totalProducts tr[class*='_product'] td p.product + p:not(.product) > a:nth-of-type(1)::before
, #totalProducts tbody td .quantity a:nth-of-type(1)::after
, #totalProducts tr[class*='_product'] td p.product + p:not(.product) > a:nth-of-type(1)::after
, #totalProducts tbody td .quantity a:nth-of-type(2)::before
, #totalProducts tr[class*='_product'] td p.product + p:not(.product) > a:nth-of-type(2)::before
, #totalProducts tbody td .quantity a:nth-of-type(2)::after
, #totalProducts tr[class*='_product'] td p.product + p:not(.product) > a:nth-of-type(2)::after {
    content: '';
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%,-50%);
    box-shadow: inset 0 0 0 32px;
}

#totalProducts tbody td a.delete
, #totalProducts tbody td.center > a {
    position: absolute;
    right: 6px;
    top: 50%;
    margin-top: -4px;
    width: 20px;
    height: 20px;
    z-index: 2;
    transform: rotate(45deg) translateY(-50%);
}

#totalProducts tbody td a.delete::before
, #totalProducts tbody td.center > a::before {
    width: 10px;
    height: 1px;
}

#totalProducts tbody td a.delete img
, #totalProducts tbody td.center > a img {
    width: 100%;
    height: 100%;
    position: absolute;
    top: 0;
    left: 0;
    z-index: 2;
    opacity: 0;
}

#totalProducts tbody td a.delete::after
, #totalProducts tbody td.center > a::after {
    height: 10px;
    width: 1px;
}

#totalProducts tbody td a.delete::before
, #totalProducts tbody td a.delete::after
, #totalProducts tbody td.center > a::before
, #totalProducts tbody td.center > a::after {
    content: '';
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%,-50%);
    box-shadow: inset 0 0 0 32px;
}

#totalProducts tbody tr td.right {
    width: 32%;
    text-align: right;
    position: absolute;
    top: 50%;
    right: 5%;
    transform: translateY(-50%);
}

#totalProducts table .right {
    padding-right: 5%;
    font-weight: normal;
    color: inherit;
    text-align: right;
}
/* 



 */
.xans-product-detail .detail-right .infoArea .totalPrice {
    display: block;
    text-align: left;
    height: auto;
    margin: 20px 0;
}

.totalPrice {
    height: 0;
    overflow: hidden;
    margin: 0 0 0;
    padding: 0;
    color: var(--color);
    vertical-align: middle;
    background: transparent;
}

.totalPrice .total {
    color: inherit;
}

.xans-product-detail .detail-right .infoArea .totalPrice .total em {
    font-size: var(--font-size);
    font-style: normal;
}

span.ec-base-help, p.ec-base-help, ul.ec-base-help li {
    margin: 2px 9px;
    padding: 1px 0 1px 20px;
    line-height: 1.4;
    background: url(//img.echosting.cafe24.com/skin/base/common/ico_info.gif) no-repeat 0 2px;
}

.txt11 {
    font-size: 11px;
}
/* 



 */
.xans-product-detail .infoArea .xans-product-action {
    padding: 0;
    margin-top: 0px;
    float: none;
    width: 100%;
}

.xans-product-detail .detail-right .infoArea .xans-product-action .ec-base-button {
    padding: 0;
    margin-bottom: 14px;
    text-align: left;
}

.xans-product-detail .detail-right .infoArea .xans-product-action .ec-base-button .btn {
    margin: 0;
    width: 100%;
}

.xans-product-detail .infoArea .xans-product-action .ec-base-button .wish-btn {
    color: initial !important;
    background-color: transparent;
    padding: 0;
    margin: 10px 0 0 !important;
    text-align: left;
    border: 0;
}

.xans-product-detail .detail-right .infoArea .xans-product-action .wish-btn {
    display: none;
}

.xans-product-detail .infoArea .xans-product-action .ec-base-button .wish-btn i {
    margin-right: 5px;
    vertical-align: middle;
}

.ti-heart:before {
    content: url(resources/images/heart_like_love_icon.svg);
    size: 10px;
}
/* 



 */
.scroll-fixed-limit {
    float: left;
    width: 100%;
    height: 1px;
}
/* 



 */
/* .detail-bottom {
    float: left;
    width: 100%;
    margin-top: 100px;
} */

.prd-board-section {
    width: 100%;
}
</style>

<div class="layout-contents-wrap">
	<!-- 상단 제품 정보-->
	<!--
		$category_page = /product/list.html
		$project_page = /product/project.html
		$jointbuy_page = /product/jointbuy.html
	-->

	<!-- 상단 제품 정보-->
	<div>
		<div class="xans-element- xans-product xans-product-detail ">
			<!--
				※ 옵션 선택시 품목의 할인가로 표시됩니다.
				$use_item_sale_price = T
			-->
			
			<!-- 이미지 영역 -->
			<div class="xans-element- xans-product xans-product-image imgArea">
				<!-- detail-left -->
				<!-- 상세정보 내역 -->
				<div class="detail-left ">
					<div class="detail-scroll-fixed"> 
						<div class="detail-scroll-container">
							<div class="detail-scroll">
								<div class="detail-content-container">
									<div class="detail-content">
										<div class="detail-side-thumb" thumbsslider="" style="display: block;">
											<div class="swiper-container swiper-initialized swiper-vertical swiper-pointer-events swiper-free-mode swiper-watch-progress swiper-thumbs swiper-backface-hidden"> 
												<ul class="xans-element- xans-product xans-product-addimage swiper-wrapper slides"
														id="swiper-wrapper-44710003bf417da97" aria-live="polite"
														style="transition-duration: 0ms; transform: translate3d(0px, -62px, 0px);">
													
													<c:set var="thumbsCount" value="0"/>
													<c:forEach begin="1" end="5">
													
														<li class="add_img swiper-slide xans-record- "
																role="group" aria-label="" style="height: 52px; margin-bottom: 10px;">
															<a href="#none" class="prd-zoom">
																<img src="resources/product_images/${ product_images.get(thumbsCount) }"
																		class="ThumbImage" alt="">
															</a>
														</li>
														
														<c:set var = "thumbsCount" value = "${ thumbsCount + 1 }"/>
													</c:forEach>
													
												</ul>
												
												<span class="swiper-notification"
														aria-live="assertive" aria-atomic="true"></span>
											</div>
											
											<div class="swiper-navigation mobile-content-hide">
												<div class="swiper-button-prev" tabindex="0" role="button"
														aria-controls="swiper-wrapper-44710003bf417da97"
														aria-label="Previous slide" aria-disabled="false">
													<i class="ti-angle-up">
														<img src = "resources/images/up_icon.svg" style = "width : 2rem;">
													</i>
												</div>
												
												<div class="swiper-button-next swiper-button-disabled" tabindex="-1" role="button"
														aria-controls="swiper-wrapper-44710003bf417da97" 
														aria-label="Next slide" aria-disabled="true">
													<i class="ti-angle-down">
														<img src = "resources/images/down_icon.svg" style = "width : 2rem;">
													</i>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div> 
					</div>
				</div><!--//detail-left-->
				
				<!--detail-center-->
				<div class="detail-center ">
					<div class="imgArea-wrap">
						<div class="m-listImg m-detail-slider" style="display: block;">
							<div class="swiper-container swiper-initialized swiper-horizontal swiper-pointer-events swiper-autoheight swiper-watch-progress swiper-backface-hidden"> 
								<ul class="xans-element- xans-product xans-product-addimage swiper-wrapper slides"
										id="swiper-wrapper-6e09f10a7813024c1" aria-live="polite"
										style="cursor: grab; transition-duration: 0ms; height: 817px;
												transform: translate3d(0px, 0px, 0px);">
												<!-- transform: translate3d(-2724px, 0px, 0px);"> -->
								
									<c:set var="mainImagesCount" value="0"/>
									<c:forEach begin="1" end="5">
									
										<li class="add_img swiper-slide xans-record- swiper-slide-prev swiper-slide-next"
												role="group" aria-label="${ mainImagesCount + 1 } / ${ product_images.size() }" style="width: 681px;">
											<a href="#none">
												<img src="resources/product_images/${ product_images.get(mainImagesCount) }"
														class="ThumbImage" alt="">
											</a>
										</li>
										
										<c:set var = "mainImagesCount" value = "${ mainImagesCount + 1 }"/>
									</c:forEach>
									
								</ul>
								
								<div class="layout-row">
									<div class="swiper-scrollbar swiper-scrollbar-horizontal">
										<div class="swiper-scrollbar-drag"
												style="transition-duration: 0ms;
														transform: translate3d(435.2px, 0px, 0px);
														width: 100px;"></div>
									</div>
								</div>
								<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
							</div>
						</div>
					</div>
					
					<div class="mobile-content-hide">
						<div class="detailArea">
							<c:forEach begin="1" end="5">
								<img src="resources/product_images/${ product_images.get(mainImagesCount) }">
								<br>
								<img src="https://covernat.diskn.com/23SS/18th/상세페이지/CO2300CA25NA_22.jpg">
								
								<c:set var = "mainImagesCount" value = "${ mainImagesCount + 1 }"/>
							</c:forEach>
							
							<!-- <img src="https://covernat.diskn.com/23SS/18th/상세페이지/18th_COVERNAT.jpg">
							<img src="https://covernat.diskn.com/23SS/18th/상세페이지/CO2300CA25NA_1.jpg">
							<br>
							<img src="https://covernat.diskn.com/23SS/18th/상세페이지/CO2300CA25NA_2.jpg">
							<br>
							<img src="https://covernat.diskn.com/23SS/18th/상세페이지/CO2300CA25NA_22.jpg">
							<br>
							<img src="https://covernat.diskn.com/23SS/18th/상세페이지/CO2300CA25NA_3.jpg"> -->
							<br>
							<img src="https://covernat.diskn.com/23SS/18th/상세페이지/CO2300CA25_4.jpg">
							<br>
						</div>
					</div>
				</div>
				<!--//detail-center-->
				<!--detail-right-->
				<div class="detail-right visible-out">
					<div class="detail-scroll-fixed">
						<div class="detail-scroll-container">
							<div class="detail-scroll">
								<div class="detail-content-container">
									<div class="detail-content">
										<div class="box">
											<div class="innerbox">
											
												<!-- 상세정보 내역 -->
												<div class="infoArea">
													<div class="xans-element- xans-product xans-product-detaildesign">			
														<!--
															출력 갯수 지정 변수, 없으면 설정된 전체가 나옵니다.
															count = 10
														-->
														<table border="1" summary="">
															<caption>기본 정보</caption>
															
															<tbody>
																<tr rel="상품명" class=" xans-record-">
																	<th scope="row">
																		<span style="font-size:16px;color:#000000;">
																			상품명
																		</span>
																	</th>
																	
																	<td>
																		<span style="font-size:16px;color:#000000;">
																			<!-- 와펜 볼캡 네이비 -->
																			${ productDTO.product_name }
																		</span>
																	</td>
																</tr>
																
																<tr rel="판매가" class=" xans-record-">
																	<th scope="row">
																		<span style="font-size:13px;color:#a8a8a8;">
																		판매가
																		</span>
																	</th>
																	
																	<td>
																		<span style="font-size:13px;color:#a8a8a8;">
																			<strong id="span_product_price_text" style="text-decoration: line-through;">
																				<!-- 39,000원 -->
																				<fmt:formatNumber value = "${ productDTO.product_price }" pattern="###,###"/>원
																			</strong>
																			
																			<input id="product_price" name="product_price" value="" type="hidden">
																		</span>
																	</td>
																</tr>
																
																<tr rel="할인판매가" class=" xans-record-">
																	<th scope="row">
																		<span style="font-size:13px;color:#595858;">
																			할인판매가
																		</span>
																	</th>
																	
																	<td>
																		<span>
																			<span style="font-size:13px;color:#595858;">
																				<span id="span_product_price_sale">
																					<!-- 35,100원 -->
																					<fmt:formatNumber value = "${ productDTO.product_price * (1 - 0.2) }" pattern="###,###"/>원
																					
																					<span style="font-size:14px;color:#595858;">
																						(20% 할인)
																					</span>
																				</span>
																			</span>
																			
																			<ul class="discountMember">
																				<li>
																					<a href="#">
																						<img class="ec-front-product-show-benefit-icon"
																								product-no="6640" benefit="DP" alt="기간할인"
																								src="//img.echosting.cafe24.com/skin/admin_ko_KR/product/btn_disc_period.gif">							
																					</a>
																				</li>
																			</ul>
																		</span>
																	</td>
																</tr>
																
																<tr rel="자체상품코드" class=" xans-record-">
																	<th scope="row">
																		<span style="font-size:12px;color:#a8a8a8;">
																			자체상품코드
																		</span>
																	</th>
																	
																	<td>
																		<span style="font-size:12px;color:#a8a8a8;">
																			<!-- CO2300CA25NA -->
																			${ productDTO.product_code }
																		</span>
																	</td>
																</tr>
																
																<!-- <tr rel="원산지" class=" xans-record-">
																	<th scope="row">
																		<span style="font-size:12px;color:#a8a8a8;">
																			원산지
																		</span>
																	</th>
																	
																	<td>
																		<span style="font-size:12px;color:#a8a8a8;">												
																			국내
																		</span>
																	</td>
																</tr> -->
																
																<tr rel="상품간략설명" class=" xans-record-">
																	<th scope="row">
																		<span style="font-size:12px;color:#555555;">
																			상품간략설명
																		</span>
																	</th>
																	
																	<td>
																		<span style="font-size:12px;color:#555555;">
																			º디자인
																			<br>
																			경량한 소재가 특징이며, 커버낫 로고 와펜 포인트를 준 와펜 볼캡.
																			<br>
																			- 머리를 충분히 감싸 얼굴이 작아 보이는 핏과 편안한 착용감
																			<br>
																			- 배색 디자인 포인트
																			<br>
																			- 스트랩 버클에 커버낫 로고 각인 포인트
																			<br>
																			<br>
																			º원단
																			<br>
																			NYLON 100% / 소재 특성상 은은한 광택감을 보여주며, 가볍고 편안한 착용감을 제공합니다.
																			<br>									
																			<br>
																			ºSIZE(CM)
																			<br>
																			FREE - 챙길이 : 7.2, 모자깊이 : 16.5, 둘레 : 58
																			<br>
																		</span>
																	</td>
																</tr>
															</tbody>
														</table>
													</div>
													
													<%-- <!--관련상품-->
													<div class="xans-element- xans-product xans-product-relation xans-record-">
														<!-- $only_html = yes -->
														<div class="relation">
															<div class="xans-element- xans-product xans-product-relationlist">
															<h3>RELATED PRODUCTS</h3>
															<ul class="prdList">
																<li class="item xans-record-">
																	<div class="box">
																		<a href="/product/와펜-볼캡-차콜/6639/category/28/display/1/">
																			<span class="thumb-box">
																				<img src="resources/product_images/${ productDTO.product_image1 }"
																						alt="${ productDTO.product_name }" class="thumb">
																			</span>
																		</a>
																		
																		<div class="text-info">
																			<a href="/product/와펜-볼캡-차콜/6639/category/28/display/1/"></a>
																			
																			<div class="name">
																				<a href="/product/와펜-볼캡-차콜/6639/category/28/display/1/"></a>
																				
																				<a href="/product/와펜-볼캡-차콜/6639/category/28/display/1/">
																					와펜 볼캡 차콜
																				</a>
																			</div>
																			
																			<ul>
																				<li>
																					<strong class="strike">
																						39,000원
																					</strong>
																				</li>
																				
																				<li class="salePrice ">
																					35,100원
																				</li>
																			</ul>
																		</div>			
																	</div>
																</li>
															</ul>
															</div>
														</div>
													</div>	<!--//관련상품--> --%>
													
													<!-- details tabs -->
													<div id="tabs-wrap" class="xans-element- xans-product xans-product-additional ">
														<div id="tabs">
															<ul class="tabs-menu">
																<li class = "tab-details">
																	<a href="#none">
																		DETAILS
																	</a>
																</li>
																
																<li class = "tab-exchange-return">
																	<a href="#none">
																		EXCHANGE &amp; RETURN
																	</a>
																</li>
															</ul>
															
															<div class="tabs-content-wrap">
																<div class="tabs-content tab-content-details">
																	<!-- º디자인
																	<br>
																	경량한 소재가 특징이며, 커버낫 로고 와펜 포인트를 준 와펜 볼캡.
																	<br>
																	- 머리를 충분히 감싸 얼굴이 작아 보이는 핏과 편안한 착용감
																	<br>
																	- 배색 디자인 포인트
																	<br>
																	- 스트랩 버클에 커버낫 로고 각인 포인트
																	<br>
																	<br>
																	º원단
																	<br>
																	NYLON 100% / 소재 특성상 은은한 광택감을 보여주며, 가볍고 편안한 착용감을 제공합니다.
																	<br>
																	<br>
																	ºSIZE(CM)
																	<br>
																	FREE - 챙길이 : 7.2, 모자깊이 : 16.5, 둘레 : 58
																	<br> -->
																	
																	º디자인
																	<br>
																	${ productDTO.product_explain_design }
																	<br>
																	<br>
																	º원단
																	<br>
																	${ productDTO.product_explain_fabric }
																	<br>									
																	<br>
																	ºSIZE(CM)
																	<br>
																	${ productDTO.product_explain_size }
																	<br>
																</div>
																
																<div class="tabs-content tab-content-exchange-return">
																	[교환 및 환불규정]
																	<br>
																	-제품에 착용 흔적이 없는 상태에서 교환 및 환불이 가능합니다.
																	<br>
																	-상품 또는 상품 포장지가 훼손되었거나 택이 없을 경우 교환 및 환불이 불가합니다.
																	<br>
																	-2-PACK 등 묶음 상품의 부분(낱개) 교환 및 환불이 불가합니다.
																	<br>
																	-양말 속옷류 액세서리류는 교환 및 환불이 불가합니다.
																	<br>
																	-교환 및 반품을 위해 고객님께서 직접 제품을 물류지로 보내실 경우 추가 비용 발생할 수 있습니다.
																	<br>
																	-상품 입고 시 영업일 1-3일 정도 검수 기간이 소요되는 점 양해 부탁드립니다.
																	<br>
																	<br>
																	
																	[온라인 고객센터]
																	<br>
																	평일 오전 9시 - 오후 6시 / 02-1544-8147
																</div>
															</div>
														</div>
													</div>	<!-- //details tabs -->
													
													<div id="detail-info" class="fixed-bottom-hide npay-show">
														<div class="detail-info-inside">
															<div class="close-btn">
																<i class="ti-angle-down"></i>
															</div>
															
															<table border="1" summary=""
																	class="xans-element- xans-product xans-product-option xans-record-">
																<caption>상품 옵션</caption>
																
																<tbody class="xans-element- xans-product xans-product-option xans-record-">
																	<tr>
																		<th scope="row">사이즈</th>
																		
																		<td>
																			<ul option_product_no="6640" option_select_element="ec-option-select-finder"
																					option_sort_no="1" option_type="T" item_listing_type="C"
																					option_title="사이즈" product_type="product_option"
																					product_option_area="product_option_6640_0" option_style="button"
																					ec-dev-id="product_option_id1" ec-dev-name="option1"
																					ec-dev-class="ProductOption0" class="ec-product-button" required="true">
																				<li class="" option_value="P0000JVK000A" link_image="" title="F">
																					<a href="#none">
																						<span>
																							${ productDTO.product_size }
																						</span>
																					</a>
																				</li>
																			</ul>
																			
																			<p class="value">[필수]
																				<span class="ec-shop-front-product-option-desc-trigger"
																						data-option_msg="옵션을 선택해 주세요">
																					옵션을 선택해 주세요
																				</span>
																			</p>
																			
																			<select required="true" product_option_area_select="product_option_6640_0" id="product_option_id1" name="option1" option_title="사이즈" option_type="T" item_listing_type="C" class="ProductOption0 displaynone option-select product_option_id1">
																				<option value="*">
																					empty
																				</option>
																				
																				<option value="P0000JVK000A">
																					${ productDTO.product_size }
																				</option>
																			</select>
																		</td>
																	</tr>
																</tbody>
															</table>
															
															<!-- 참고 : 뉴상품관리 전용 변수가 포함되어 있습니다. 뉴상품관리 이외의 곳에서 사용하면 일부 변수가 정상동작하지 않을 수 있습니다. -->
															<div id="totalProducts" class="">
																<p class="ec-base-help txtWarn txt11 displaynone">
																	수량을 선택해주세요.
																</p>
																
																<p class="ec-base-help txtWarn txt11 ">
																	위 옵션선택 박스를 선택하시면 아래에 상품이 추가됩니다.
																</p>
																
																<table border="1" summary="">
																	<caption>상품 목록</caption>
																	
																	<!-- 참고 : 옵션선택 또는 세트상품 선택시 상품이 추가되는 영역입니다. 쇼핑몰 화면에는 아래와 같은 마크업구조로 표시됩니다. 삭제시 기능이 정상동작 하지 않습니다.-->
																	<tbody class="option_products">
																		<tr class="option_product " data-option-index="1" target-key="6640">
																			<td>
																				<input type="hidden" class="option_box_id" id="option_box1_id" value="P0000JVK000A" name="item_code[]" data-item-add-option="" data-item-reserved="N" data-option-id="000A" data-option-index="1">
																				
																				<p class="product">
																					${ productDTO.product_name }
																					<br>
																					 - 
																					<span>
																						${ productDTO.product_size }
																					</span>
																				</p>
																			</td>
																			
																			<td>
																				<form name = "go" method = "post">
																					<span class="quantity" style="width:65px;">
																						<!-- <input type="text" id="option_box1_quantity" name="quantity_opt[]" class="quantity_opt eProductQuantityClass" value="1" product-no="6640" readonly="readonly"> -->
																						<input type="text" id="option_box1_quantity" name="product_qty" class="quantity_opt eProductQuantityClass" value="1" readonly="readonly">
																						<input type = "hidden" name = "product_num" value = "${ productDTO.product_num }">
																						<input type = "hidden" name = "mode" value = "now">
																						
																						<a href="#none" onclick="basket_qty_updown('up');" class="up eProductQuantityUpClass" data-target="option_box1_up">
																							<img src="//img.echosting.cafe24.com/design/skin/default/product/btn_count_up.gif" id="option_box1_up" class="option_box_up" alt="수량증가">
																						</a>
																						
																						<a href="#none" onclick="basket_qty_updown('down');" class="down eProductQuantityDownClass" data-target="option_box1_down">
																							<img src="//img.echosting.cafe24.com/design/skin/default/product/btn_count_down.gif" id="option_box1_down" class="option_box_down" alt="수량감소">
																						</a>
																					</span>
																				</form>
																				
																				<a href="#none" class="delete">
																					<img src="//img.echosting.cafe24.com/design/skin/default/product/btn_price_delete.gif" alt="삭제" id="option_box1_del" class="option_box_del">
																				</a>
																			</td>
																			
																			<td class="right">
																				<span id="option_box1_price">
																					<input type="hidden" class="option_box_price" value="39000" product-no="6640" item_code="P0000JVK000A">
																					
																					<span class="ec-front-product-item-price" code="P0000JVK000A" product-no="6640">
																						<fmt:formatNumber value = "${ productDTO.product_price * (1 - 0.2) }" pattern="###,###"/>
																					</span>
																					<fmt:formatNumber value = "${ productDTO.product_price * (1 - 0.2) }" pattern="#" var="price"/>
																					<input type = "hidden" id = "price" value = "${ price }"/>
																				</span>
																			</td>
																		</tr>
																	</tbody>
																</table>
															</div>	<!-- //참고 -->
															
															<div id="totalPrice" class="totalPrice">
																<span>
																	TOTAL
																</span>
																
																<span class="total">
																	<strong>
																		<em>1</em>
																	</strong>
																	
																	(1개)
																</span>
															</div>
															
															<p class="ec-base-help txt11 displaynone EC-price-warning">
																할인가가 적용된 최종 결제예정금액은 주문 시 확인할 수 있습니다.
															</p>
															
															<!-- 참고 : 뉴상품관리 전용 변수가 포함되어 있습니다. 뉴상품관리 이외의 곳에서 사용하면 일부 변수가 정상동작하지 않을 수 있습니다. -->
															<div class="xans-element- xans-product xans-product-action ">
																<div class="ec-base-button">
																	<a href="#none" class="first btn s-btn " onclick="product_submit('buy_now','mall_client_order.ezenat',this)">
																		<span alt="바로구매하기" id="btnBuy">
																			BUY NOW
																		</span>
																	</a>
																	
																	<a href="#none" class="btn" id = "btnCart" onclick="product_submit('add_cart','mall_client_cart.ezenat',this)">
																		ADD TO CART
																	</a>
																	
																	<span class="btn displaynone">
																		SOLD OUT
																	</span>
																	
																	<a href="#none" onclick="add_wishlist(this, true);" class="wish-btn btn ">
																		<i class="ti-heart"></i>
																		
																		Wishlist
																	</a>
																</div>
															</div>	<!-- //참고 -->
														</div>
													</div> 
												</div>	<!-- // 상세정보 내역 -->
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>	<!-- // detail-right-->
			</div>	<!-- // 이미지 영역 -->
		</div>
		
		<div class="scroll-fixed-limit"></div>
		
		<div style="position: static; float: left; width: 100%;" class="xans-element- xans-product xans-product-detail ">
			<div class="mobile-content-show"> 
				<div class="detailArea">
					<img src="https://covernat.diskn.com/23SS/18th/상세페이지/18th_COVERNAT.jpg">
					<img src="https://covernat.diskn.com/23SS/18th/상세페이지/CO2300CA25NA_1.jpg">
					<br>
					<img ec-data-src="https://covernat.diskn.com/23SS/18th/상세페이지/CO2300CA25NA_2.jpg"
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGP6zwAAAgcBApocMXEAAAAASUVORK5CYII=">
					<br>
					<img ec-data-src="https://covernat.diskn.com/23SS/18th/상세페이지/CO2300CA25NA_22.jpg"
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGP6zwAAAgcBApocMXEAAAAASUVORK5CYII=">
					<br>
					<img ec-data-src="https://covernat.diskn.com/23SS/18th/상세페이지/CO2300CA25NA_3.jpg"
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGP6zwAAAgcBApocMXEAAAAASUVORK5CYII=">
					<br>
					<img ec-data-src="https://covernat.diskn.com/23SS/18th/상세페이지/CO2300CA25_4.jpg"
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGP6zwAAAgcBApocMXEAAAAASUVORK5CYII=">
					<br>
				</div> 
			</div>
		</div>
		
		
		
		<style>
			#bg-pastelly-detail-1 { padding-bottom: 35%; position: relative; }
			#bg-pastelly-detail-1iframe { position: absolute; top:0; left:0; width:100%; height: 100%; }
			#bg-pastelly-detail-2 { padding-bottom: 35%; position: relative; }
			#bg-pastelly-detail-2iframe { position: absolute; top:0; left:0; width:100%; height: 100%; }
		</style> 
		
		
		<div class="detail-bottom">
			<!-- bigin pastelly --> 
			<script>
				(function(b,p,a,s,t,e,l,y) {
					b.biginPastelly=b.biginPastelly||[];b.biginPastelly.push({
						config:"config",namespace:s,projectId:e
					})
					
					p.getElementById(t)||(
						l=document.createElement(a),
						y=document.getElementsByTagName(a)[0],
						l.id=t,
						l.async=!0,
						l.src="https://sdk.bigin.io/v1/bigin.pastelly.sdk.js",
						y.parentNode.insertBefore(l,y)
					)
				})
							
				(window,document,"script","biginPastelly","bigin-pastelly-sdk","ZYDTMTSMED-1")
			</script>
			
			<!-- bigin pastelly -->
			<!-- bigin pastelly -->
			<!-- <div class="layout-row">
				<div id="bg-pastelly-detail-1" class="mobile-content-hide" style="height: 537px; position: relative; display: block; width: auto; margin: auto;">
					<iframe id="bg-pastelly-detail-1-iframe" style="height: 100%; border: none; width: 100%; margin: auto;">
					</iframe>
				</div>
				
				<div id="bg-pastelly-detail-2" class="mobile-content-show" style="height: auto; position: relative; display: block; width: 1554px; margin: auto;">
					<iframe id="bg-pastelly-detail-2-iframe" style="height: 100%; border: none; width: 100%; margin: auto;">
					</iframe>
				</div>
			</div>
			
			<script>
				window.biginPastelly = window.biginPastelly || []; window.biginPastelly.push({
																		id: '1',
																		type: '02'
																	})
				window.biginPastelly = window.biginPastelly || []; window.biginPastelly.push({
																		id: '2',
																		type: '02'
																	})
			</script> -->
			<!-- bigin pastelly --> 
			
			<!--상품 게시판-->
			<section class="xans-element- xans-product xans-product-additional additional_after prd-board-section ">
				<div class="layout-row">
					<div class="additional_inside"> 
						<!-- 상품 사용 후기 --> 
						<section id="prdReview" class="prd-board tab-content">
							<div class="title-wrap">
								<!--<h2 class="titleArea">REVIEW</h2>-->
								<div class="boardBtn crema-hide crema-applied" style="display: none;">
									<a class="btn" href="/board/product/list.html?board_no=4">
										LIST
									</a>
									
									<a class="btn s-btn" 
										href="/board/product/write.html?board_no=4&amp;
										product_no=6640&amp;
										cate_no=874&amp;display_group=1">
										WRITE
									</a>
								</div>
							</div>
							
							<div id="reviewArea" class="prd-inside crema-hide crema-applied" style="display: none;">
								<p class="nodata">
									게시물이 없습니다
								</p>
							</div>
							
							<div class="crema-product-reviews crema-applied" data-widget-id="24" data-product-code="6640" style="">
								<iframe id="crema-product-reviews-1"
										src="https://review9.cre.ma/covernat.net/products/reviews?product_code=6640&amp;
										iframe_id=crema-product-reviews-1&amp;
										widget_id=24&amp;widget_style=&amp;app=0&amp;
										parent_url=https%3A%2F%2Fcovernat.net%2Fproduct%2Fdetail.html%3Fproduct_no%3D6640%26cate_no%3D874%26display_group%3D1&amp;
										nonmember_token=&amp;
										secure_device_token=V28fdccf04957de73ec61a6b712b5924e852f656649544407b8ea8bb926b17fb3e336fb31fb8e92d390e16a6ca9817e6e7&amp;
										iframe=1" height="0" width="100%" scrolling="no" allowtransparency="true" frameborder="0"
										name="crema-product-reviews-1-1688020695912"
										style="display: block; visibility: visible; height: 20px;">
								</iframe>
							</div>
							
							<div class="crema-product-reviews crema-applied" data-widget-id="2" data-product-code="6640" style="">
								<iframe id="crema-product-reviews-2"
										src="https://review9.cre.ma/covernat.net/products/reviews?product_code=6640&amp;
										iframe_id=crema-product-reviews-2&amp;
										widget_id=2&amp;widget_style=&amp;app=0&amp;
										parent_url=https%3A%2F%2Fcovernat.net%2Fproduct%2Fdetail.html%3Fproduct_no%3D6640%26cate_no%3D874%26display_group%3D1&amp;
										nonmember_token=&amp;
										secure_device_token=V28fdccf04957de73ec61a6b712b5924e852f656649544407b8ea8bb926b17fb3e336fb31fb8e92d390e16a6ca9817e6e7&amp;
										iframe=1" height="0" width="100%" scrolling="no" allowtransparency="true" frameborder="0"
										name="crema-product-reviews-2-1688020695917"
										style="display: block; visibility: visible; height: 870px;">
								</iframe>
							</div>
						</section>	<!-- //상품 사용 후기 -->
					</div>
					<!-- //상품 Q&A -->
				</div>
			</section>	<!--//상품 게시판-->
		</div>
	</div>


	<script>
		/* swiper */
		// 상품 썸네일 이미지 스와이퍼
		var prdThumbSwiper = new Swiper(".detail-side-thumb .swiper-container", {
			slidesPerView: 5,
			
			spaceBetween: 10,
			
			direction: "vertical",
			
			grabCursor: false,
			
			observer: true,
			
			observeParents: true,
			
			watchSlidesProgress: true,
			
			mousewheel: {
				invert: false
			},
			
			freeMode: {
				enabled: true,
				sticky: true
			},
			
			navigation: {
				nextEl: ".detail-side-thumb .swiper-button-next",
				prevEl: ".detail-side-thumb .swiper-button-prev"
			},
			
			on: {
				init: function () {
					var keyImg = $(".keyImg img").attr("src")
					
					console.log(keyImg)
					
					$(".detail-side-thumb .swiper-slide").first().find("img").attr("src",keyImg)
					$(".detail-side-thumb").show()
				}
			}
		})
		
		// 상품 이미지 스와이퍼
		var prdSwiper = new Swiper('.m-detail-slider .swiper-container', {
			slidesPerView: 1,
			
			//speed: 500,
			
			grabCursor: true,
			
			loop : false,
			
			autoHeight: true,
			
			observer: true,
			
			observeParents: true, 
			
			watchSlidesProgress: true,
			
			pagination: {
				el: '.swiper-pagination',
				
				type: 'progressbar' 
			},
			
			scrollbar: {
				el: '.m-detail-slider .swiper-scrollbar',
				
				draggable: true,
				
				dragSize: 100
			},
			
			thumbs: {
				swiper: prdThumbSwiper,
			},
			
			on: {
				init: function () {
					var keyImg = $(".keyImg img").attr("src")
					
					console.log(keyImg)
					
					$(".m-detail-slider .swiper-slide").first().find("img").attr("src",keyImg)
					$(".m-detail-slider").show()
				}
			}
		})
		
		
		$(".detail-side-thumb").click(function() {
			$("html, body").animate({
				scrollTop: 0
			}, 0)
			
			return false 
		})
		/* // swiper */
		
		/* 상품 상세보기 tabs 선택 */
		var tab_details = document.querySelector(".xans-product-detail .detail-right #tabs ul li.tab-details")
		var tab_exchange_return = document.querySelector(".xans-product-detail .detail-right #tabs ul li.tab-exchange-return")
		var content_details = document.querySelector(".xans-product-detail .detail-right #tabs .tabs-content.tab-content-details")
		var content_exchange_return = document.querySelector(".xans-product-detail .detail-right #tabs .tabs-content.tab-content-exchange-return")
		
		var tabs_menu = document.getElementsByClassName("tabs-menu")
		
		for (var i = 0; i < tabs_menu.length; ++i) {
			var tabs_menu_li = tabs_menu[i].children
			
			for (var j = 0; j < tabs_menu_li.length; ++j) {
				tabs_menu_li[j].querySelector("a").addEventListener("click", function() {
					if (this.parentElement.className == "tab-details") {
						tab_exchange_return.classList.remove("selected")
						content_exchange_return.classList.remove("show")
						
						tab_details.classList.add("selected")
						content_details.classList.add("show")
						
					} else if (this.parentElement.className == "tab-exchange-return") {
						tab_details.classList.remove("selected")
						content_details.classList.remove("show")
						
						tab_exchange_return.classList.add("selected")
						content_exchange_return.classList.add("show")
						
					} else if (this.parentElement.className == "tab-details selected"
								|| this.parentElement.className == "tab-exchange-return selected") {
						tab_details.classList.remove("selected")
						content_details.classList.remove("show")
						tab_exchange_return.classList.remove("selected")
						content_exchange_return.classList.remove("show")
					}
				})
			}
		}
		/* // 상품 상세보기 tabs 선택 */
	</script>
	
	<script type="text/javascript">
		/* 상품 개수 수정 */
		function AddComma(num) {
			var regexp = /\B(?=(\d{3})+(?!\d))/g;
			
			return num.toString().replace(regexp, ',');
		}

 		var nData = AddComma(nData);
 
		function basket_qty_updown(updown) {
			var quantity = $("#option_box1_quantity").val()
			var product_price = $("#price").val()
			
			if (updown == "up") {
				++ quantity
				$("#option_box1_quantity").val(quantity)
				
				var price = AddComma(parseInt(product_price) * quantity)
				$(".ec-front-product-item-price").text(price)
				
				$(".total").html("<strong><em>" + quantity + "</em></strong>" + " (" + quantity + "개)")
				
			} else if (updown == "down") {
				if (quantity > 1) {
					-- quantity
					$("#option_box1_quantity").val(quantity)
					
					var price = AddComma(parseInt(product_price) * quantity)
					$(".ec-front-product-item-price").text(price)
					
					$(".total").html("<strong><em>" + quantity + "</em></strong>" + " (" + quantity + "개)")
				}
			}
		}
		/* // 상품 개수 수정 */
	</script>
	
	<%--
	<script>
		// 모름
		window.onload = function() {
			var product_items = []
			
			product_items.push({
				"id": iProductNo,
				"name": product_name,
				"price" : Number(product_price),
				
				item_id: iProductNo,
				item_name: product_name
			})
			
			dataLayer.push({
				'event':'view_item',
				
				'ecommerce':{
					'detail': {
						'products': product_items
					},
					
					'currency': 'KRW',
					
					'value': Number(product_price),
					
					'items': product_items
				}
			})
			
			document.querySelector('#detail-info > div > div.xans-element-.xans-product.xans-product-action'
					+ '> div.ec-base-button > a:nth-child(2)').addEventListener('click',function() {
				console.log('aa');
				
				dataLayer.push({
					'event':'add_to_cart',
					
					'ecommerce':{
						'add': {
							'products': product_items
						},
						
						'currency': 'KRW',
						
						'value': Number(product_price),
						
						'items': product_items
					}
				})
			})
		}
	</script>

	<!-- bigin recommend engine analyze sdk-->
	<script>
		// 아마도 '관련 상품' 스크립트
		function createBgBuffer() {
			var w = window
			var l = 'bigin'
			
			w["_b_g_e_b_f"] = w["_b_g_e_b_f"] ? w["_b_g_e_b_f"] : []
			
			w[l] = w[l] ? w[l] : {}
			
			w[l].event = function(c, d, t) {
				w["_b_g_e_b_f"].push({ t: "event", a1: c, a2: d, a3: t ? t : new Date().getTime() })
			}
		}
		
		function triggerBiginRecommendEvent(iframeElement, callable) {
			try {
				var iframeElemInnerDocument = iframeElement.contentWindow.document
				var productList = []
				
				function triggerEvent(productList) {
					var productListData = ''
					
					productList.forEach(function(product, index) {
						if(index === 0) {
							productListData += product.dataset.id
						
						} else {
							productListData +=',' + product.dataset.id
						}
						
						product.addEventListener('click', function(e) {
							bigin.event("bg:recommendClick", {
								'name' : 'pv',
								'productList': productListData,
								'product': e.currentTarget.dataset.id
							})
						})
					})
					
					if (callable){
						bigin.event("bg:recommend", {
							'name' : 'pv',
							'productList': productListData
						})
					}
				}
				
				if(iframeElemInnerDocument) {
					productList = iframeElemInnerDocument.querySelectorAll('.product-list li a')
				}
				if(productList.length !== 0) {
					triggerEvent(productList);
				}
			} catch(e) {}
		}
		
		function bgPastellyObserver(targetNode, iframeElem) {
			var config = {
				childList: true,
				subtree: true
			}
			
			var callback = function(mutationsList) {
				var i = 0
				
				while(i < mutationsList.length) {
					if (mutationsList[i].type === 'childList') {
						if(iframeElem) {
							triggerBiginRecommendEvent(iframeElem)
							observer.takeRecords()
							observer.disconnect()
							
							break;
						}
					}
					
					i++
				}
			}
			
			var observer = new MutationObserver(callback);
			
			observer.observe(targetNode, config);
			setTimeout(function() {
				observer.takeRecords();
				observer.disconnect();
			}, 10000);
		}
		
		window.addEventListener("load", function() {
			createBgBuffer()
			
			var iframeElementPc = document.querySelector('#bg-pastelly-detail-1-iframe')
			var iframeElementMobile = document.querySelector('#bg-pastelly-detail-2-iframe')
			
			var isExistIframe = !!iframeElementPc || !!iframeElementMobile
			
			if(isExistIframe) {
				triggerBiginRecommendEvent(iframeElementPc
											, (window.getComputedStyle(document.querySelector("#bg-pastelly-detail-1")).display
													=== 'block'))
				triggerBiginRecommendEvent(iframeElementMobile
											, (window.getComputedStyle(document.querySelector("#bg-pastelly-detail-2")).display
													=== 'block'))
			
			} else {
				var targetNodePc = document.querySelector('#bg-pastelly-detail-1')
				var iframeElemPc = document.querySelector('#bg-pastelly-detail-1-iframe')
				
				let targetNodeMobile = document.querySelector('#bg-pastelly-detail-2')
				var iframeElemMobile = document.querySelector('#bg-pastelly-detail-2-iframe')
				
				bgPastellyObserver(targetNodePc, iframeElemPc)
				bgPastellyObserver(targetNodeMobile, iframeElemMobile)
			}
			
			var productNo = iProductNo
			var productName = product_name
			var productPrice = Number(product_price.replace(/\D|\,/g, ''))
			var productQuantity = 1
			
			
			gtag_items.push({
				"id": productNo,
				
				"name": productName,
				
				"quantity": productQuantity,
				
				"price": productPrice
			})
			
			
			ga4_items.push({
				"item_id": productNo,
				
				"item_name": productName,
				
				"quantity": productQuantity,
				
				"price": productPrice
			})
			
			dataLayer.push({
				'event':'view_item',
				
				'ecommerce': {
					'currency': "KRW",
					
					'items' : ga4_items,
					
					'value': "{$product_price}".replace(/\D|\,/g,''),
					
					'detail': {
						'products': gtag_items
					}
				}
			})
		})
		
		document.querySelector('#actionCart').addEventListener('click',function() {
			dataLayer.push({
				'event': 'add_to_cart',
				
				'ecommerce': {
					'currencyCode': 'KRW',
					
					'add': {
						'products': gtag_items
					},
					
					'items' : ga4_items
				}
			})
		})
	</script>
	<!-- bigin recommend engine analyze sdk-->
	 --%>
	 
	<script type="text/javascript">
		function product_submit(mode, url, position) {
			if (mode == "buy_now") {
				document.go.action = url
				document.go.submit()
				
			} else if (mode == "add_cart") {
				$.ajax({
					type : "POST",
					
					url : "./add_cart",
					
					data : {
						"product_num" : document.go.product_num.value,
						
						"product_qty" : document.go.product_qty.value
					},
					
					success : function(e) {
						Swal.fire({
							text : "상품이 장바구니에 추가되었습니다.",
							
							showCancelButton : true,
							
							confirmButtonText : "장바구니로 이동",
							
							cancelButtonText : "계속 쇼핑하기",
							
							cancelButtonColor : "#000000",
							
							allowOutsideClick : false
						}).then(function(result) {
							if (result.isConfirmed) {
								location.href = url
								
							} else {
								location.reload()
							}
						})
					},
					
					error : function(e) {
						alert("실패")
					}
				})
			}
		}
	</script>
</div>

<%@ include file = "mall_index_bottom.jsp" %>