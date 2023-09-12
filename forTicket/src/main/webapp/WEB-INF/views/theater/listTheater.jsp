<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연장 목록</title>
<style>
	a,
	a.underline {
	  color: #000;
	  text-decoration: none;
	}
	
	a.underline:hover {
	  text-decoration: underline;
	}
	table {
	  border-collapse: collapse;
	  width: 1100px;
	  display: inline-block;
	  border: 0;
	  cellpadding: 0;
	  cellspacing: 0;
	}
	object {
	  display: block;
	}
	.wrap_1100 {
	  margin: auto;
	  width: 1100px;
	  position: relative;
	  display: inline-block;
	}
	img {
	  border: none;
	  padding: 0;
	  margin: 0;
	}
	.clear {
	  clear: both;
	}
	.theater_list {
	  position: relative;
	  width: 255px;
	  margin-right: 20px;
	  margin-bottom: 60px;
	  letter-spacing: -1px;
	  text-align: left;
	  transition: transform 0.3s ease-in-out;
	}
	.theater_list:hover {
	  transform: translateY(-5px);
	}
	.theater_list .thumb img {
	  width: 255px;
	  height: 357px;
	  border-radius: 10px;
	  border: 1px solid #eee;
	}
	.theater_list .theater_info {
	  width: 95%;
	  padding: 0 5px;
	  letter-spacing: -0.5px;
	}
	.ticket_list .ticket_info .area {
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
	  font-size: 18px;
	  color: #000;
	  font-weight: 400;
	  display: block;
	  overflow: hidden;
	  white-space: nowrap;
	  text-overflow: ellipsis;
	  word-break: break-all;
	}
	.theater_list .theater_info .price {
	  display: flex;
	  justify-content: space-between;
	  margin-top: 15px;
	  font-size: 18px;
	  color: #000;
	  font-weight: 600;
	  text-align: left;
	}
	.main_title {
		font-size: 25px;
		font-weight: 900;
		text-align: left;
		padding-top: 50px;
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
	hr {
		width: 100%;
		float: left;
	}
</style>
</head>
<body>
<div class="wrap_1100">
<div class="main_title">공연장 목록
<c:if test="${isLogOn == true && type == 'admin' }">
<input type="button" value="등록하기" class="btn1" onclick="location.href='${contextPath}/theater/theaterForm.do'" />
</c:if>
</div><hr>
<div style="margin-top: 25px;">
<c:choose>
	<c:when test="${empty theatersList}">
		<strong>등록된 공연장이 없습니다.</strong>
	</c:when>
	<c:otherwise>
		<ul>
			<c:forEach var="theater" items="${theatersList}">
				<li>
					<a href="${contextPath}/theater/detailTheater.do?theater_id=${theater.theater_id}">
						<div class="theater_list">
							<div class="thumb">
								<img src="${contextPath}/theater/download.do?theater_id=${theater.theater_id}&theater_image=${theater.theater_image}" alt="${theater.theater_name}">
							</div>
							<div class="theater_info">
								<p class="category">${theater.theater_cat}</p>
								<p class="title">${theater.theater_name}</p>
							</div>
						</div>
					</a>
				</li>
			</c:forEach>
		</ul>
	</c:otherwise>
</c:choose>
</div>
</div>
</body>
</html>