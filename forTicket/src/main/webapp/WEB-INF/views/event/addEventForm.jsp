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
	//이벤트 유형 선택 변경 시 호출되는 함수
	  function handleEventTypeChange() {
	    var eventTypeSelect = document.getElementsByName("event_type")[0];
	    var eventFinalDateInput = document.getElementsByName("event_finalDate")[0];
	
	    if (eventTypeSelect.value === "disc") {
	      eventFinalDateInput.disabled = true;
	    } else {
	      eventFinalDateInput.disabled = false;
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
<script type="text/javascript">
  document.addEventListener("DOMContentLoaded", handleGoodsSelectChange);
  
  function handleGoodsSelectChange() {
    var selectedOption = document.getElementById("goodsSelect").options[document.getElementById("goodsSelect").selectedIndex];
    var g_type = selectedOption.getAttribute("data-goods-type");
    var g_type_ko = "";
    if(g_type=="drama"){
    	g_type_ko = "연극";
    } else if(g_type=="musical"){
    	g_type_ko = "뮤지컬";
    } else if(g_type=="concert"){
    	g_type_ko = "공연";
    }
    
    document.getElementById("goods_type").value = g_type_ko;
    document.getElementById("goods_genre").value = selectedOption.getAttribute("data-goods-genre");
    document.getElementById("goods_startDate").value = selectedOption.getAttribute("data-goods-startDate");
    document.getElementById("goods_endDate").value = selectedOption.getAttribute("data-goods-endDate");
    document.getElementById("goods_runningTime").value = selectedOption.getAttribute("data-goods-runningTime");
    document.getElementById("goods_age").value = selectedOption.getAttribute("data-goods-age");
    document.getElementById("goods_price").value = selectedOption.getAttribute("data-goods-price");
    document.getElementById("goods_discount").value = selectedOption.getAttribute("data-goods-discount");
  }
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
<form action="${contextPath}/event/addEvent.do" method="post"  enctype="multipart/form-data">
		<h1 align="left">이벤트 상품 등록창</h1>
<div class="tab_container">
	<!-- 내용 들어 가는 곳 -->
	<div class="tab_container" id="container">
		<ul class="tabs">
			<li><a href="#tab1">상품정보</a></li>
			<li><a href="#tab2">이벤트 정보</a></li>
			<li><a href="#tab7">이미지</a></li>
		</ul>
		<div class="tab_container">
			<div class="tab_content" id="tab1">
				<table>
					<tr>
						<td width=200>상품 선택</td>
						<td width=500>
							<select name="goods_id" id="goodsSelect" onchange="handleGoodsSelectChange()">
								<c:forEach var="goods" items="${goodsList}">
									<option value="${goods.goods_id}"
							            data-goods-type="${goods.goods_type}"
							            data-goods-genre="${goods.goods_genre}"
							            data-goods-startDate="${goods.goods_startDate}"
							            data-goods-endDate="${goods.goods_endDate}"
							            data-goods-runningTime="${goods.goods_runningTime}"
							            data-goods-age="${goods.goods_age}"
							            data-goods-price="${goods.goods_price}"
							            data-goods-discount="${goods.goods_discount }">${goods.goods_name}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>상품 분류</td>
						<td><input name="goods_type" id="goods_type" value="" type="text" size="40" readonly/></td>
					</tr>
					<tr>
						<td>장르</td>
						<td><input name="goods_genre" id="goods_genre" value="" type="text" size="40" readonly/></td>
					</tr>
					<tr>
						<td>공연 기간</td>
						<td><input name="goods_startDate" id="goods_startDate" value="" type="date" size="18" readonly/> ~ 
						<input name="goods_endDate" id="goods_endDate" value="" type="date" size="18" readonly/></td>
					</tr>
					<tr>
						<td>러닝타임</td>
						<td><input name="goods_runningTime" id="goods_runningTime" value="" type="text" size="40" readonly/></td>
					</tr>
					<tr>
						<td>이용등급</td>
						<td><input name="goods_age" id="goods_age" value="" type="text" size="40" readonly/></td>
					</tr>
					<tr>
						<td>정가</td>
						<td><input name="goods_price" id="goods_price" value="" type="text" size="40" readonly/></td>
					</tr>
					<tr>
						<td>할인율</td>
						<td><input  name="goods_discount" id="goods_discount" value="" type="text" size="40"/></td>
					</tr>
				</table>
			</div>
			<div class="tab_content" id="tab2">
				<table>
					<tr>
						<td width=200>이벤트 유형</td>
						<td width=500>
							<select name="event_type" onchange="handleEventTypeChange()">
								<option value="disc">예매 할인</option>
								<option value="inv" selected>초대권 증정</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>이벤트 기간</td>
						<td><input name="event_startDate" type="date" size="18"/> ~ 
						<input name="event_endDate" type="date" size="18"/></td>
					</tr>
					<tr>
						<td>당첨자 발표</td>
						<td><input name="event_finalDate" value="" type="date" size="40"/></td>
					</tr>
					<tr>
						<td>이벤트 제목</td>
						<td><input name="event_name" type="text" size="40"/></td>
					</tr>
					<tr>
						<td>이벤트 내용</td>
						<td><textarea rows="20" cols="80" name="event_detail"></textarea></td>
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