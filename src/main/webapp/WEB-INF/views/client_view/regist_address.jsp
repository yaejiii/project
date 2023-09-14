<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../mall_client/mall_index_top.jsp" %>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
        	  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
            
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detail_address").focus();
        }
    }).open();
}

$(function chageSelect(){
    //직접입력 인풋박스 기존에는 숨어있다가
$("#selboxDirect1").hide();
$("#selbox1").change(function() {
              //직접입력을 누를 때 나타남
		if($("#selbox1").val() == "direct") {
			$("#selboxDirect1").show();
		}  else {
			$("#selboxDirect1").hide();
		}
	}) 
});

</script>
<form name="form_address" action="insert_address.do" method="post">
<div class="container-fluid" style="width:80%;">
<div class="row" style=" justify-content: center;">
<div class="col-1 col-lg-3"></div>
<div class="col-10 col-lg-6" style="width:100%; max-width:500px; text-align:center; margin-top:30px">
<h2>주소록 등록</h2>

      <div style="margin:3px 0px;">
        <input class="input" placeholder="배송지명" name="address_name" style="width:100%; margin:10px 0px;">
      </div>
      <div style="margin:3px 0px;">
      	<input class="input"  placeholder="성명" name="rcv_name" style="width:100%; margin:10px 0px;">
      </div>


<div class="d-flex justify-content-center align-items-center" style="margin:3px 0px;">
<div class="align-self-between" style="width:100%; max-width:800px;">
<div class="float-start" style="width:68%; margin:10px 0px;">
      	<input id="postcode" name="zip_code" class="input" placeholder="주소" readonly style="width:100%">
</div>
<div class="float-start" style="width:4%"></div>
<div class="float-end" style="width:28%">
      	<input type="button" style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" onclick="execDaumPostcode()" value="우편번호">
</div>
</div>
</div>

      <div style="margin:3px 0px;">
      	<input id="address" name="address" class="input" style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" placeholder="기본주소" readonly>
      </div>
      <div style="margin:3px 0px;">
      	<input id="detail_address" name="address_detail" class="input" style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" placeholder="나머지주소">
      </div>
      
      
   	  <div style="margin:3px 0px; justify-content:space-between;">
      	<select style="border-radius:0; border: black solid 1px; width:31%; padding:12px; margin:10px 0px;" name="rcv_tel1">
      	<option>02</option>
      	</select> - 
     	<input class="input" name="rcv_tel2" style="border-radius:0; border: black solid 1px; width:31%; padding:10px; margin:10px 0px;" placeholder="유선전화"> -
      	<input class="input" name="rcv_tel3" style="border-radius:0; border: black solid 1px; width:31%; padding:10px; margin:10px 0px;">
      </div>

  	  <div style="margin:3px 0px; justify-content:space-between;">
      	<select style="border-radius:0; border: black solid 1px; width:31%; padding:12px; margin:10px 0px;" name="rcv_hp">
      	<option>010</option>
      	</select> - 
     	<input class="input" style="border-radius:0; border: black solid 1px; width:31%; padding:10px; margin:10px 0px;" name="rcv_hp2" placeholder="휴대전화"> -
      	<input class="input" style="border-radius:0; border: black solid 1px; width:31%; padding:10px; margin:10px 0px;" name="rcv_hp3">
      </div>
      
      <div style="margin:3px 0px;">
		<select id="selbox1" name="rcv_request" style="padding:10px; width:100%;" class="input">
			<option value="">--메세지 선택 (선택사항)--</option>
			<option value="배송 전에 미리 연락 바랍니다.">배송 전에 미리 연락 바랍니다.</option>
			<option value="부재 시 경비실에 맡겨주세요.">부재 시 경비실에 맡겨주세요.</option>
			<option value="부재 시 문 앞에 놓아주세요.">부재 시 문 앞에 놓아주세요.</option>
			<option value="빠른 배송 부탁드립니다.">빠른 배송 부탁드립니다.</option>
			<option value="택배함에 보관해주세요.">택배함에 보관해주세요.</option>
			<option value="direct">직접 입력</option>
		</select>
		<input type="text" id="selboxDirect1" name="selboxDirect1" class="input" style="width:100%; margin:10px 0px;"/>
      </div>
            
		 <div style="margin:3px 0px; text-align:left;">
  <input class="input_check" type="checkbox" name="rcv_default" value="1" style="border-radius:0; border: black solid 1px; padding:10px; margin:0px;"> 기본 배송지로 저장
</div> 


<div class="d-flex justify-content-center align-items-center" style="margin:3px 0px;">
<div class="align-self-between" style="width:100%; max-width:800px; margin-bottom:30px;">
<div class="float-start" style="width:48%;">
<button type="button" class="btn" style="width:100%; padding:16.5px; margin:10px 0px;" onClick="history.back()">취소</button>
</div>
<div class="float-start" style="width:4%"></div>
<div class="float-end" style="width:48%">
<button type="submit" class="btn s-btn" style="width:100%; padding:16.5px; margin:10px 0px;">저장</button>
</div>
</div>
</div> 

</div>
<div class="col-1 col-lg-3" style="margin-bottom:30px;"></div>
</div>
</div>
</form>
<%@include file="../mall_client/mall_index_bottom.jsp" %>
