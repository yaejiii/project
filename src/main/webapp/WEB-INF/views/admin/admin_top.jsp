<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
  <head>
    <meta charset="utf-8">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet"> 
    <title>관리자 페이지</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
 	<link rel="stylesheet" href="resources/css/admin.css"> 
    <style>
    .hidden {
      display: none;
    }
  </style>
  </head>
<body>
<c:if test="${memInfo.admin_power=='admin'}">
	<nav class="navbar navbar-expand-lg">
		<div class="container-fluid">
			<a class="navbar-brand" href="admin_main.do">EZENAT</a>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">관리자계정입니다</a></li>
					<li class="nav-item"><a class="nav-link" href="admin_logout.do">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<div class="row bgcolor=black;">
		<div class="col-1 side-menu">
			<div class="btn-group dropend">
				<button type="button" class="btn btn-secondary btn-lg dropdown-toggle dropdown-button" data-bs-toggle="dropdown" aria-expanded="false">상품관리</button>
				<ul class="dropdown-menu">
					<li><a class="dopdown-item" href="admin_category.do">- 카테고리관리</a></li>
					<li><a class="dopdown-item" href="admin_category_insert.do">- 카테고리등록</a></li>
					
					<li><a class="dopdown-item" href="admin_product_list.do">- 상품목록</a></li>
					<li><a class="dopdown-item" href="admin_product_insert.do">- 상품등록</a></li>
					<li><a class="dopdown-item" href="admin_product_pqty.do">- 상품재고관리</a></li>
					<li><a class="dopdown-item" href="admin_product_list.do?mode=Y">- 상품삭제목록</a></li>
				</ul>
			</div>
			<div class="btn-group dropend">
				<button type="button" class="btn btn-secondary btn-lg dropdown-toggle dropdown-button" data-bs-toggle="dropdown" aria-expanded="false">회원관리</button>
				<ul class="dropdown-menu">
					<li><a class="dopdown-item" href="admin_member_list.do">- 회원목록</a></li>
					<li><a class="dopdown-item" href="admin_member_rating.do">- 회원등급별관리</a></li>
					<li><a class="dopdown-item" href="admin_member_list.do?mode=Y">- 불량회원목록</a></li>
				</ul>
			</div>
			<div class="btn-group dropend">
				<button type="button" class="btn btn-secondary btn-lg dropdown-toggle dropdown-button" data-bs-toggle="dropdown" aria-expanded="false">주문관리</button>
				<ul class="dropdown-menu">
					<li><a class="dopdown-item" href="admin_order_list.do">- 주문목록관리</a></li>
					<li><a class="dopdown-item" href="admin_order_cancel.do">- 주문취소관리</a></li>
					<li><a class="dopdown-item" href="admin_order_return.do">- 주문반품관리</a></li>
					<li><a class="dopdown-item" href="admin_order_refund.do">- 주문환불관리</a></li>
					<li><a class="dopdown-item" href="admin_order_exchange.do">- 주문교환관리</a></li>
<!-- 					<li><a class="dopdown-item" href="admin_order_card.do">- 카드취소관리</a></li>
					<li><a class="dopdown-item" href="admin_order_cash.do">- 현금거래관리</a></li>
					<li><a class="dopdown-item" href="admin_order_cashReceipt.do">- 현금영수증관리</a></li>
 -->				</ul>
			</div>
			<div class="btn-group dropend">
				<button type="button" class="btn btn-secondary btn-lg dropdown-toggle dropdown-button" data-bs-toggle="dropdown" aria-expanded="false">게시판관리</button>
				<ul class="dropdown-menu">
					<li><a class="dopdown-item" href="admin_notice.do">- 공지사항목록</a></li>
					<li><a class="dopdown-item" href="admin_write_notice_board.do">- 공지사항등록</a></li>
					<li><a class="dopdown-item" href="list_faq.do">- FAQ목록</a></li>
					<li><a class="dopdown-item" href="admin_write_notice_board.do">- FAQ등록</a></li>
				</ul>
				
<!-- 				<ul class="dropdown-menu">
					<li><a class="dopdown-item" href="admin_stat.do">- 매출분석</a></li>
					<li><a class="dopdown-item" href="admin_stat_product.do">- 상품분석</a></li>
				</ul>
 -->			</div>
			<div class="btn-group dropend">
				<button type="button" class="btn btn-secondary btn-lg dropdown-toggle dropdown-button" data-bs-toggle="dropdown" aria-expanded="false">지점관리</button>
				<ul class="dropdown-menu">
					<li><a class="dopdown-item" href="admin_store.insert.do">- 지점등록</a></li>
					<li><a class="dopdown-item" href="admin_store_list.do">- 지점목록</a></li>
				</ul>
			</div>
		</div>
		<div class="col-10 main-view">
		</c:if>
<c:if test="${empty memInfo.id}"><script>if(!alert('관리자 로그인을 먼저 해 주세요.')) document.location = 'admin';</script></c:if>
<c:if test="${memInfo.admin_power != 'admin' }"><script>if(!alert('관리자 권한이 없는 아이디입니다. 확인 후 관리자 아이디로 로그인해주세요.')) document.location = 'admin';</script></c:if>