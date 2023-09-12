<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
 <c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 페이지</title>
<style>
	.mypage_right_wrap {
		margin: 0 auto;
	    float: center;
	    width: 800px;
	    background: #fff;
	    border-radius: 10px;
	    text-align:center;
	    line-height:200%;
	}
	
	* {
	    margin: 0;
	    padding: 0;
	}
		
	div {
	    display: block;
	}
	
	body, table {
	    text-align: center;
	    word-break: break-all;
	    font-size: 13px;
	    font-weight: 400;
	}
	
	.detail{
		border:3px solid #d2d2d2;
		border-radius: 20px;
		background:#fff;
		padding:10px 25px;
		font-size:15px;
		color:#313131;
		line-height:280%;
		border-color: #FF6251;
		height: auto;
	}
	
	.detail_title{
		width:150px;
		font-size:30px;
		font-weight:bold; 
		margin-bottom:30px;
		margin-top: 30px;
	}

	.option_title1{
		width:170px;
		float:left;
		color:#888;
		font-size:15px;
		text-align: left;
		margin-left: 25px;
	}
	
	.option_con1{
		width:100%;
		font-size:15px;
		text-align:left;
		font-weight:bold;
	}

</style>
</head>
<body>
<div class="mypage_right_wrap">
	<div class="detail">
        <div class="detail_title">상세 내역</div>
        <div style="width: auto; border: 1px solid; border-color: #FF6251; margin-top: 10px; margin-bottom:10px;"></div>
        <table>
        	<tr class="detail_table">
        		<td class="option_title1">티켓명
        		<td class="option_con1">${detail.goods_name}
        	</tr>
        	<tr>
        		<td class="option_title1">예매번호
        		<td class="option_con1">${detail.order_No}
        	</tr>
        	<tr>
        		<td class="option_title1">장소
        		<td class="option_con1">${detail.goods_place}
        	</tr>
        	<tr>
        		<td class="option_title1">날짜/시간
        		<td class="option_con1">${detail.goods_Date}
        	</tr>
        	<tr>
        		<td class="option_title1">수량
        		<td class="option_con1">${detail.totalQuantity}
        	</tr>
        	<tr>
        		<td class="option_title1">이용자
        		<td class="option_con1">${detail.receiver_name}
        	</tr>
        	<tr>
        		<td class="option_title1">티켓합계
        		<td class="option_con1">${detail.totalPrice}원
        	</tr>
        	<tr>
        		<td class="option_title1">환불기한
        		<td class="option_con1">이용 1일 전 자정까지 신청가능<br>(환불규정에 따라 위약금이 발생할 수 있음)
        	</tr>
        </table>
 	</div>
</div>

<div style="padding:30px; text-align:center;">
	<span style="padding-left:20px;">
		<a href="${contextPath }/order/ticketrefund.do?order_No=${detail.order_No}"><button style="width:200px; height:50px; border:none; background:#ff4b4b; color:#fff; border-radius:5px; font-size:18px; font-weight:bold; cursor:pointer ">환불신청하기</button></a>
	</span>
</div>
</body>
</html>