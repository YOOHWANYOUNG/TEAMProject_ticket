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
	<title>예매 페이지</title>
	<style>
	.section_box{
		 width: 800px;
		 margin: auto;
		 padding: 10px 50px;
		 background: #f1f1f1;
		 border-radius: 10px;
		 margin-top: 50px;
	}
 	
 	.page_title {
    	font-size: 24px;
    	font-weight: 500;
   		padding: 35px 0px 21px 0px;
  	}

  	.page_title div {
    	position: relative;
    	width: 660px;
    	top: 10px;
    	right: 0px;
    	border-bottom: 1px dotted #777;
  	}

  	.basket_title {
    	padding-top: 20px;
    	color: #000;
    	font-size: 18px;
    	font-weight: 700;
  	}
  	
  	.option_title{
  		width:90px;
  		float:left;
  		color:#888"
  	}

  	.policy_slide {
    	margin-left: 15px;
    	color: #555;
    	font-weight: 400;
    	font-size: 14px;
    	border: 1px solid #d2d2d2;
    	background: #fff;
    	border-radius: 5px;
    	padding: 1px 15px;
    	cursor: pointer;
  	}

  	.policy_contents {
	    display: none;
	    overflow: hidden;
	    transition: all 600ms ease;
  	}

	.basket_text {
	  	margin-top: 5px;
	  	font-size: 14px;
	  	line-height: 22px;
	  	color: #555;
	}

  	.basket_box {
	    margin-top: 8px;
	    border: 1px solid #d2d2d2;
	    border-radius: 10px;
	    background: #fff;
	    padding: 10px 25px;
	    font-size: 15px;
	    color: #000;
	    line-height: 160%;
  	}

  .basket_input {
		display: inline-block;
		width: 280px;
		height: 20px;
		font-size: 15px;
		padding: 2px 0 2px 8px;
		margin: 3px 0;
		border: none;
		border-radius: 5px;
		background: #eee;
  }

  .basket_subtitle {
		display: inline-block;
		width: 85px;
		color: #888;
		font-size: 15px;
  }
	
  .input_detail {
		width: 100px;
		height: 20px;
		font-size: 15px;
		border: 1px solid #ddd;
		border-radius: 5px;
		padding: 2px 0 2px 5px;
		vertical-align: middle;
  }

  .point_span {
    margin-left: 100px;
    font-size:15px;
  }

  .point_use {
    font-size:14px;
    border-radius: 5px;
    background: #292793; color:#fff;
    margin-left: 5px;
    padding: 4px 10px; vertical-align: middle; cursor:pointer;
  }

  .pay_total {
    color:#ff0000; font-size:18px; font-weight:700; margin-left:18px;
  }

  .pay_total_point {
    color:#555; font-size:14px; font-weight:normal; margin-left:5px; letter-spacing: 0px;
  }

  .refund_txt {
    margin-top: 10px;
    color: #555;
    font-weight: normal;
    padding-top: 10px;
    font-size: 14px;
    background: #fff;
    line-height: 150%;
    padding: 0 20px 20px 20px;
    border: 1px solid #d2d2d2;
    border-radius: 10px;
  }

  .refund_txt .viewpage_noti {
    padding-top: 10px;
    font-weight: 700;
    font-size: 14px;
  }

  .check_box {
    margin-top: 30px;
  }
  .check_box_squre {
    width:17px; height:17px; vertical-align:-4px;
  }

  .check_box div {
    padding-bottom: 5px;
  }
  .check_box label {
    cursor: pointer;
    margin-left: 0px;
    font-size: 15px;
    color: #313131;
  }
  .perform_today {
    margin-top: 20px;
    height: 60px;
    text-align: center;
    font-size: 15px;
    color: #000;
    border-radius: 10px;
    background: #f9d1d1;
    line-height: 180%;
    padding-top: 15px;
  }
  .pay_btn {
    text-align: center;
    padding-top: 25px;
    margin-bottom:30px;
  }
  #pay_confirm {
    padding: 12px;
    width: 250px;
    border: 1px solid #f91818;
    border-radius: 10px;
    color: #fff;
    background: #ff4b4b;
    font-size: 22px;
    cursor: pointer;
  }
  .section_flex {
    display: flex; justify-content: space-between; background-color: #fff;
  }
  .payment_box input[type="radio"]{
    display:none;
  }
  .payment_box {
    text-align: center; width: 25%; cursor: pointer;
  }
  .payment_box div {
    padding:10px 0 15px 0;
  }
  .payment_box img {
    width: 60px; text-align: center;
  }
  .payment_box p {
    text-align: center; font-size: 15px;
  }
   .payment_box input[type="radio"]:checked + div {
    outline: 1px solid #ff4b4b;
    background-color: rgba(255, 75, 75, 0.1);
}
	.pay_a{
		padding: 10px;
	    border: none;
	    background: #ff4b4b;
	    color: #fff;
	    border-radius: 5px;
	    font-size: 18px;
	    font-weight: bold;
	    cursor: pointer;
	    text-decoration: none;
}
</style>
</head>
<body>
<form name="form_order" onsubmit="return validateForm()">
<div class="section_box">
  	<!-- 페이지 타이틀 -->
  	<div class="page_title">티켓 예매하기
    	<div style="border-color: #FF6251; width:auto;" ></div>
  	</div>
 	<c:forEach var="item" items="${myOrderList }">
  		<input type="hidden" id="goods_id" name="goods_id" value="${item.goods_id }">
  		<div class="basket_title">티켓정보</div>
 			<div class="basket_box" style="border-color: #FF6251;">
   			<div>
     				<div class="basket_subtitle">티켓명</div>
     				<span>${item.goods_name }</span>
     				<input type="hidden" id="goods_name" name="goods_name" value="${item.goods_name }">
   			</div>
   			<div style="padding-top:3px;">
     				<div class="basket_subtitle">이용장소</div>
     				<span>${item.goods_place }</span>
     				<input type="hidden" id="goods_place" name="goods_place" value="${item.goods_place }">
   			</div>
 			</div>

		<div class="basket_title">예매정보</div>
		<div style="margin-top:10px; border:1px solid #d2d2d2; border-radius: 10px; background:#fff; padding:10px 25px; font-size:15px; color:#313131; line-height:160%; border-color: #FF6251;">
        	<div class="option_title">선택옵션</div>
        		<div style="width:100%;">${item.orderDate } / ${item.goods_Time }</div>
        		<input type="hidden" id="orderDate" name="orderDate" value="${item.orderDate }">
        		<input type="hidden" id="goods_Time" name="goods_Time" value="${item.goods_Time }">
        	<div class="option_title">티켓가격</div>
        		<div style="width:100%;">${item.goods_price } 원</div>
        		<input type="hidden" id="goods_price" name="goods_price" value="${item.goods_price }">
        	<div class="option_title"">수량</div>
        		<div style="width:100%; vertical-align:bottom;">${item.totalQuantity } 매</div>
        		<input type="hidden" id="totalQuantity" name="totalQuantity" value="${item.totalQuantity }">
        	<div style="clear:both;"></div>
        	<div class="option_title">티켓합계</div>
        		<div style="width:100%; vertical-align:bottom;">
          			<span id="">${item.totalPrice }</span> 원
          			<input type="hidden" id="totalPrice" name="totalPrice" value="${item.totalPrice }">
        		</div>
      	</div>
		<input type="hidden" name="s_no" id="s_no" value="${item.s_no}">
	</c:forEach>
	
	<div class="basket_title">이용자정보</div>
	<div class="basket_text">
   		<p>· 실제로 관람/이용하실 분의 실명/연락처를 입력해 주세요.</p>
		<p>· 오기재시 정상 이용 및 긴급연락이 불가할 수 있으며 이에 따른 책임을 지지 않습니다.</p>
 		</div>
 		<div class="basket_box" style="border-color: #FF6251;">
   	<div>
     		<div class="basket_subtitle">주문자 이름</div>
     		<input class="basket_input" type="text" id="orderName" name="orderName" value="${orderer.mem_name }">
   	</div>
   	<div>
     		<div class="basket_subtitle">이용자 이름</div>
     		<input class="basket_input" type="text" id="receiver_name" name="receiver_name" value="">
   	</div>
   	<div>
     		<div class="basket_subtitle">휴대폰번호</div>
     		<input class="basket_input" type="text" name="orderPhone" maxlength="13" value="" id="orderPhone">
   	</div>
   	<div>
     		<div class="basket_subtitle">이메일주소</div>
     		<input class="basket_input" type="text" name="orderEmail" value="" id="orderEmail">
     	</div>
   	<div>
   		<span id="emailError" style="color: red;"></span>
   	</div>
 		</div>
	<div id="payment_section">
    <div class="basket_title">
		<span>결제방법</span>
    </div>
    <div class="basket_box" alt="결제수단" style="padding-top:8px; border-color: #FF6251;" >
    	<div class="section_flex" style="border-bottom:1px solid #eee; padding-bottom: 8px;">
        	<label class="payment_box">
          		<input type="radio" id="orderPay" name="orderPay" value="네이버페이" onclick="PAYMENT_SELECT_FUNC('네이버페이');">
          		<div>
            	<img id="pay_naver_img" class="payment_img" src="${contextPath}/resources/images/pay_naverpay_off.png" style="width:60px; height:45px;">
            	<p>네이버페이</p>
          		</div>
        	</label>
        	<label class="payment_box">
          		<input type="radio" id="orderPay" name="orderPay " value="카카오페이" onclick="PAYMENT_SELECT_FUNC('카카오페이');">
          		<div>
            	<img id="pay_kakao_img" src="${contextPath}/resources/images/pay_kakaopay_off.png"style="width:60px; height:45px;">
            	<p>카카오페이</p>
          	</div>
        	</label>
	        <label class="payment_box">
    		    <input type="radio" id="orderPay" name="orderPay" value="토스페이" onclick="PAYMENT_SELECT_FUNC('토스페이');">
          		<div>
            	<img id="pay_toss_img" class="payment_img" src="${contextPath}/resources/images/pay_tosspay_off.png"style="width:60px; height:45px;">
            	<p>토스페이</p>
          		</div>
        	</label>
	        <label class="payment_box">
    	    	<input type="radio" id="orderPay" name="orderPay" value="페이코" onclick="PAYMENT_SELECT_FUNC('페이코페이');">
          		<div>
            	<img id="pay_payco_img" class="payment_img" src="${contextPath}/resources/images/pay_payco_off.png"style="width:60px; height:45px;">
            	<p>페이코</p>
          		</div>
          	</label>
		</div>
		<div class="section_flex" style="margin-top:8px;">
	       	<label class="payment_box">
	       		<input type="radio" id="orderPay" name="orderPay" value="신용카드" onclick="PAYMENT_SELECT_FUNC('신용카드');">
	         		<div>
	           	<img id="pay_card_img" class="payment_img" src="${contextPath}/resources/images/pay_card_off.png"style="width:60px; height:45px;">
	           	<p>카드결제</p>
	         		</div>
	       	</label>
	        <label class="payment_box">
	   	    	<input type="radio" id="orderPay" name="orderPay" value="핸드폰" onclick="PAYMENT_SELECT_FUNC('핸드폰결제');">
	         		<div>
	           	<img id="pay_phone_img" class="payment_img" src="${contextPath}/resources/images/pay_phone_off.png"style="width:60px; height:45px;">
	           	<p>휴대폰결제</p>
	       		</div>
	       	</label>
	        <label class="payment_box">
	   	    	<input type="radio" id="orderPay" name="orderPay" value="무통장입금" onclick="PAYMENT_SELECT_FUNC('무통장입금');">
	         		<div>
	           	<img id="pay_bank_img" class="payment_img" src="${contextPath}/resources/images/pay_bank_off.png"style="width:60px; height:45px;">
	           	<p>무통장입금</p>
	         		</div>
			</label>
		</div>
	
		<div id="payment_bank_noti" class="payment_noti" style="display:none;">
	       	<p>※ 무통장입금 유의사항</p>
	       	1) 신청시 가상계좌가 발급되며 1원 단위 정확한 금액만 입금 가능<br>
	       	2) 일부 ATM(국민,하나,부산 등) 이체 불가(인터넷/모바일 뱅킹 권장)<br>
	       	3) 신청 후 3시간이 지나면 자동 취소되며 별도의 취소요청 불필요
		</div>
	</div>
	</div>

  	<div class="basket_title">
    ※ 티켓 환불규정
    <span class="policy_slide" style="margin-left:34px;" onclick="toggleSlide(POLICY_CONTENTS[0])">보기</span>
    <div class="policy_contents">
    	<div class="refund_txt">
        	<p class="viewpage_noti">[환불규정]</p>
			<p class="txt_blue">
  				<span class="txt_red">※ 구매시점과 무관하게 관람 당일은 환불/변경 불가</span><br>
  									※ 관람 당일 지각/연령미숙지/지역착오로 인한 환불/변경 불가
			</p>
			<p style="padding-top:10px;">	
				1) 구매 당일 요청 시 전액 환불<span class="txt_red"> (단, 당일 관람티켓은 환불 불가)</span><br>
			  	2) 관람일 7일 전 ~ : 티켓 금액 전액 환불<br>
			  	3) 관람일 6일 전 ~ 4일 전까지 : 10% 공제 후 환불<br>
			  	4) 관람일 3일 전 ~ 2일 전까지 : 20% 공제 후 환불<br>
			  	5) 관람일 1일 전 : 30% 공제 후 환불<br>
			  	6) <span class="txt_red">관람일 당일(자정) 및 이후 : 환불/취소/변경 불가</span><br>
  					<span style="color:#777;">※ 환불 기준 날짜는 밤12시(자정) 기준으로 산정됩니다.</span>
			</p>
			<p class="viewpage_noti">[주의사항]</p>
			<p>
			  <span class="txt_red">- 부분환불, 날짜/시간 변경은 지원하지 않습니다.</span><br>
			  - 부분환불, 변경을 원하시는 경우 전체 환불 후 재구매하셔야 합니다.<br>
			
			  - 관람 당일 티켓은 환불/취소/변경 불가하니 유의해주세요.<br>
			  - 지각/연령미숙지/지역착오로 관람하지 못하더라도 환불 불가합니다.
			</p>
			<p class="viewpage_noti">[환불방법]</p>
			<p style="padding-top:10px; color:#777;">
			  <span class="txt_blue">[마이티켓 &gt; 예매내역]에서 [환불신청] 버튼 클릭 후 진행</span><br>
			  · 환불은 즉시 처리되며 이후 티켓은 이용할 수 없습니다.<br>
			  · 일부 결제수단은 관리자 확인 후 환불이 진행됩니다.<br>
			  · 휴대폰결제는 결제월 이후 환불시 수수료가 청구될 수 있습니다.<br>
			  · 체크카드/무통장입금은 입금까지 업무일(평일) 기준 3~5일 가량 소요됩니다.
			</p>
		</div>
    </div>
	</div>

	<div class="basket_title" style="padding-top:10px;">
	  	※ 주의사항 및 약관
	  	<span class="policy_slide" onclick="toggleSlide(POLICY_CONTENTS[1])">보기</span>
	<div class="policy_contents">
		<div class="refund_txt">
			<p class="viewpage_noti">[예매시 주의사항]</p>
			<p>· 공연티켓은 <span style="color:red;">관람 당일에는 환불/변경이 불가</span>합니다.<br>
				· 지각/지역착오/연령미숙지로 티켓을 사용하지 못한 경우라도 환불/변경이 불가합니다.<br></p>
			<p>· 각 티켓마다 이용방법 및 환불규정에 차이가 있으니, 반드시 <span style="color:blue;">상세페이지의 안내사항 및 환불규정을 정확히 확인</span>하신 뒤 예매를 진행하시기 바랍니다.<br>
				· 부분환불, 날짜/시간 변경은 지원하지 않으며, 전체 내역을 환불한 뒤 재예매하셔야 합니다.</p>
			<p class="viewpage_noti">[개인정보 제 3자 제공 동의]</p>
			<p>· 타임티켓은 고객님의 티켓 예매내역 확인 및 관람, 사용 처리를 위해 최소한의 범위 내에서 제휴 업체에게 아래와 같이 구매정보를 제공하고 있습니다. 고객님께서 제 3자 제공에 동의하지 않으실 경우 티켓 및 상품 구매가 제한됩니다.</p>
				· 제공 업체 : 주식회사 엠컬쳐컴퍼니, 결제대행사(주식회사 네이버, 주식회사 카카오, (주)토스페이먼츠)<br>
				· 제공 목적 : 티켓 본인 사용체크 및 본인확인, 예약 서비스 제공 시 본인확인, 결제서비스 대행<br>
				· 제공 항목 : 구매자 이름, 구매자 전화번호, 구매자 이메일, 관람자 이름, 관람자 전화번호
  		</div>
	</div>
	</div>
	
	<div class="check_box">
    <div>
    	<input type="checkbox" name="orderCheck1" id="check_1" class="check_box_squre">
      	<label for="check_1">&nbsp;상단의 환불규정 / 주의사항 / 약관을 확인하였으며 이에 동의합니다.</label>
    </div>
    <div style="">
      	<input type="checkbox" name="orderCheck2" id="check_2" class="check_box_squre">
      	<label for="check_2">
        <span style="color:blue;">&nbsp;공연티켓은 관람당일 환불/변경이 절대 불가</span>한 점에 동의합니다.(지각, 지역착오, 연령미준수로 인한 환불불가)
      </label>
    </div>

    <div class="pay_btn">
	    <button class="pay_a" type="button" onclick="validateFormAndProceed()();">결제하기</button>
    </div>
  	</div>
</div>
</form>

<script type="text/javascript">
	//자바스크립트 함수 예시
	function toggleSlide(contentElement) {
	    if (contentElement.style.display === 'none') {
	        contentElement.style.display = 'block';
	    } else {
	        contentElement.style.display = 'none';
	    }
	}
	
	// '보기' 버튼 클릭 시 이벤트 핸들러
	document.addEventListener('DOMContentLoaded', function() {
	    const policySlides = document.querySelectorAll('.policy_slide');
	    
	    policySlides.forEach(function(policySlide, index) {
	        policySlide.addEventListener('click', function() {
	            const policyContents = document.querySelectorAll('.policy_contents');
	            const contentElement = policyContents[index];
	            toggleSlide(contentElement);
	        });
	    });
	});
	
	//이메일
	document.addEventListener('DOMContentLoaded', function() {
	    var emailInput = document.getElementById('orderEmail');
	    var emailError = document.getElementById('emailError');
	
	    emailInput.addEventListener('input', function() {
	        var emailValue = emailInput.value;
	        if (isEmailValid(emailValue)) {
	            emailError.textContent = "";
	        } else {
	        	emailError.style.fontSize = "12px";
	            emailError.textContent = "올바른 이메일 형식이 아닙니다.";
	        }
	    });
	
	    function isEmailValid(email) {
	        var pattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	        return pattern.test(email);
	    }
	});
	
	//핸드폰번호유형
	document.addEventListener('DOMContentLoaded', function() {
	    var phoneInput = document.getElementById('orderPhone');
	    
	    phoneInput.addEventListener('input', function() {
	        var phoneNumber = phoneInput.value;
	        var cleanedPhoneNumber = phoneNumber.replace(/\D/g, ''); // 숫자 이외의 문자 제거
	        var formattedPhoneNumber = formatPhoneNumber(cleanedPhoneNumber);
	        phoneInput.value = formattedPhoneNumber;
	    });
	
	    function formatPhoneNumber(phoneNumber) {
	        if (phoneNumber.length > 10) {
	            return phoneNumber.slice(0, 3) + '-' + phoneNumber.slice(3, 7) + '-' + phoneNumber.slice(7, 11);
	        } else if (phoneNumber.length > 6) {
	            return phoneNumber.slice(0, 3) + '-' + phoneNumber.slice(3, 7) + '-' + phoneNumber.slice(7);
	        } else if (phoneNumber.length > 3) {
	            return phoneNumber.slice(0, 3) + '-' + phoneNumber.slice(3);
	        } else {
	            return phoneNumber;
	        }
	    }
	});
	
    //결제 선택
    var orderPay='';
   
	function PAYMENT_SELECT_FUNC(selectedValue) {
		var orderPays = selectedValue;
	    orderPay = orderPays;
	    console.log(orderPays); // 선택한 값이 콘솔에 출력됨
	}
	
	function validateFormAndProceed() {
	    if (validateForm()) {
	        fn_process_pay_order(); // fn_process_pay_order() 함수 호출
	    }
	}

	//정보 미입력 시 오류
	debugger;	
	function validateForm() {
    var memId = document.getElementById("receiver_name").value;

    var email = document.getElementById("orderEmail").value;
    var phone = document.getElementById("orderPhone").value;

	var check_1 = document.getElementById("check_1").checked;
    var check_2 = document.getElementById("check_2").checked;
    


    if (memId === "" || email === "" || phone === "") {
        alert("모든 항목을 입력해주세요.");
        return false; // 폼 제출 방지
    }
    if (orderPay === "") {
        alert("결제 항목을 선택해주세요.");
        return false; // 폼 제출 방지
    }
    if (!check_1 || !check_2) {
        alert("모든 환불규정에 동의해주세요.");
        return false; // 폼 제출 방지
    }
     return true; // 폼 제출 허용
	}
    

    function fn_process_pay_order(){
 		
 		debugger;
 		
 		var formObj=document.createElement("form");
 		
		var goods_id = document.getElementById("goods_id").value;
	 	var goods_name = document.getElementById("goods_name").value;
	 	var goods_place = document.getElementById("goods_place").value;
	 	var orderDate = document.getElementById("orderDate").value;
	 	var goods_Time = document.getElementById("goods_Time").value;
	 	var goods_price = document.getElementById("goods_price").value;
	 	var totalQuantity = document.getElementById("totalQuantity").value;
	 	var totalPrice = document.getElementById("totalPrice").value;
	 	var orderCheck1 = document.getElementById("check_1").checked;
		var orderCheck2 = document.getElementById("check_2").checked;
	 	var orderName = document.getElementById("orderName").value;
		var receiver_name = document.getElementById("receiver_name").value;
	 	var orderEmail = document.getElementById("orderEmail").value;
	 	var orderPhone = document.getElementById("orderPhone").value;
	 	var s_no = document.getElementById("s_no").value;
	 		
	 	
 	    var i_goods_id=document.createElement("input");
 	    var i_goods_name=document.createElement("input");
 	    var i_goods_place=document.createElement("input");
 	    var i_orderDate=document.createElement("input");
 	    var i_goods_Time=document.createElement("input");
 	    var i_goods_price=document.createElement("input");
 	    var i_totalQuantity=document.createElement("input");
 	    var i_totalPrice=document.createElement("input");
 	    var i_orderName=document.createElement("input");
 	    var i_orderPhone=document.createElement("input");
 	    var i_orderEmail=document.createElement("input");
 	    var i_orderPay=document.createElement("input");
 	    var i_orderCheck1=document.createElement("input");
 	    var i_orderCheck2=document.createElement("input");
 	    var i_receiver_name=document.createElement("input");
 	    var i_s_no=document.createElement("input");


		i_goods_id.name="goods_id";
		i_goods_name.name="goods_name";
		i_goods_place.name="goods_place";
		i_orderDate.name="orderDate";
		i_goods_Time.name="goods_Time";
		i_goods_price.name="goods_price";
		i_totalQuantity.name="totalQuantity";
		i_totalPrice.name="totalPrice";
		i_receiver_name.name="receiver_name";
		i_orderPhone.name="orderPhone";
		i_orderEmail.name="orderEmail";
		i_orderPay.name="orderPay";
		i_orderCheck1.name="orderCheck1";
		i_orderCheck2.name="orderCheck2";
		i_s_no.name="s_no";

		 	   
		i_goods_id.value=goods_id;
		i_goods_name.value=goods_name;
		i_goods_place.value=goods_place;
		i_orderDate.value=orderDate;
		i_goods_Time.value=goods_Time;
		i_goods_price.value=goods_price;
		i_totalQuantity.value=totalQuantity;
		i_totalPrice.value=totalPrice;
		i_receiver_name.value=receiver_name;
		i_orderPhone.value=orderPhone;
		i_orderEmail.value=orderEmail;
		i_orderPay.value=orderPay;
		i_orderCheck1.value=orderCheck1;
		i_orderCheck2.value=orderCheck2;
		i_s_no.value=s_no;

 	    
 	    formObj.appendChild(i_goods_id);
 	    formObj.appendChild(i_goods_name);
 	    formObj.appendChild(i_goods_place);
 	    formObj.appendChild(i_orderDate);
 	    formObj.appendChild(i_goods_Time);
 	    formObj.appendChild(i_goods_price);
 	    formObj.appendChild(i_totalQuantity);
 	    formObj.appendChild(i_totalPrice);
 	    formObj.appendChild(i_receiver_name);
 	    formObj.appendChild(i_orderPhone);
 	    formObj.appendChild(i_orderEmail);
 	    formObj.appendChild(i_orderPay);
 	    formObj.appendChild(i_orderCheck1);
 	    formObj.appendChild(i_orderCheck2);
 	    formObj.appendChild(i_s_no);


 	    document.body.appendChild(formObj); 
 	    formObj.method="post";
 	    formObj.action="${contextPath}/order/reservationSuccess.do";
 	    formObj.submit();
 	}
</script>
</body>
</html>