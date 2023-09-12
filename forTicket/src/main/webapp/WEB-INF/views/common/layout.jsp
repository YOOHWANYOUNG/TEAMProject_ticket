<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<c:set var="contextPath" value = "${pageContext.request.contextPath}"/>

<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<!-- 사이드 없는 layout -->
	<meta charset="UTF-8">
	<style>
		#container{
			width: 100%;
			margin: 0px auto;
			text-align: center;
			border: 0px solid #bcbcbc;
		}
		
		#header{
			padding: 5px;
			height: 180px;
			border-bottom: 1px solid #eee;
		}
				
		#content{
			padding: 0px;
			margin: 0px auto;
			float: center;
			border: 0px solid #bcbcbc;
		}
		
		#footer{
			clear: both;
			border-top: 1px solid #eee;
		}
	</style>
	<title><tiles:insertAttribute name="title" /></title>
</head>
<body>
	<div id="container">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="content">
			<tiles:insertAttribute name="body" />
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>	
	</div>
</body>
</html>