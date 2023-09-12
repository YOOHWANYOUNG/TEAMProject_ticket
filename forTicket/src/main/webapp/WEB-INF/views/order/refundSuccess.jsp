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
<title>환불 완료</title>
<style>
	.mypage_right_wrap {
		margin: 0 auto;
	    float: center;
	    width: 800px;
	    min-height: 640px;
	    padding: 40px 30px 0 30px;
	    border-radius: 10px;
	    text-align:center;
	    line-height:200%;
	}
	
	.refundTable tr{
		text-align: center;
	}
	
	.refundTable td{
		padding-left: 100px;
		padding-top: 40px;
	}
	
	.liFont{
		font-size: 20px;
	}
	
	.refund_1{
		height:500px;
		margin-top:10px;
		border:1px solid #d2d2d2;
		border-radius: 10px;
		padding:10px 25px;
		font-size:15px;
		line-height:280%;
		border-color: #FF6251;
		padding-bottom: 50px;
	}
	
	.refund_2{
		height:180px;
		margin-top:30px; 
		border:1px solid #d2d2d2; 
		border-radius: 10px; 
		padding:10px 25px; 
		font-size:15px; 
		line-height:280%; 
		border-color: #FF6251; 
		padding-bottom: 50px; 
		text-align:left;
	}
</style>
</head>
<body>
<div class="mypage_right_wrap">
	<div style="margin-bottom:20px;">
    	<h2 style="text-align:left;">환불 완료</h2>
        <div style="width: auto; border: 1px solid; border-color: #FF6251; margin-top: 10px; margin-bottom:10px;"></div>
        	<div style="border-color: #FF6251; width:auto;"></div>
    </div>

<div style="margin-top:17px; padding:25px 0; text-align:center;">
	<div style="font-size:30px; font-weight:bold; color:#ff6060; margin-top: 10px; margin-bottom:10px;">
		환불 처리가 완료 되었습니다.
	</div>
</div>

<div class="refund_1">
	<table class="refundTable">
    	<tr>
    	<td><input type="image" src="${contextPath}/resources/images/drama/drama1.jpg" alt="연극1"></td>
    	<td style="font-weight: bold; font-size: 25px; text-align:left;">불편한 편의점<br>
    		<ul>
    			<li class="liFont"> 08.04[금] 19:30(1매)</li><br>
    			<li class="liFont"> 결제금액 : 15,000원</li><br>
    			<li class="liFont"> 환불금액 : 15,000원 </li><br>
    		</ul>
    	</td>
    	</tr>
    	<tr>
    	<td style="font-weight: bold; font-size: 20px;">환불예정일</td>
    	<td style="font-weight: bold; font-size: 20px; color: blue;">즉시 또는 평일 3~5일 이내</td>	
    	</tr>
     </table>
</div>
<div class="refund_2">
	● 신용카드는 익월 청구내역에서 제외되며 영업일(평일) 기준 1~2일 후 각 카드사를 통해 확인 가능합니다.<br>
	● 체크카드는 영업일(평일)기준 3~5일 후 연결된 계좌로 환불 금액이 입금됩니다.<br>
	● 페이코 등 간편결제 포인트를 이용하신 경우 동일한 결제수단의 포인트로 환불이 진행됩니다.<br><br>
	● 해당 티켓은 환불 승인이 완료되었기에 사용할 수 없으며, 환불 철회 또한 불가한 점 유의부탁드립니다.

</div>
</div>
<div style="padding:30px; text-align:center;">
	<span style="padding-left:20px;">
		<a href=""><button style="width:200px; height:50px; border:none; background:#ff4b4b; color:#fff; border-radius:5px; font-size:18px; font-weight:bold; cursor:pointer ">메인 페이지</button></a>
	</span>
</div>
<div style="padding:30px; text-align:center;">
	상세 내역은 예매내역을 확인해주시고,
문의사항은 1:1 문의 게시판으로 남겨주세요.
</div>
</body>
</html>