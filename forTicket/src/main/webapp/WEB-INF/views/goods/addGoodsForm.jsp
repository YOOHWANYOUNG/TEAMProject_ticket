<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />	
<!DOCTYPE html>
<meta charset="utf-8">
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
  var cnt=0;
  function fn_addFile(){
	  if(cnt == 0){
		  $("#d_file").append("<br>"+"<input  type='file' name='main_image' id='f_main_image' />");	  
	  }else{
		  $("#d_file").append("<br>"+"<input  type='file' name='detail_image"+cnt+"' />");
	  }
  	
  	cnt++;
  }
  function fn_add_new_goods(obj){
		 fileName = $('#f_main_image').val();
		 if(fileName != null && fileName != undefined){
			 obj.submit();
		 }else{
			 alert("메인 이미지는 반드시 첨부해야 합니다.");
			 return;
		 }
	}
  $(document).ready(function() {

		//When page loads...
		$(".tab_content").hide(); //Hide all content
		$("ul.tabs li:first").addClass("active").show(); //Activate first tab
		$(".tab_content:first").show(); //Show first tab content

		//On Click Event
		$("ul.tabs li").click(function() {

			$("ul.tabs li").removeClass("active"); //Remove any "active" class
			$(this).addClass("active"); //Add "active" class to selected tab
			$(".tab_content").hide(); //Hide all tab content

			var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
			$(activeTab).fadeIn(); //Fade in the active ID content
			return false;
		});

	});
</script>    
</head>
<style>
	hr {
		width: 90%;
		float: left;
	}
	form {
		width: 1100px;
		margin: auto;
	}
#container {
	margin: 40px auto; width: 100%;
}
#selec {
	width: 317px;
}
ul.tabs {
	list-style: none; margin: 0px; padding: 0px; width: 100%; height: 32px; border-bottom-color: rgb(255, 0, 0); border-bottom-width: 1px; border-bottom-style: solid; float: left;
}
ul.tabs li {
	border-width: 1px; border-style: solid; border-color: rgb(153, 153, 153) rgb(153, 153, 153) rgb(255, 0, 0); margin: 0px 1px; padding: 0px; border-image: none; height: 31px; line-height: 31px; overflow: hidden; float: left; border-top-left-radius: 7px; border-top-right-radius: 7px; background-color: rgb(245, 245, 245);
}
ul.tabs li a {
	padding: 0px 20px; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; text-decoration: none; display: block;
}
ul.tabs li a:hover {
	background-color: rgb(202, 228, 255);
}
ul.tabs li.active {
	background: rgb(255, 255, 255); border-color: rgb(255, 0, 0) rgb(255, 0, 0) rgb(255, 255, 255); border-bottom-width: 2px; border-bottom-style: solid;
}
ul.tabs li.active a:hover {
	background: rgb(255, 255, 255); border-color: rgb(255, 0, 0) rgb(255, 0, 0) rgb(255, 255, 255); border-bottom-width: 2px; border-bottom-style: solid;
}
.tab_container {
	background: rgb(255, 255, 255); width: 100%; clear: both; border-top-color: currentColor; border-top-width: medium; border-top-style: none; 
}
.tab_content {
	padding: 10px 10px 20px; line-height: 1.8em; font-size: 0.75em; min-height: 400px;
}
.tab_content h4 {
	background-position: left top; margin: 10px 0px; padding: 20px 0px 5px 35px; height: 30px; color: rgb(255, 255, 255); letter-spacing: 4px; font-family: "NanumGothic", Serif; font-size: 16px; font-weight: bold; background-image: url("../imgs/h4_back.png"); background-repeat: no-repeat;
}
.tab_content p {
	margin: 10px 0px 0px;
}
.tab_content img {
	margin: 10px; padding: 5px;
}
.tab_content .writer {
	margin: 10px 0px; padding: 5px; color: rgb(0, 0, 0); font-size: 1.2em; font-weight: bold; border-bottom-color: rgb(255, 153, 0); border-bottom-width: 1px; border-bottom-style: solid;
}
</style>
<body>
<form action="${contextPath}/goods/addGoods.do" method="post"  enctype="multipart/form-data">
		<h1 align="left">상품 등록</h1>
<div class="tab_container">
	<!-- 내용 들어 가는 곳 -->
	<div class="tab_container" id="container">
		<ul class="tabs">
			<li><a href="#tab1">상품정보</a></li>
			<li><a href="#tab2">이용정보</a></li>
			<li><a href="#tab3">유의사항</a></li>
			<li><a href="#tab4">장소안내</a></li>
			<li><a href="#tab7">이미지</a></li>
		</ul>
		<div class="tab_container">
			<div class="tab_content" id="tab1">
				<table>
					<tr>
						<td width=200>상품 분류</td>
						<td width=500>
							<select name="goods_type" class="selec">
								<option value="drama">연극</option>
								<option value="musical">뮤지컬</option>
								<option value="concert">공연</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>장르</td>
						<td><input name="goods_genre" type="text" size="40"/></td>
					</tr>
					<tr>
						<td>상품명</td>
						<td><input name="goods_name" type="text" size="40"/></td>
					</tr>
					<tr>
						<td>공연 기간</td>
						<td><input name="goods_startDate" type="date" size="17"/> ~ 
						<input name="goods_endDate" type="date" size="17"/></td>
					</tr>
					<tr>
						<td>러닝타임</td>
						<td><input name="goods_runningTime" type="text" size="40"/></td>
					</tr>
					<tr>
						<td>이용등급</td>
						<td><input name="goods_age" type="text" size="40"/></td>
					</tr>
					<tr>
						<td>정가</td>
						<td><input name="goods_price" type="text" size="40"/></td>
					</tr>
					<tr>
						<td>할인율</td>
						<td><input  name="goods_discount" type="text" size="40" value="0"/></td>
					</tr>
					<tr>
						<td>좌석지정 여부</td>
						<td>
							<label for="Y">좌석 지정</label>
							<input name="goods_seats" type="radio" id="Y" value="Y"/>
							<label for="N">좌석 미지정</label>
							<input name="goods_seats" type="radio" id="N" value="N"/>
						</td>
					</tr>
				</table>
			</div>
			<div class="tab_content" id="tab2">
				<H4>이용정보</H4>
				<table>	
				 <tr>
					<td>이용정보</td>
					<td><textarea  rows="20" cols="80" name="goods_info"></textarea></td>
				</tr>
				</table>
			</div>
			<div class="tab_content" id="tab3">
				<H4>유의사항</H4>
				<table>	
				 <tr>
					<td>유의사항</td>
					<td><textarea  rows="20" cols="80" name="goods_notice"></textarea></td>
				</tr>
				</table>	
			</div>
			<div class="tab_content" id="tab4">
				<H4>장소안내</H4>
				<table>	
				 <tr>
					<td>공연장</td>
					<td>
						<select name="goods_place" onchange="displayTheaterLocation(selectElement)">
							<c:forEach var="theater" items="${theaterList}" varStatus="theaterNum">
								<option value="${theater.theater_name}">${theater.theater_name}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<div id="map" style="width: 450px; height: 400px;"></div>
									<div id="clickLatlng" style="display:none"></div>
										<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d4bbc1467ec79f5ab7103cd2a28dc98b&libraries=services"></script>
										<script>
								            function displayTheaterLocation(selectElement) {
								                var theater_address = selectElement.value;
								                var theater_name = selectElement.options[selectElement.selectedIndex].text;
								
								                var mapContainer = document.getElementById('map');
								                var mapOption = {
								                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
								                    level: 3 // 지도의 확대 레벨
								                };
								
								                var map = new kakao.maps.Map(mapContainer, mapOption);
								                var geocoder = new kakao.maps.services.Geocoder();
								
								                geocoder.addressSearch(theater_address, function(result, status) {
								                    if (status === kakao.maps.services.Status.OK) {
								                        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
								                        var message = 'latlng: new kakao.maps.LatLng(' + result[0].y + ', ' + result[0].x + ')';
								                        var resultDiv = document.getElementById('clickLatlng');
								                        resultDiv.innerHTML = message;
								
								                        var marker = new kakao.maps.Marker({
								                            map: map,
								                            position: coords
								                        });
								
								                        var infowindow = new kakao.maps.InfoWindow({
								                            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + theater_name + '</div>'
								                        });
								                        infowindow.open(map, marker);
								
								                        map.setCenter(coords);
								                    }
								                });
								            }
								        </script>
					</td>
				</tr>
				</table>	
			</div>
			<div class="tab_content" id="tab7">
				<h4>상품이미지</h4>
				<table>
					<tr>
						<td align="right">이미지파일 첨부</td>
			            <td  align="left"> <input type="button"  value="파일 추가" onClick="fn_addFile()"/></td>
			            <td>
				            <div id="d_file">
				            </div>
			            </td>
					</tr>
			</table>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<center>	
		 <table>
		 	<tr>
				<td align=center>
					<input  type="button" value="상품 등록하기"  onClick="fn_add_new_goods(this.form)">
				</td>
			</tr>
		 </table>
	</center>
</div>
</form>
</body>