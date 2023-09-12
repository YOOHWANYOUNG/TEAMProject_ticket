<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연장 목록</title>
<style>
a, a.underline {
	color: #000;
	text-decoration: none;
}

a.underline:hover {
	text-decoration: underline;
}

table {
	border-collapse: collapse;
}

object {
	display: block;
}

.wrap_1100 {
	margin: auto;
	width: 1100px;
	position: relative;
}

img {
	border: none;
	padding: 0;
	margin: 0;
}

img #map {
	width: 350px;
}

.clear {
	clear: both;
}

.theater_list {
	position: relative;
	margin-right: 26px;
	margin-bottom: 60px;
	letter-spacing: -1px;
	text-align: left;
	transition: transform 0.3s ease-in-out;
}

.theater_list .thumb img {
	width: 400px;
	border-radius: 10px;
	border: 1px solid #eee;
}

.theater_list .theater_info {
	width: 95%;
	padding: 0 5px;
	letter-spacing: -0.5px;
}

.theater_list .theater_info .area {
	display: inline-block;
	margin-top: 15px;
	padding: 5px 10px;
	font-size: 14px;
	color: #333;
	background: #eee;
	border-radius: 10px;
}

.theater_list .theater_info .category {
	display: block;
	margin-top: 10px;
	color: #999;
	font-size: 14px;
}

.theater_list .theater_info .title {
	margin-top: 10px;
	font-size: 25px;
	color: #000;
	font-weight: 600;
	display: block;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	text-align: left;
	word-break: break-all;
}

.theater_list .theater_info .detail {
	display: flex;
	justify-content: space-between;
	margin-top: 15px;
	font-size: 15px;
	color: #000;
	font-weight: 600;
	text-align: left;
}

.theater_list .theater_info .price .stars {
	font-size: 15px;
	color: #333;
	font-weight: 600;
}

.theater_list .theater_info .price .stars img {
	width: 15px;
	vertical-align: -1px;
	padding-right: 3px;
}

.theater_list .theater_info .price .stars span {
	font-size: 14px;
	font-weight: 300;
}

.main_title {
	font-size: 15px;
	text-align: left;
	color: #333;
	padding-left: 10px;
	padding-top: 30px;
	padding-bottom: 10px;
}

.txtbox {
	border: none;
	width: 450px;
	height: auto;
}
hr {
	width: 100%;
	float: left;
}
.btn1 {
    display: inline-block;
    width: 100px;
    height: 30px;
    text-align: center;
    margin-right: 15px;
    margin-top: 10px;
    background: #ff4b4b;
    color: #fff;
    font-size: 16px;
    font-weight: bold;
    border-radius: 10px;
    border: 0;
    cursor: pointer;
    float: right;
}
.btn2 {
    display: inline-block;
    width: 100px;
    height: 30px;
    text-align: center;
    margin-right: 15px;
    margin-top: 10px;
    background: #fff;
    color: #ff4b4b;
    font-size: 16px;
    font-weight: bold;
    border-radius: 10px;
    border: 2px solid #ff4b4b;
    cursor: pointer;
    float: right;
}
.btn3 {
    display: inline-block;
    width: 100px;
    height: 30px;
    text-align: center;
    margin-right: 80px;
    margin-top: 10px;
    background: #ccc;
    color: #fff;
    font-size: 16px;
    font-weight: bold;
    border-radius: 10px;
    border: 0;
    cursor: pointer;
    float: right;
}
#inputDetail {
	box-sizing: border-box;
	resize: none;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function backToList() {
		alert("목록으로 돌아갑니다.");
		location.href = "${contextPath}/theater/listTheater.do";
	}
	function resize() {
        let textarea = document.getElementById("inputDetail");
 
        textarea.style.height = "0px";
 
        let scrollHeight = textarea.scrollHeight;
        let style = window.getComputedStyle(textarea);
        let borderTop = parseInt(style.borderTop);
        let borderBottom = parseInt(style.borderBottom);
 
        textarea.style.height = (scrollHeight + borderTop + borderBottom)+"px";
    }
    
    window.addEventListener("load", resize);
    window.onresize = resize;
</script>

</head>
<body>
	<div class="wrap_1100">
		<div class="main_title">공연장 목록 > ${theater.theater_name}</div><hr>
		<div style="margin-top: 25px;">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tbody>
					<tr>
						<td valign="top" align="left">
							<div class="theater_list">
								<div class="thumb">
									<img src="${contextPath}/theater/download.do?theater_id=${theater.theater_id}&theater_image=${theater.theater_image}" alt="${theater.theater_name}">
								</div>
							</div>
						</td>
						<td valign="top" align="left">
							<div class="theater_list">
								<div class="theater_info">
									<p class="title">${theater.theater_name}</p>
									<label class=detail>분류 : </label><span>${theater.theater_cat}
										공연시설</span> <label class=detail>객석수 : </label><span>${theater.theater_seats}
										석</span> <label class=detail>상세정보 : </label><span><textarea
											class="txtbox" id="inputDetail" readonly>${theater.theater_detail}</textarea></span>
									<label class=detail>주소 : </label><span>${theater.theater_address}</span>
									<div id="map" style="width: 450px; height: 400px;"></div>
									<div id="clickLatlng" style="display:none"></div>
										<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d4bbc1467ec79f5ab7103cd2a28dc98b&libraries=services"></script>
										<script>
										var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
										    mapOption = {
										        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
										        level: 3 // 지도의 확대 레벨
										    };  
										
										// 지도를 생성합니다    
										var map = new kakao.maps.Map(mapContainer, mapOption); 
										
										// 주소-좌표 변환 객체를 생성합니다
										var geocoder = new kakao.maps.services.Geocoder();

										//주소, 공연장 이름 변수 설정
										var theater_address = "${theater.theater_address}";
										var theater_name = "${theater.theater_name}";
										
										// 주소로 좌표를 검색합니다
										geocoder.addressSearch(theater_address,function(result, status) {
											// 정상적으로 검색이 완료됐으면 
											if (status === kakao.maps.services.Status.OK) {

												var coords = new kakao.maps.LatLng(result[0].y,result[0].x);
												var message = 'latlng: new kakao.maps.LatLng('+ result[0].y + ', ' + result[0].x + ')';
												var resultDiv = document.getElementById('clickLatlng');
												resultDiv.innerHTML = message;

												// 결과값으로 받은 위치를 마커로 표시합니다
												var marker = new kakao.maps.Marker({
													map : map,
													position : coords
												});

												// 인포윈도우로 장소에 대한 설명을 표시합니다
												var infowindow = new kakao.maps.InfoWindow({
													content : '<div style="width:150px;text-align:center;padding:6px 0;">'+theater_name+'</div>'
												});
												infowindow.open(map,marker);

												// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
												map.setCenter(coords);
											}
										});
									</script>
									<input type="button" value="돌아가기" class="btn3" onclick="backToList()" />
									<c:if test="${isLogOn == true && type == 'admin' }">
										<input type="button" value="삭제하기" class="btn2"
											onclick="location.href='${contextPath}/theater/removeTheater.do?theater_id=${theater.theater_id}'" />
											<input type="button" value="수정하기" class="btn1"
											onclick="location.href='${contextPath}/theater/modTheaterForm.do?theater_id=${theater.theater_id}'" />
									</c:if>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>