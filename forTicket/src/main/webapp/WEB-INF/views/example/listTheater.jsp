<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
	.clear {
	  clear: both;
	}
	.theater_list {
	  position: relative;
	  width: 255px;
	  margin-right: 26px;
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
	.right {
		float: right;
	}
</style>
</head>
<body>
<div class="wrap_1100">
<div>
	<p>공연장 목록</p>
	<c:if test="${isLogOn == true && member.id == 'admin' }">
		<input type="button" class="right" onclick="location.href='${contextPath}/theater/theaterForm.do'"/>
	</c:if>
</div>
<div style="margin-top: 25px;">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<c:forEach var="item" items="${theatersList}">
			<td valign="top" align="left">
				<a href="${contextPath}/theater/detailTheater.do?theater_id=${theater.theater_id}">
					<div class="theater_list">
						<div class="thumb">
							<img src="${contextPath}/resources/images/asin.jpeg" alt="아신극장">
						</div>
						<div class="theater_info">
							<p class="category">민간</p>
							<p class="title">아신극장</p>
						</div>
					</div>
				</a>
			</td>
			</c:forEach>
		</tr>
	</tbody>
</table>
</div>
</div>
</body>
</html>