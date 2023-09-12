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
	<title>사업자 정보 수정</title>
	<style>
	.search{
		width: 80%;
		border: 1px solid #FF6251;
		border-collapse: collapse;
		border-style: hidden;
        box-shadow: 0 0 0 2px #FF6251;
        border-spacing: 0;
        border-radius: 15px;
        margin : 50px 80px;
	}
	
	tr,td{
		border-bottom: 2px solid #FF6251;
		 border: 1px solid #FF6251;
	}
	
	.inputSize{
		width:230px;
		border: 1px solid #696969;
        height: 20px;
        border-radius: 10px;
	}
	
	.inputSize1{
		width:330px;
		border: 1px solid #696969;
        height: 20px;
        border-radius: 10px;
	}
	
	.clear {
		clear: both;
		height: 50px;
	}
	
	.reply{
		text-decoration: none;
		color: #FF6251;
	}
	
	.mypage4{
		border:3px solid #d2d2d2;
		border-radius: 20px;
		padding:30px;
		font-size:15px;
		line-height:280%;
		border-color: #FF6251;
		padding-bottom: 50px;
	}
	
	.alink{
		text-decoration: none;
	}
	
	.optionsize{
		border: 1px solid #696969;
        height: 20px;
        border-radius: 10px;   
        text-align: center;     
	}
	</style>
</head>

<body>
<div class="mypage4">
<form method="GET"   action="${contextPath}/member/b_updateMember.do">
	<div style="margin-bottom:20px;">
    	<h2 style="text-align:left;">사업자 정보</h2>
        <div style="width: auto; border: 1px solid; border-color: #FF6251; margin-top: 10px; margin-bottom:10px;"></div>
        	<div style="border-color: #FF6251; width:auto;"></div>
    </div>
	<table class="search">
		<tr>
			<td  width="150px;">사업자명</td>
			<td><input type="text" class="inputSize1" name="b_name" value="${taget.b_name}"></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input type="text" class="inputSize1" name="mem_id" id="i_id" value="${taget.mem_id}" readonly></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="password" class="inputSize1" name="pwd" id="password" value="${taget.pwd}" >
				<br>
           	 	<span id="passwordFormatHint" style="color: gray; font-size: 12px;">(영문, 숫자, 특수문자를 포함한 8자 이상)</span>
            	<br>
            	<span id="passwordError" style="color: red; font-size: 12px;"></span> <!-- 비밀번호 형식 에러 메시지 표시 요소 -->
			</td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td>
				<input type="password" name="pwd2" id="passwordConfirm" placeholder="비밀번호확인" size="20" class="inputSize1"/>
				<span id="confirmMsg"></span>
			</td>
		</tr>
		<tr>
			<td>사업자 번호</td>
			<td><input type="text" class="inputSize1" name="b_number" value="${taget.b_number}" ></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" class="inputSize1" name="b_phone" value="${taget.b_phone}"></td>
		</tr>
		<tr>
			<td>핸드폰</td>
			<td><input type="text" class="inputSize1" id="phone" name="phone" value="${taget.phone}"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>
				<input type="text" class="inputSize1" id="email" name="email" value="${taget.email}">
				<span id="emailError" style="color: red;"></span><!-- 이메일 형식 에러 메시지 표시 요소 -->
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<input name="post" id="post" placeholder="우편번호" readonly="readonly" class="inputSize" value="${taget.post}">
        	    <input type="button" class="btn_hphone_on" onclick="execPostCode();" value="우편번호"><br>
        	    <input type="text" class="inputSize1" name="addr1" value="${taget.addr1}"><br>
			  	<input type="text" class="inputSize1" name="addr2" value="${taget.addr2}"><br>
        	</td>
		</tr>
	</table>
	<input type="submit" onclick="fn_sub(this.form)" value="수정하기">
</form>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
//비밀번호
document.addEventListener('DOMContentLoaded', function() {
    var passwordInput = document.getElementById('password');
    var passwordConfirmInput = document.getElementById('passwordConfirm');
    var confirmMsg = document.getElementById('confirmMsg');
    var passwordError = document.getElementById('passwordError');
    var passwordFormatHint = document.getElementById('passwordFormatHint');

    passwordInput.addEventListener('input', function() {
        var passwordValue = passwordInput.value;
        var passwordConfirm = passwordConfirmInput.value;

        var passwordIsValid = isPasswordValid(passwordValue);
        var color = passwordIsValid ? "#0099ff" : "#ff0000";
        passwordError.style.color = color;
        passwordError.innerHTML = passwordIsValid ? "" : "비밀번호 조건을 만족하지 않습니다.";

        if (passwordValue !== passwordConfirm) {
            confirmMsg.style.color = "#ff0000";
            confirmMsg.style.fontSize = "12px";
            confirmMsg.innerHTML = "비밀번호가 불일치합니다.";
        } else {
            confirmMsg.style.color = color;
            confirmMsg.style.fontSize = "12px";
            confirmMsg.innerHTML = passwordValue ? "비밀번호가 일치합니다." : "";
        }
    });
    
    passwordConfirmInput.addEventListener('input', function() {
        var passwordValue = passwordInput.value;
        var passwordConfirm = passwordConfirmInput.value;

        // 대소문자, 특수문자 판단
        var passwordIsValid = isPasswordValid(passwordValue);
        
        var color = passwordIsValid ? "#0099ff" : "#ff0000";
        passwordError.style.color = color;
        passwordError.innerHTML = passwordIsValid ? "" : "비밀번호 조건을 만족하지 않습니다.";

        if (passwordValue !== passwordConfirm) {
            confirmMsg.style.color = "#ff0000";
            confirmMsg.style.fontSize = "12px";
            confirmMsg.innerHTML = "비밀번호가 불일치합니다.";
        } else {
            confirmMsg.style.color = color;
            confirmMsg.style.fontSize = "12px";
            confirmMsg.innerHTML = passwordValue ? "비밀번호가 일치합니다." : "";
        }
    });

    function isPasswordValid(password) {
        var pattern = /^(?=.*\d)(?=.*[!@#$%^&*()_+])[0-9a-zA-Z!@#$%^&*()_+]{8,}$/;
        return pattern.test(password);
    }
});
//이메일
document.addEventListener('DOMContentLoaded', function() {
    var emailInput = document.getElementById('email');
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
//우편번호찾기

function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) { 
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("[name=post]").val(data.zonecode);
           $("[name=addr1]").val(fullRoadAddr);
       }
    }).open();
}

//핸드폰번호유형
document.addEventListener('DOMContentLoaded', function() {
  var phoneInput = document.getElementById('phone');
  
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
</script>
</body>
</html>