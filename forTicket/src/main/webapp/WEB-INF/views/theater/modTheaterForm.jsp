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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function readURL(input) {
		if(input.files && input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	function backToList(obj) {
		alert("목록으로 돌아갑니다.");
		obj.method = "post"
		obj.action = "${contextPath}/theater/listTheater.do";
		obj.submit();
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
	padding-left: 30px;
	padding-top: 50px;
	padding-bottom: 20px;
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
#inputName, #inputCat, #inputSeats, #inputAddress {
	width: 240px;
}
#inputDetail {
	width: 250px;
	box-sizing: border-box;
	resize: none;
}
hr {
	width: 90%;
	float: left;
}
</style>
</head>
<body>
	<div class="wrap_1100">
		<div class="main_title">공연장 목록 > ${theater.theater_name}</div><hr>
		<div style="margin-top: 25px;">
			<form name="frmTheater" method="post" action="${contextPath}/theater/modTheater.do" encType="multipart/form-data">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tbody>
					<tr>
						<td valign="top" align="left">
							<div class="theater_list">
								<div class="thumb">
									<label for="inputImage">사진</label>
									<input type="hidden" name="originalFileName" value="${theater.theater_image}"/>
									<input type="file" name="theater_image" id="inputImage" onchange="readURL(this);" />
									<img id="preview" src="#" width="200" height="200" />
								</div>
							</div>
						</td>
						<td valign="top" align="left">
							<div class="theater_list">
								<div class="theater_info">
									<input type="hidden" name="theater_id" value="${theater.theater_id}"/>
									<label for="inputName" class="detail">공연장 이름 : 
									<input type="text" name="theater_name" id="inputName" value="${theater.theater_name}"/></label>
									<label for="inputCat" class="detail">공연장 분류 : 
									<input type="text" name="theater_cat" id="inputCat" value="${theater.theater_cat}"/></label>
									<label for="inputSeats" class="detail">공연장 객석수 : 
									<input type="text" name="theater_seats" id="inputSeats" value="${theater.theater_seats}"/></label>
									<label for="inputDetail" class="detail">공연장 상세정보 : 
									<textarea name="theater_detail" id="inputDetail">${theater.theater_detail}</textarea></label>
									<label for="inputAddress" class="detail">공연장 주소 : 
									<input type="text" name="theater_address" id="inputAddress" value="${theater.theater_address}"/>
									<button onclick="searchAddress()">지도 검색</button></label>
									<div id="map" style="width: 450px; height: 400px;"></div>
									<div id="clickLatlng" style="display:none"></div>
										<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d4bbc1467ec79f5ab7103cd2a28dc98b&libraries=services"></script>
										<script type="text/javascript">
									        function searchAddress() {
									    		event.preventDefault();
									            var inputAddress = document.getElementById("inputAddress").value;
									            var mapContainer = document.getElementById("map");
									            
									            var mapOption = {
									                center: new kakao.maps.LatLng(33.450701, 126.570667), // 초기 중심 좌표
									                level: 3 // 초기 확대 레벨
									            };
									            
									            var map = new kakao.maps.Map(mapContainer, mapOption);
									            var geocoder = new kakao.maps.services.Geocoder();
									            
									            geocoder.addressSearch(inputAddress, function(result, status) {
									                if (status === kakao.maps.services.Status.OK) {
									                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
									                    
									                    var marker = new kakao.maps.Marker({
									                        map: map,
									                        position: coords
									                    });
									                    
									                    map.setCenter(coords);
									                } else {
									                    alert("주소를 찾을 수 없습니다.");
									                }
									            });
									        }
									    </script>
									<input type="button" value="돌아가기" class="btn2" onclick="backToList(this.form)" />
									<input type="submit" value="수정하기" class="btn1"/>
									</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			</form>
		</div>
	</div>
</body>
</html>