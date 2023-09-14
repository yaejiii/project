<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../mall_client/mall_index_top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- 	<link href="resources/star.css" rel="stylesheet"/> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
</head>
<body>
	<div class="container-fluid" style="width: 80%;">

		<div class="row d-flex justify-content-center" style="flex-wrap: nowrap;">
			<div class="col-0 col-lg-1 col-xl-2"></div>
			<div class="col-12 col-lg-10 col-xl-8" style="text-align: center; padding: 10px; min-width: 350px; max-width: 800px;">
				<div class="row">
					<div class="col-3" style="margin: 3px 0px;">
						<select style="border-radius: 0; border: black solid 1px; background-color: transparent; width: 100%; padding: 12px; margin: 10px 0px;">
							<option>전체</option>
							<%-- 			          <c:forEach var="location" items="${location_category}">
 --%>
							<option>${location.area}</option>
							<%--			          </c:forEach>
 --%>
						</select>
					</div>
					<div class="col-9" style="margin: 3px 0px;">
						<form class="d-flex" role="search" action="store_search">
							<input type="search" style="border-radius: 0; border: black solid 1px; border-right: 0; width: 90%; padding: 10px; margin: 10px 0px;" placeholder="매장명/주소 직접 검색">
							<button type="submit" style="backgroundcolor: transparent; border-radius: 0; border: black solid 1px; border-left: 0; width: 10%; padding: 10px; margin: 10px 0px;">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
         	 					<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
       			 					</svg>
							</button>
						</form>
					</div>
				</div>
				<div>
					<div>
						<hr style="margin: 10px 0px; padding: 0px;">
					</div>
				</div>
				<c:if test="${empty StoreMap}">
					<div>
						<p>등록된 지점이 없습니다.</p>
					</div>
				</c:if>
					<!-- 생략된 코드 -->
					<c:forEach var="dto" items="${StoreMap}">

						<div class="float-start" style="margin: 3px 0px; padding: 0px 10px; text-align: left;">
							<div>
								<p style="font-size: 14px; margin: 10px 0px;">${dto.store_name}</p>
							</div>
							<div style="margin: 3px 0px; padding: 0px; text-align: left;">
								<p style="font-size: 11px; margin: 5px 0px;">${dto.store_address}</p>
								<p style="font-size: 11px; margin: 0px;">OPEN : ${dto.store_open}-${dto.store_close}/etc:${dto.store_memo}/ TEL ${dto.store_tel} 전화번호</p>
							</div>
						</div>

						<!-- 여기서부터  열고 닫기 -->
						<%-- <a data-bs-toggle="collapse" href="#collapse_map_api_${dto.store_num}">
		<div class="float-end d-flex align-items-center" style: height:100%">
			<svg xmlns="http://www.w3.org/2000/svg" width="30px" height="25px" fill="black" viewBox="0 0 16 16">
				<path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
			</svg>
		</div>
		<div style="clear:both;"></div>
	</a>

<div class="collapse" id="collapse_map_api_${dto.store_num}">
      <div style="margin:5px 0px;"> --%>
						<!-- 지도 표시 -->
						<div id="map_${dto.store_num}" style="width: 100%; height: 350px;"></div>

					
	<!-- 카카오맵 api -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c9c963dbca74de399a251e6dc1246a4c&libraries=services"></script>
	 <script type="text/javascript">
	 var mapContainer_${dto.store_num} = document.getElementById('map_${dto.store_num}');
	 var geocoder_${dto.store_num} = new kakao.maps.services.Geocoder();

	 // 주소를 좌표로 변환하는 함수인 `addressSearch`를 사용하여 주소를 좌표로 변환합니다.
	 geocoder_${dto.store_num}.addressSearch('${dto.store_address}', function(result, status) {
	   if (status === kakao.maps.services.Status.OK) {
	     // 변환된 좌표를 중심으로 하는 지도 객체를 생성합니다.
	     var map_${dto.store_num} = new kakao.maps.Map(mapContainer_${dto.store_num}, {
	       center: new kakao.maps.LatLng(result[0].y, result[0].x), // 변환된 좌표를 지도의 중심으로 설정합니다.
	       level: 3 // 지도의 확대 레벨을 설정합니다.
	     });

	     // 변환된 좌표에 마커를 생성하여 지도에 표시합니다.
	     var marker_${dto.store_num} = new kakao.maps.Marker({
	       position: new kakao.maps.LatLng(result[0].y, result[0].x),
	       map: map_${dto.store_num} // 마커를 생성한 지도에 표시합니다.
	     });

	     // 마커를 클릭했을 때 나타날 정보창을 생성합니다.
	     var infowindow_${dto.store_num} = new kakao.maps.InfoWindow({
	       content: '<div style="width:150px;text-align:center;padding:6px 0;">${dto.store_name}</div>' // 정보창에 표시될 내용을 설정합니다.
	     });

	  // 마커를 클릭했을 때 정보창을 열고 닫을 수 있는 플래그 변수
	     var infoWindowOpen_${dto.store_num} = false;
		
	     
	     kakao.maps.event.addListener(marker_${dto.store_num}, 'click', function() {
	       if (infoWindowOpen_${dto.store_num}) {
	         infowindow_${dto.store_num}.close(); // 이미 열려있는 정보창을 닫습니다.
	         infoWindowOpen_${dto.store_num} = false; // 플래그 변수를 닫힘 상태로 변경합니다.
	       }else {
	         infowindow_${dto.store_num}.open(map_${dto.store_num}, marker_${dto.store_num}); // 정보창을 엽니다.
	         infoWindowOpen_${dto.store_num} = true; // 플래그 변수를 열림 상태로 변경합니다.
	       }
	     });
	   }
	 });

                    </script>
</c:forEach>

			</div>

			<div class="col-0 col-lg-1 col-xl-2"></div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Sortable/1.13.0/Sortable.min.js"></script>

</body>
</html>
<%@include file="../mall_client/mall_index_bottom.jsp"%>