<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "../mall_client/mall_index_top.jsp" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/mall_client_general.css?after">
</head>
<body>
	<div class = "container" style = "width : 1000px; margin : 0 auto;">
    <div style = "width : 100%">

        
        
        
        
        
	<div><p class="row justify-content-center" style="font-weight:bold; font-size:16px;">쿠폰</p></div>
    <div><p style="font-weight:bold; font-size:12px;">쿠폰인증번호 등록하기</p></div>
    <div>
      <input type="text" size="110" style="1px solid black; padding:10px 0px;">
      <button type="submit" class="btn s-btn" style="border-radius: 0">쿠폰번호 인증</button>
    </div>
    <div><p style="font-size:11px;">- 반드시 쇼핑몰에서 발행한 쿠폰번호만 입력해주세요. (10~35자 일련번호 "-" 제외)</p></div>
    <div><p style="font-size:11px;">- 쿠폰 인증번호 등록하기에서 쇼핑몰에서 발행한 종이쿠폰 / 시리얼쿠폰 / 모바일쿠폰 등의 인증번호를 등록하시면 온라인 쿠폰으로 발급되어 사용이 가능합니다.</p></div>
    <div><p style="font-size:11px;">- 쿠폰은 주문 시 주문서 당 1회에 한해 적용되며, 1회 사용 시 재사용이 불가능합니다.</p></div>
    <div><p style="font-size:11px;">- 쿠폰은 적용 가능한 상품이 따로 적용되어 있는 경우 해당 상품 구매 시에만 사용이 가능합니다.</p></div>
    <div><p style="font-size:11px;">- 특정한 종이쿠폰 / 시리얼쿠폰 / 모바일쿠폰의 경우 단 1회만 사용이 가능할 수 있습니다.</p></div>
    <div><p style="font-size:11px;">- 쿠폰을 사용한 주문 건에서 일부 상품을 취소하실 경우, 남은 상품의 결제금액이 쿠폰 사용 가능 기준 금액에 미달된다면 쿠폰으로 할인되었던 금액을 제외한 차액만 지급됩니다.</p></div>
    <hr style="border-width: 1px; width: 990px;">
    <div><p style="font-weight:bold; font-size:12px;">마이 쿠폰 목록</p></div>
    <div><p style="font-size:11px;">사용가능 쿠폰 : n장</p></div>
    <div>
      <table class="table table-bordered" style="width: 990px; border : 2px solid #000000">
        <tr>
          <td><p style="font-size:14px;">번호</p></td>
          <td><p style="font-size:14px;">1</p></td>
        </tr>
        <tr>
          <td><p style="font-size:14px;">쿠폰명</p></td>
          <td><p style="font-size:14px;">HOT SUMMER ITEM 10% COUPON</p></td>
        </tr>
        <tr>
          <td><p style="font-size:14px;">할인액(률)</p></td>
          <td><p style="font-size:14px;">10%</p></td>
        </tr>
        <tr>
          <td><p style="font-size:14px;">사용가능 여부</p></td>
          <td><p style="font-size:14px;">가능/기한만료</p></td>
        </tr>
        <tr>
          <td><p style="font-size:14px;">사용가능 기간</p></td>
          <td><p style="font-size:14px;">2023-06-23 00:00:00 ~ 2023-07-01 00:00:00</p></td>
        </tr>
        <tr>
          <td><p style="font-size:14px;">쿠폰적용 상품</p></td>
          <td>
            <button type="submit" class="btn btn" style="border-radius: 0">적용가능 상품</button>
          </td>
        </tr>
        
      </table>
      
      
     
      
    </div>
    </div>
    </div>
</body>
</html>
<%@ include file = "../mall_client/mall_index_bottom.jsp" %>