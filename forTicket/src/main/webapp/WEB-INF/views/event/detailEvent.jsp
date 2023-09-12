<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="imageList" value="${eventMap.imageFileList }" />
<c:set var="event" value="${eventMap.event}" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
	var eventNo = null;
	var memId = "";
	function applyEvent(){
		eventNo = ${event.event_no};
		console.log(eventNo);
		memId = "${member.mem_id}";
		console.log(memId);
		var returnVal = confirm("이벤트에 응모하시겠습니까?");
		if(returnVal){
			if(memId.length==0){
				alert("로그인 후 응모가 가능합니다.");
			} else {
				$.ajax({
					type : "post",
					async : false,
					url : "/event/eventApply.do",
					data : {
						event_no : eventNo,
						mem_id : memId
					},
					success : function(data, textStatus){
						alert("이벤트에 응모 되셨습니다.");
						tr.style.display = 'none';
					},
					error : function(data, textStatus){
						alert("에러가 발생했습니다."+textStatus);
					},
					complete : function(data, textStatus){}
				});
			}
		} else {
			alert("이벤트 응모를 취소했습니다.");
		}
	};
</script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/calendar_theme.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/detail.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/user_review.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/common.css">
<style>
.main_tab_wrap {
	/* border: 1px solid #eee; */
	border-top: none;
	padding: 30px 59px;
	border-radius: 10px;
}

/* 상세 이미지 펼쳐보기 */
.info_detail_btn {
	position: absolute;
	bottom: 15px;
	width: 94%;
	height: 55px;
	line-height: 55px;
	margin-left: 3%;
	border: 1px solid #ccc;
	border-radius: 10px;
	background: #fff;
	color: #000;
	font-size: 20px;
	font-weight: 600;
	text-align: center;
	box-shadow: 1px 1px 3px 2px #ddd;
}

.info_detail_poster {
	position: relative;
	margin-top: 35px;
	width: 100%;
	height: 700px;
	color: #fff;
	font-size: 20px;
	background-size: 100%;
	background-repeat: no-repeat;
	background-position-y: 0%;
	background-image:
		url('./wys2/file_attach_thumb/2021/05/21/1621571534-67-0_wonbon_N_7_600x600_70_2.jpg');
}

.info_detail_gradient {
	width: 100%;
	height: 700px;
	background-image: linear-gradient(to bottom, rgba(255, 255, 255, 0) 40%,
		rgba(255, 255, 255, 0.4) 60%, rgba(255, 255, 255, 0.8) 80%,
		rgb(255, 255, 255) 100%);
}

/* 상세 이미지 스타일   */
.main_img {
	margin-top: 35px;
	width: 700px;
	text-align: center;
}

.main_img img {
	display: block;
	width: 100%;
}

.viewpage_flex {
	display: flex;
	justify-content: flex-start;
}

.viewpage_flex div:nth-child(1) {
	padding-left: 10px;
	width: 120px;
	color: #888;
}

.viewpage_flex div:nth-child(2) {
	color: #000;
}

.viewpage_flex a {
	text-decoration: underline;
}

.border_box {
	border: 1px solid #eee;
	padding: 10px 20px;
	border-radius: 10px;
	margin-top: 5px;
}

.border_box .viewpage_flex {
	border-bottom: 1px solid #eee;
	padding-bottom: 8px;
	margin-bottom: 8px;
}

.border_box .viewpage_flex:last-child {
	border: none;
	padding-bottom: 0;
	margin-bottom: 0;
}

.now_engine {
	padding-bottom: 15px;
	font-size: 15px;
	font-weight: 400;
}

.now_engine a {
	color: #555;
}

.theater_list {
	position: relative;
	margin-right: 26px;
	margin-bottom: 60px;
	letter-spacing: -1px;
	text-align: left;
	transition: transform 0.3s ease-in-out;
}

.theater_list .theater_info {
	width: 95%;
	padding: 0 5px;
	letter-spacing: -0.5px;
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

.submit_btn button {
	display: inline-block;
	width: 45%;
	height: 50px;
	line-height: 50px;
	text-align: center;
	background: #ff4b4b;
	color: #fff;
	font-size: 16px;
	font-weight: bold;
	border-radius: 10px;
	border: 0;
	cursor: pointer;
}

.textarea_detail1{
		border : none;
		background: #fff;
	}
</style>

</head>

<body>
	<div style="padding-top: 20px; width: 815px; margin: 0 auto;">
		<div class="now_engine" style="margin-right: 650px;">
			🗂️ <a href="#">이벤트 &gt; </a><a href="#">
			<c:choose>
				<c:when test="${event.event_type == 'disc' }">
					예매 할인
				</c:when>
				<c:otherwise>
					초대권 증정
				</c:otherwise>
			</c:choose>
			</a>
		</div>

		<div
			style="float: left; position: relative; width: 482px; margin-right: 20px; border-radius: 10px;">
			<img src="${contextPath}/event/download.do?event_no=${event.event_no}&event_fileName=${event.event_fileName}"
				style="border-radius: 10px;">
		</div>
		
		<!-- 오른쪽  -->
		<section style="float: right; width: 307px;">
			<div class="theater_list">
				<div class="theater_info">
					<p class="title">${event.event_name}</p>
					<p class="detail">유형 : 
					<c:choose>
						<c:when test="${event.event_type == 'disc'}">
							예매 할인
						</c:when>
						<c:otherwise>
							초대권 증정
						</c:otherwise>
					</c:choose></p>
					<p class="detail">이벤트 기간 : ${event.event_startDate} ~ ${event.event_endDate}</p>
					<c:if test="${event.event_type == 'disc'}">
						<p class="detail">할인율 : ${goods.goods_discount}%</p>
					</c:if>
					<c:if test="${event.event_type == 'inv'}">
						<p class="detail">당첨자 발표 : ${event.event_finalDate}</p>
					</c:if>
					<p class="detail">이벤트 내용 :
					</p>
					<textarea class="textarea_detail1" rows="5" cols ="80" disabled>${event.event_detail}</textarea>
				</div>
			</div>
			<div class="submit_btn">
				<c:if test="${event.event_type == 'inv'}">
					<button type="button" onclick="applyEvent()" class="">응모하기</button>
				</c:if>
			</div>
		</section>

		<div style="clear: both;"></div>

		<!-- 상세정보 -->
		<section
			style="width: 820px; margin: 0 auto; padding-top: 20px; border-radius: 10px; border: 1px solid #eee;">
			<div id="ajaxcontentarea" class="contentstyle1">
				<div class="main_tab_wrap">
					
					<!-- 상세이미지 -->
					<c:forEach var="image" items="${imageList}">
						<img src="${contextPath}/event/download.do?event_no=${event.event_no}&event_fileName=${image.fileName}">
					</c:forEach>
					
					<div class="main_img"></div>
				</div>
			</div>
		</section>
</body>

</html>