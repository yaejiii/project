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
	<div class="container">
      <table class="table table-borderless">
        <tbody>
      
        <tr>
          <td><p class="row justify-content-center" style="font-weight:bold; font-size:16px;">주문서 작성</p></td>
        </tr>
      
        <tr>
          <td><p style="font-weight:bold; font-size:12px;">배송지</p></td>
        </tr>

        <tr>
          <td><p style="font-size:12px;">받는 사람</p></td>
        </tr>

        <tr>
          <td><input type="text" class="form-control"></td>
        </tr>

        <tr>
          <td><p style="font-size:12px;">주소</p></td>
        </tr>

        <tr>
          <td><input type="text" class="form-control" placeholder="우편번호"></td>
          <td><button type="submit" class="btn btn btn-block" style="border-radius: 0">주소검색</button></td>
        </tr>

        <tr>
          <td><input type="text" class="form-control" placeholder="기본주소"></td>
        </tr>

        <tr>
          <td><input type="text" class="form-control" placeholder="나머지 주소"></td>
        </tr>

        <tr>
          <td><p style="font-size:12px;">휴대전화</p></td>
        </tr>

        <tr>
          <td>
            <select class="option-name" style="margin-right:5px">
              <option value="productname">-이메일 선택-</option>
              <option value="productname">naver.com</option>
              <option value="productname">daum.net</option>
              <option value="productname">nate.com</option>
              <option value="productname">gmail.com</option>
            </select>
          </td>

          <td>-</td>

          <td>
            <input type="text" class="form-control">
          </td>

          <td>-</td>

          <td>
            <input type="text" class="form-control">
          </td>
        </tr>

        <tr>
          <td><p style="font-size:12px;">이메일</p></td>
        </tr>

        <tr>
          <td><input type="text" class="form-control"></td>
          <td>@</td>
          <td>
            <select class="option-name" style="margin-right:5px">
              <option value="productname">-선택하세요-</option>
              <option value="productname">010</option>
              <option value="productname">011</option>
              <option value="productname">016</option>
              <option value="productname">017</option>
              <option value="productname">018</option>
              <option value="productname">019</option>
            </select>
          </td>
        </tr>

        <tr>
          <td>
            <select class="option-name" style="margin-right:5px">
              <option value="productname">--메시지 선택(선택사항)--</option>
              <option value="productname">배송 전에 미리 연락바랍니다.</option>
              <option value="productname">부재시 경비실에 맡겨주세요.</option>
              <option value="productname">부재시 문 앞에 놓아주세요.</option>
              <option value="productname">빠른 배송 부탁드립니다.</option>
              <option value="productname">택배함에 보관해주세요.</option>
              <option value="productname">직접 입력력</option>
            </select>
          </td>
        </tr>

        <tr>
          <td>
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"> <label class="form-check-label" for="flexCheckDefault"></label>
              배송지 정보로 간편 회원가입
            </div>
          </td>
        </tr>


        </tbody>
      </table>
    </div>
</body>
</html>
<%@ include file = "../mall_client/mall_index_bottom.jsp" %>