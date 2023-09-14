<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>
<body>
	<div class="container">
    <div class="row">
      <div class="col-12 container bg-black text-center">
        <h6 class="text-light"><b>환불계좌 등록/변경</b></h6>
      </div>

      <div class="col-4">
      <br>
      <p class="text-secondary" style="font-size:14px;">예금주</p>
      </div>

      <div class="col-8">
      <br>
        <input type="text">
      </div>

      <div class="col-4">
      </div>

      <div class="col-8">
        <p class="text-secondary" style="font-size:13px;">
          - 예금주명은 주문자명과 동일해야 합니다.
        </p>
      </div>

      <div class="col-4">
        <p class="text-secondary" style="font-size:14px;">은행명</p>
      </div>

      <div class="col-8">
        <select class="option-name" style="margin-right:5px">
			<option value="" selected="selected">- 은행선택 -</option>
			<option value="bank_02">산업은행</option>
			<option value="bank_03">기업은행</option>
			<option value="bank_04">국민은행</option>
			<option value="bank_05">하나(외환)은행</option>
			<option value="bank_07">수협중앙회</option>
			<option value="bank_11">농협중앙회</option>
			<option value="bank_12">농협개인</option>
			<option value="bank_13">농협</option>
			<option value="bank_20">우리은행</option>
			<option value="bank_209">유안타증권</option>
			<option value="bank_218">KB증권</option>
			<option value="bank_23">SC제일은행</option>
			<option value="bank_230">미래에셋증권</option>
			<option value="bank_238">대우증권</option>
			<option value="bank_240">삼성증권</option>
			<option value="bank_243">한국투자증권</option>
			<option value="bank_26">신한은행</option>
			<option value="bank_261">교보증권</option>
			<option value="bank_262">하이투자증권</option>
			<option value="bank_263">현대차증권</option>
			<option value="bank_266">SK증권</option>
			<option value="bank_267">대신증권</option>
			<option value="bank_269">한화증권</option>
			<option value="bank_270">하나대투증권</option>
			<option value="bank_278">신한금융투자</option>
			<option value="bank_279">동부증권</option>
			<option value="bank_280">유진투자증권</option>
			<option value="bank_287">메리츠증권</option>
			<option value="bank_288">카카오페이증권</option>
			<option value="bank_289">NH투자증권</option>
			<option value="bank_291">신영증권</option>
			<option value="bank_292">케이뱅크</option>
			<option value="bank_293">카카오뱅크</option>
			<option value="bank_294">LIG증권</option>
			<option value="bank_295">OK저축은행</option>
			<option value="bank_296">토스뱅크</option>
			<option value="bank_297">토스증권</option>
			<option value="bank_31">대구은행</option>
			<option value="bank_32">부산은행</option>
			<option value="bank_34">광주은행</option>
			<option value="bank_35">제주은행</option>
			<option value="bank_37">전북은행</option>
			<option value="bank_39">경남은행</option>
			<option value="bank_52">모건스탠리은행</option>
			<option value="bank_53">씨티은행</option>
			<option value="bank_57">유에프제이은행</option>
			<option value="bank_58">미즈호코퍼레이트은행</option>
			<option value="bank_59">미쓰비시도쿄은행</option>
			<option value="bank_60">뱅크오브아메리카</option>
			<option value="bank_71">우체국</option>
			<option value="bank_76">신용보증기금</option>
			<option value="bank_77">기술신용보증기금</option>
			<option value="bank_81">하나은행</option>
			<option value="bank_82">농협회원조합</option>
			<option value="bank_83">도이치은행</option>
			<option value="bank_84">상호저축은행</option>
			<option value="bank_85">새마을금고</option>
			<option value="bank_86">수출입은행</option>
			<option value="bank_87">신용협동조합</option>
			<option value="bank_89">홍콩상하이은행(HSBC)</option>
			<option value="bank_90">에이비엔암로은행</option>
			<option value="bank_91">산림조합</option>
			<option value="bank_93">한국주택금융공사</option>
			<option value="bank_94">서울보증보험</option>
			<option value="bank_95">경찰청</option>
			<option value="bank_99">금융결제원</option>
			<option value="bank_999">기타</option>
        </select>
      </div>

      <div class="col-4">
        <p class="text-secondary" style="font-size:14px;">계좌번호</p>
        </div>
  
        <div class="col-8">
          <input type="text">
        </div>

        <div class="col-4">
        </div>
  
        <div class="col-8">
          <p class="text-secondary" style="font-size:13px;">
            - '-'없이 숫자만 입력해 주세요
          </p>
        </div>

        <div class="col-4">
        <p class="text-secondary" style="font-size:14px;">비밀번호 확인</p>
        </div>
  
        <div class="col-8">
          <input type="text">
        </div>

        <div class="col-4">
        </div>
  
        <div class="col-8">
          <p class="text-secondary" style="font-size:13px;">
            - 등록된 비밀번호를 확인합니다
          </p>
        </div>

        <div class="col-6 d-grid gap-0">
          <button type="submit" class="btn btn-dark" style="border-radius: 0">
						등록/변경</button>
        </div>
        
        <div class="col-6 d-grid gap-0">
          <button type="submit" class="btn btn" style="border-radius: 0">
						취소</button>
        </div>

    </div>
    </div>
</body>
</html>