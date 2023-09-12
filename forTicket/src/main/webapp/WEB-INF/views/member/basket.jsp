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
	<title>예매 내역</title>
	<style>
	.search{
		width: 100%;
		border: 1px solid #FF6251;
		border-collapse: collapse;
		border-style: hidden;
        box-shadow: 0 0 0 2px #FF6251;
        border-spacing: 0;
        border-radius: 15px;
	}
	
	tr,td{
		border-bottom: 2px solid #FF6251;
		font-size: 15px;
	}
	
	.inputSize{
		border: 1px solid #696969;
        height: 20px;
        border-radius: 10px;
	}
	
	.inputSize1{
		width:180px;
		border: 1px solid #696969;
        height: 20px;
        border-radius: 10px;
	}
	
	.clear {
		clear: both;
		height: 50px;
	}
	
	.result{
		width: 100%;
		border: 1px solid #FF6251;
		border-collapse: collapse;
		border-style: hidden;
        box-shadow: 0 0 0 2px #FF6251;
        border-spacing: 0;
        border-radius: 15px;
	}
	
	.reply{
		text-decoration: none;
		color: #FF6251;
	}
	
	.mypage4{
		border:3px solid #d2d2d2;
		border-radius: 15px;
		padding:10px 15px;
		font-size:15px;
		line-height:280%;
		border-color: #FF6251;
		padding-bottom: 50px;
	}
	
	.alink{
		text-decoration: none;
		cursor: pointer;
		color: black;
	}
	
	.optionsize{
		border: 1px solid #696969;
        height: 20px;
        border-radius: 10px;   
        text-align: center;     
	}
	
	.font1{
		font-size: 12px;
	}
	</style>
</head>

<body>
<div class="mypage4">
<form method="post" name="frm_list">
	<div style="margin-bottom:20px;">
    	<h2 style="text-align:left;">관심공연</h2>
    	<a href="${contextPath}/goods/listGoods.do?goodsType=drama"> 연극 &gt; </a>
        	<a href="${contextPath}/goods/listGoods.do?goodsType=musical"> 뮤지컬 &gt; </a>
        	<a href="${contextPath}/goods/listGoods.do?goodsType=concert"> 공연 &gt; </a>
        <div style="width: auto; border: 1px solid; border-color: #FF6251; margin-top: 10px; margin-bottom:10px;"></div>
        	<div style="border-color: #FF6251; width:auto;"></div>
        	
    </div>

<div class="clear"></div>

	<table class="result">
		<c:choose>
			<c:when test="${empty reservation_list}">
				<tr>
					<td colspan="9">
					<strong>관심 공연이 없습니다.</strong>
					</td>		
			</c:when>
			<c:otherwise>
				<c:forEach var="order" items="${reservation_list}">
					<tr>
						<td class="font1">${order.order_No }</td>
						<td class="font1">${order.goods_name }</td>
						<td class="font1">${order.goods_Date }</td>
						<td class="font1">${order.goods_place }</td>
						<td class="font1">${order.totalQuantity }</td>
						<td class="font1">${order.ordersit }</td>
						<td class="font1">
							<c:choose>
   		 						<c:when test="${order.orderStatus == '예매완료'}">
									<a href="${contextPath}/community/review.do?order_No=${order.order_No}" class="reply">리뷰쓰기</a>&nbsp;/&nbsp;
        							<a href="${contextPath}/order/ticketDetail.do?order_No=${order.order_No}" class="reply">${order.orderStatus}</a>
    							</c:when>
    							<c:otherwise>
									${order.orderStatus }	
        						</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan=8 class="fixed">
				<c:forEach   var="page" begin="1" end="10" step="1" >
					<c:if test="${section >1 && page==1 }">
						<a class="alink" href="${contextPath}/member/basket.do?section=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp;pre &nbsp;</a>
					</c:if>
						<a class="alink" href="${contextPath}/member/basket.do?section=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
					<c:if test="${page ==10 }">
						<a class="alink" href="${contextPath}/member/basket.do?section=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
					</c:if> 
				</c:forEach> 
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>