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
<!-- 사이드 있는 layout -->
	<meta charset="UTF-8">
	<style>
		#container{
			width: 1100px;
			margin: 0px auto;
			text-align: center;
			border: 0px solid #bcbcbc;
		}
		
		#header{
			padding: 5px;
			height: 180px;
			border-bottom: 1px solid #eee;
		}
		
		#sidebar-left{
			width: 15%;
			height: 500px;
			padding: 5px;
			margin-top: 50px;
			margin-bottom: 50px;
			float: left;
			border: 3px solid #FF6251;
			font-size: 10px;
			border-radius : 30px;
		}
		
		#content{
			width: 78%;
			padding: 0px;
			margin-top: 50px;
			margin-left: 15px;
			float: left;
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
		
		<div id="sidebar-left">
			<tiles:insertAttribute name="side" />
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