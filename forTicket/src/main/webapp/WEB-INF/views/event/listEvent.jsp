<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>진행중인 이벤트</title>
	<style>
	.mypage4{
		border:3px solid #FF6251;
		border-radius: 15px;
		width: 1100px;
		margin: auto;
		padding:10px 15px;
		font-size:15px;
		position: relative;
		display: inline-block;
	}
	a {
	    font-size: 0;
	    text-decoration: none;
	    outline: none;
	    color: inherit;
	}
	.event-main-list {
		display: inline-block;
	}
	.event-main-list li > a {
	    display: block;
	    position: relative;
	    width: 100%;
	    height: 405px;
	    margin-right: 20px;
	    margin-bottom: 38px;
	    padding: 5px;
	    overflow: hidden;
	}
	.event-main-list li > a img {
	    height: 258px;
	    transition: all ease-out 0.3s;
	}
	.event-main-list li > a .eve-mlist-tit {
	    font-size: 16px;
	    color: #333;
	    line-height: 16px;
	    overflow: hidden;
	}
	.event-main-list li > a .eve-mlist-txt {
	    font-size: 13px;
	    color: #999;
	    line-height: 13px;
	}
	.event-main-list li > a .eve-mlist-mark span#disc {
	    min-width: 67px;
	    line-height: 25px;
	    text-align: center;
	    padding: 0 8px;
	    font-size: 15px;
	    font-weight: 700;
	    color: #ec7d2c;
	    border: 1px solid #ec7d2c;
	    border-radius: 15px;
	}
	.event-main-list li > a .eve-mlist-mark span#inv {
	    min-width: 67px;
	    line-height: 25px;
	    text-align: center;
	    padding: 0 8px;
	    font-size: 15px;
	    font-weight: 700;
	    color: #3E90FF;
	    border: 1px solid #3E90FF;
	    border-radius: 15px;
	}
	.event-division {
		text-align: center;
		margin-bottom: 60px;
	}
	.event-division a {
		display: inline-block;
	    font-size: 16px;
	    font-weight: 700;
	    margin: 0 45px;
	    color: #888;
	    position: relative;
	}
	.event-division a.active {
	    color: #FF6251;
	}
	.event-division a:after {
	    content: "";
	    display: block;
	    width: 1px;
	    height: 15px;
	    background: #ddd;
	    position: absolute;
	    top: 15px;
	    right: -45px;
	}
	.event-division a:last-child {
	    margin-right: 0;
	}
	.event-division a:last-child::after {
	    content: none;
	}
	.event_list:hover {
		transform: translateY(-5px);
	}
	.event_list {
	    transition: transform 0.3s ease-in-out;
	}
	</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	//When page loads...
	$(".tab_content").hide(); //Hide all content
	$("nav.event-division a:first").addClass("active").show(); //Activate first tab
	$(".tab_content:first").show(); //Show first tab content

	//On Click Event
	$("nav.event-division a").click(function() {

		$("nav.event-division a").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".tab-content").hide(); //Hide all tab content

		var activeTab = $(this).attr("href"); //Find the href attribute value to identify the active tab + content
		$(activeTab).fadeIn(); //Fade in the active ID content
		return false;
	});

});
</script>

</head>

<body>
<div class="mypage4">
	<div style="margin-bottom:20px;">
    	<h2 style="text-align:center;">이벤트</h2>
    </div>
	<nav class="event-division">
		<a href="#event-ing" id="on">진행중인 이벤트</a>
		<a href="#event-end" id="">종료된 이벤트</a>
	</nav>
	<div class="clear"></div>
	<div class="event-main-list">
		<div id="event-ing" class="tab-content">
			<ul>
				<c:choose>
					<c:when test="${not empty eventList}">
						<c:forEach var="event" items="${eventList}">
							<c:choose>
								<c:when test="${event.event_status == '진행중'}">
									<li class="event_list">
										<a href="${contextPath}/event/detailEvent.do?event_no=${event.event_no}">
											<img src="${contextPath}/event/download.do?event_no=${event.event_no}&event_fileName=${event.event_fileName}" alt="${event.event_name}">
											<div class="eve-mlist-box">
												<c:choose>
													<c:when test="${event.event_type == 'disc'}">
														<p class="eve-mlist-mark"><span id="disc">예매 할인</span></p>
													</c:when>
													<c:otherwise>
														<p class="eve-mlist-mark"><span id="inv">초대권 증정</span></p>
													</c:otherwise>
												</c:choose>
												<p class="eve-mlist-tit">${event.event_name}</p>
												<p class="eve-mlist-txt">${event.event_startDate} ~ ${event.event_endDate}
													<c:if test="${event.event_type=='inv' }">
													 | ${event.event_finalDate} 발표
													</c:if>
												</p>
											</div>
										</a>
									</li>
								</c:when>
								<c:otherwise>
									
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<strong>진행중인 이벤트가 없습니다.</strong>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<div id="event-end" class="tab-content" style="display: none;">
			<ul>
				<c:choose>
					<c:when test="${not empty eventList}">
						<c:forEach var="event" items="${eventList}">
							<c:choose>
								<c:when test="${event.event_status == '종료'}">
									<li>
										<a href="${contextPath}/event/detailEvent.do?event_no=${event.event_no}">
											<img src="${contextPath}/event/download.do?event_no=${event.event_no}&event_fileName=${event.event_fileName}" alt="${event.event_name}">
											<div class="eve-mlist-box">
												<c:choose>
													<c:when test="${event.event_type == 'disc'}">
														<p class="eve-mlist-mark"><span id="disc">예매 할인</span></p>
													</c:when>
													<c:otherwise>
														<p class="eve-mlist-mark"><span id="inv">초대권 증정</span></p>
													</c:otherwise>
												</c:choose>
												<p class="eve-mlist-tit">${event.event_name}</p>
												<p class="eve-mlist-txt">${event.event_startDate} ~ ${event.event_endDate}</p>
													<c:if test="${event.event_type=='inv' }">
														<p>${event.event_finalDate} 발표</p>
													</c:if>
											</div>
										</a>
									</li>
								</c:when>
								<c:otherwise>
									
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<strong>종료된 이벤트가 없습니다.</strong>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</div>
</body>
</html>