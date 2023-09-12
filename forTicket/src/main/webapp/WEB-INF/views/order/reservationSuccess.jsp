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
<title>메인 페이지</title>
<style>
	.mypage_right_wrap {
		margin: 0 auto;
	    float: center;
	    width: 800px;
	    min-height: 640px;
	    padding: 40px 30px 0 30px;
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
	
	.overlay_t {
		background: #000;
		bottom: 0; 
		left: 0; 
		opacity: 0.7; 
		position: fixed; 
		right: 0; 
		top: 0; 
		z-index: 99; 
		display:none;
	}
	
	.popup_layer {
		width:500px; 
		border-radius:10px; 
		margin-bottom:0px; 
		background:#eeeeee; 
		border:solid 1px #ccc; 
		position:absolute; 
		top:0px; 
		left:35%; 
		z-index:100; 
		display:none;
	}
	
	.rows_my_buy_pop_top {
		font-size:14px; 
		color:#313131;
		padding:10px;
	}
	
	.rows_my_buy_pop_detail {
		text-align:left;
		padding:10px 15px 15px 10px;
		border-radius:0 0 10px 10px; 
		background-color:#fff; 
		line-height:180%;  
		vertical-align:bottom;
	}
	
	.rows_my_buy_pop_line {
		width:100%;
		height:1px; 
		border-top:1px solid #ccc; 
		padding:0; 
	}
	
	.rows_my_buy_pop_box {
		width:48%; 
		text-align:center; 
		padding:3px 0; 
		border:1px solid #ddd; 
		background:#eee; 
	}
	
	.buy_detail_title {
		float:left; 
		width:23%; 
		word-wrap:break-word; 
		word-break:break-all; 
		font-size:12px;
	}
	
	.buy_detail_info {
		float:left; 
		width:77%;
	}
	
	.option_title{
		width:90px;
		float:left;
		color:#888;
		font-size:15px; 
	}
	
	.option_con1{
		width:100%;
		font-size:15px;
		text-align:left;
		padding-left:150px;
		font-weight:bold;
	}
	
	.option_con2{
		width:100%; 
		vertical-align:bottom; 
		font-size:15px; 
		text-align:left; 
		padding-left:150px;
		font-weight:bold;
		
	}
	
	.div2{
		height:auto;
		margin-top:30px;
		border:2px solid #d2d2d2;
		border-radius: 10px;
		background:#fff;
		padding:10px 25px;
		font-size:15px;
		color:#313131;
		line-height:280%;
		border-color: #FF6251;	
	}
</style>
</head>
<body>
<div class="mypage_right_wrap">

	<div class="mypage_right_title" style="margin-bottom:20px;">
        <h2 style="text-align:left;">결제 완료</h2>
        <div style="width: auto; border: 1px solid; border-color: #FF6251; margin-top: 10px; margin-bottom:10px;"></div>
        <div style="border-color: #FF6251; width:auto;"></div>
	</div>

<div style="margin-top:25px; padding:25px 0; border:2px solid #ff6060; border-radius:10px; text-align:center;">
	<div style="font-size:20px; font-weight:bold; color:#ff6060;">
		결제가 정상적으로 완료되었습니다.
		<div style="font-size:14px; font-weight:300; color:#333; padding-top:15px;">
			세부사항은 하단 예매내역을 참고해주세요.
		</div>
	</div>
</div>

<div class="div2">
	<c:forEach var="item" items="${myOrderList }">
        <div class="option_title">티켓명</div>
        <div class="option_con1">${item.goods_name }</div>
        
        <div class="option_title">예매번호</div>
        <div class="option_con1">${item.order_No }</div>
        
        <div class="option_title">장소</div>
        <div class="option_con2">${item.goods_place }</div>
        
        <div class="option_title">날짜/시간</div>
        <div class="option_con2">${item.orderDate } ${item.goods_Time }</div>
        
        <div class="option_title">수량</div>
        <div class="option_con2">${item.totalQuantity } 매</div>
        
        <div class="option_title">이용자</div>
        <div class="option_con2">${myOrderInfo.receiver_name }(${myOrderInfo.orderPhone })</div>
        
        <div class="option_title">티켓합계</div>
        <div class="option_con2">${item.totalPrice }원</div>
        
        <div class="option_title">환불기한</div>
        <div class="option_con2">이용 1일 전 자정까지 신청가능<br>(환불규정에 따라 위약금이 발생할 수 있음)</div>
 
	 </c:forEach>         
</div>
</div>

<div style="padding:30px; text-align:center;">
	<span>
		<a href="${contextPath}/main.do"><button style="width:200px; height:50px; border:1px solid #ff4b4b; border-radius:5px; background:#fff; color:#ff4b4b; font-size:18px; font-weight:bold; cursor:pointer ">홈으로</button></a>
	</span>

	<span style="padding-left:20px;">
		<a href="${contextPath}/member/myreservation.do?mem_id=${member.mem_id}"><button style="width:200px; height:50px; border:none; background:#ff4b4b; color:#fff; border-radius:5px; font-size:18px; font-weight:bold; cursor:pointer ">예매내역 전체보기</button></a>
	</span>
</div>
</body>
</html>