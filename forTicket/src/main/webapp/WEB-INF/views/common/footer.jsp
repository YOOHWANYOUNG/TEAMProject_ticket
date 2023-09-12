<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath" value = "${pageContext.request.contextPath}"/>

<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>하단 부분</title>
	<style type="text/css">
		
	</style>
</head>
<body>
	<div>
		<div style="width: 1100px; margin: auto; display:flex; padding: 40px 0;">
		<!-- 1열 -->
			<div style="width:290px; ">
				<div style="font-size:20px; font-weight:600; color:#000; text-align:left;">고객센터
				</div>
				<div style="font-size:24px; font-weight:800; color:#000; margin-top:5px; text-align:left;">XXXX-XXXX
				</div>
				<div style="font-size:14px; font-weight:600; color:#000; margin-top:5px; text-align:left;">월-금 09:00 ~ 18:00(주말·공휴일 휴무)
				</div>
				<div>

			<img src="${contextPath  }/resources/images/logo.png" style="width:100px; height: 80px; margin-top:10px;  float: left;">


				</div>
			</div>
			
		<!-- 2열 -->
			<div style="width:260px; margin-left:30px; ">
			</div>
		
		<!-- 3열 -->
			<div style="margin-left:30px;">
				<div style="margin-top:25px; font-size:14px; color:#888; line-height:160%;  margin-top:95px; text-align:left;">
					(주)XXXX | 대표이사: XXX | 대전광역시 서구 둔산로00길 0-0, 000호<br>
					사업자등록번호 : 000-00-00000<br>
					통신판매업신고 : 0000-XXXX-0000<br>
					개인정보관리책임자 : XXX(XXX@4Ticket.co.kr
				</div>
			</div>
			
		</div>
	</div>
</body>
</html>
