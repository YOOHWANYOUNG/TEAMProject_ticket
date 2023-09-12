<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>회원,사업주 선택창</title>
	<style>
		.container {
			padding-top: 100px;
			padding-bottom: 100px;
            width: 800px;
            height: 600px;
            margin: 0 auto; 
            text-align: center; 
        }

        .div1{
            display: inline-block; 
            width: 300px; 
            height: 500px;
            border: 3px solid #FF6251;
            border-radius : 30px;
            margin-top: 40px;
            margin-left : 80px;
            float:left;
        }
        
        .div1_1{
        	width: 300px; 
            height: 200px;
            margin-top:70px;
            font-size: 26px;
            font-weight: 700;
            color: black;
        }
        
        .div2{
            display: inline-block; 
            width: 300px; 
            height: 500px;
            border: 3px solid #FF6251;
            border-radius : 30px;
            margin-top: 40px;
            margin-left : 80px;
            float:right;
        }
	</style>
</head>

<body>
	<div class="container">
        <div class="div1">
		<a href="${contextPath}/member/memberForm.do" style="text-decoration: none;">
			<div><img src="${contextPath}/resources/images/member/mem1.png" style="width:260px; height:260px; margin-top:50px;" alt="회원">
			<div class="div1_1" >일반 사용자 회원가입</div>
			</div>
		</a>
        </div>
        <div class="div2">
        <a href="${contextPath}/member/businessForm.do" style="text-decoration: none;">
			<div><img src="${contextPath}/resources/images/member/mem2.png" style="width:260px; height:260px; margin-top:50px;" alt="사업자">
			<div class="div1_1" >사업자 사용자 회원가입</div>
			</div>
		</a>
        </div>    
    </div>
</body>

</html>