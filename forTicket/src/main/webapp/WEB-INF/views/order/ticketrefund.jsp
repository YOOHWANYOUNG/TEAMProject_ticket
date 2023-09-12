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
<title>환불 신청 화면</title>
<style>
.mypage_right_wrap {
    float: right;
    width: 780px;
    min-height: 640px;
    background: #fff;
    border-radius: 10px;
    margin-right: 40px;
}

#content {
    width: 78%;
    padding: 0px;
    margin-top: 50px;
    margin-left: 30px;
    float: left;
    border: 3px solid #FF6251;
    border-radius: 30px;
}

div, span {
    text-align: left;
}
* {
    margin: 0;
    padding: 0;
    font-family: 'Pretendard', 'Pretendard Variable';
}
user agent stylesheet
div {
    display: block;
}
body, table {
    word-break: break-all;
    font-size: 13px;
    font-weight: 400;
}

.mypage_right_title{
	margin-top: 30px;
	margin-bottom: 30px;
	font-size: 20px;
	font-weight: 700;
	
}

  div, span {
    text-align: left;
  }

  .section_box {
    padding: 0;
    margin-bottom: 25px;
    outline: 0px solid red;
  }

  .section_title {
    padding: 15px 20px;
    font-size: 18px;
    font-weight: 700;
    background: #f1f1f1;
    border: 1px solid #eee;
    border-bottom: none;
  }

  .section_content {
    padding: 20px 25px;
    border: 1px solid #eee;
  }

  .ticket_title {
    font-size: 18px;
    font-weight: 700;
    padding-top: 5px;
    padding-bottom: 15px;
  }

  .ticket_txt {
    display: flex;
    justify-content: flex-start;
    font-size: 15px;
    font-weight: 400;
  }

  .ticket_txt div:first-child {
    color: #999;
    width: 80px;
  }

  .ticket_txt div:last-child {
    color: #000;
    flex: 1;
  }

  .sub_text span {
    font-size: 16px;
    margin: 6px 0;
  }

  .sub_text_grey {
    color: #999999;
  }

  .refund_detail div {
    padding: 5px 0;
    font-size: 16px;
    line-height: 180%;
  }

  .refund_submit {
    width: 400px;
    height: 55px;
    background: #FF4B4B;
    border: none;
    border-radius: 10px;
    color:#FFF;
    font-size: 20px;
    font-weight: 700;
    cursor: pointer;
  }
</style>
<script>
function fn_cancel_order(order_No,mem_id){
	var answer=confirm("예매가 취소되었습니다.");
	if(answer==true){
		
		var formObj=document.createElement("form");
		var i_order_No = document.createElement("input"); 
		var i_mem_id = document.createElement("input"); 
	    
	    i_order_No.name="order_No";
	    i_mem_id.name="mem_id";
	    
	    i_order_No.value=order_No;
	    i_mem_id.value=mem_id;
		
	    formObj.appendChild(i_order_No);
	    formObj.appendChild(i_mem_id);
	    document.body.appendChild(formObj); 
	    formObj.method="post";
	    formObj.action="${contextPath}/order/refundSuccess.do";
	    formObj.submit();	
	}
}
</script>
</head>
<body>
<div class="mypage_right_wrap">
	<div class="mypage_right_title">
		환불 신청하기
	</div>

<section class="section_box">
	<div class="section_title">
		<span>예매내역 확인</span>
	</div>
	<div class="section_content">
		<div style="display: flex;">
			<div style="flex: 1; margin-left:25px; line-height: 180%;">
			<div class="ticket_title" style="border-bottom:1px solid #eee; margin-bottom:15px;">
				${refund.goods_name}
			</div>
			<div class="ticket_txt">
				<div>예매번호</div>
				<div>${refund.order_No}</div>
			</div>

			<div class="ticket_txt">
				<div>장소</div>
				<div>${refund.goods_place}</div>
			</div>
			</div>
		</div>
		<div style="padding-top: 5px;">
		<div style="margin-top: 10px; border-radius: 10px; background: #f1f1f1; padding: 12px 20px; font-size: 14px; color: #000; line-height: 180%; ">
		<div style="display: flex; justify-content: space-between;">
			<div style="width: 40px; color: #999; font-weight: 600;">옵션</div>
			<div style="flex: 1; text-align: right;">${refund.goods_Date}</div>
		</div>
		<div style="display: flex; justify-content: space-between;">
			<div style="width: 40px; color: #999; font-weight: 600;">가격</div>
			<div style="flex: 1; text-align: right;">${refund.goods_price}원 * ${refund.totalQuantity}매 = ${refund.totalPrice}원</div>
		</div>
		</div>
		</div>
	</div>
</section>

<section class="section_box">
  <div class="section_title">
    <span>환불금액</span>
  </div>

  <div class="section_content" style="border-bottom:none;">
    <div class="sub_text" style="display: flex; justify-content: space-between;">
      <span class="sub_text_grey">결제 금액</span>
      <span class="calcValue">${refund.totalPrice}원</span>
    </div>
  </div>

  <div class="section_content">
    <div class="sub_text" style="display: flex; justify-content: space-between;">
      <span style="font-weight: bold;">최종 환불 금액</span>
      <span class="calcValue" value="16900" style="font-weight: bold;">${refund.totalPrice}원</span>
    </div>
  </div>
</section>

<section class="section_box">
	<div class="section_title">
		<span>환불진행 안내</span>
	</div>
	<div class="section_content">
		<div class="refund_detail">
			<div>
			  · <span class="txt_red">환불 금액에 대한 결제 취소가 진행됩니다.</span><br>
			  · 신용카드는 익월 청구액에서 제외되며, 체크카드는 카드사에 따라 영업일 기준 3~5일 후<br>
			    연결된 계좌로 입금됩니다.<br>
			  · 환불신청 후 철회 또는 티켓 사용이 불가합니다. 결제/취소 세부사항은 네이버페이를 통해 확인해주세요.
			</div>
		</div>
	</div>
</section>

<section style="display: flex; flex-direction: column;">
	<div style="text-align: center; font-size: 16px;">
		<input type="checkbox" id="confirmCkeck" required="required" value="true" style="width:18px; height:18px; transform: translateY(4px);">
		<label for="confirm" style="padding-left:3px;">환불진행 안내사항을 확인했습니다.</label>
	</div>
	<div style="text-align:center; padding: 30px 0 45px 0;">
		<button onClick="fn_cancel_order('${refund.order_No}','${refund.mem_id}')" class="refund_submit">환불 진행하기</button>
	</div>
</section>
<input type="hidden" value="${refund.mem_id }">
</div>
</body>
</html>