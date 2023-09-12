<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
   request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입창</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<style>
.join_wrap {
	width: 600px;
	margin: 50px auto;
	padding: 60px 0 50px 0;
	text-align: center;
	border: 3px solid #ffd1d1;
	border-radius: 30px;
	background-color: #fff;
}

.formtable{
	margin:auto;
}

.dot_line1 {
	margin-top: 10px;
	width: 260px;
	height: 55px;
	padding: 0 10px 0 60px;
	font-size: 18px;
	border-radius: 20px;
	border: 1px solid #ddd;
	background-repeat: no-repeat;
	background-size: 24px;
	background-position: 20px 15px;
}

.dot_line {
	margin-top: 10px;
	width: 345px;
	height: 55px;
	padding: 0 10px 0 60px;
	font-size: 18px;
	border-radius: 20px;
	border: 1px solid #ddd;
	background-repeat: no-repeat;
	background-size: 24px;
	background-position: 20px 15px;
}
	
.icon_id {
	background-image: url("${contextPath}/resources/images/member/user_id.png");
}
	
.icon_pass {
	background-image: url("${contextPath}/resources/images/member/user_pass.png");
}
	
.icon_pass2 {
	background-image: url("${contextPath}/resources/images/member/user_pass2.png");
	}
	
.icon_name {
	background-image: url("${contextPath}/resources/images/member/user_name.png");
}
	
.icon_email {
	background-image: url("${contextPath}/resources/images/member/user_email.png");
}
	
.icon_phone{
	background-image: url("${contextPath}/resources/images/member/user_hphone.png");
}
		
.post {
	margin-top: 10px;
    width: 235px;
    height: 55px;
    padding: 0 10px 0 60px;
    font-size: 18px;
    border-radius: 20px;
    border: 1px solid #ddd;
    background-repeat: no-repeat;
    background-size: 24px;
    background-position: 20px 15px;
	}
	
.post1{
	margin-top: 10px;
    width: 100px;
    height: 55px;
    border: 1px solid #ff4b4b;
    border-radius: 10px;
    background: #ff4b4b;
    color: #fff;
    font-size: 18px;
    font-weight: 600;
    cursor: pointer;
    text-decoration: none;
	}

.section_wrap {
	margin-top: 30px;
	margin:auto;
	}

:root {
	--swiper-navigation-size: 44px;
	}
	
:root {
	--swiper-theme-color: #007aff;
	}
	
.checkbox_group {
    width: 350px;
    padding: 5px 25px;
    margin:auto;
    border: none;
    border-radius: 10px;
    background: #f5f5f5;
    color: #333;
    text-align: left;
    line-height: 180%;
	}
	
.btn_submit {
	width: 250px;
	height: 55px;
	border: 1px solid #ff4b4b;
	border-radius: 20px;
	background: #ff4b4b;
	color: #fff;
	font-size: 18px;
	font-weight: 600;
	cursor: pointer;
	margin-top:20px;
        }
        
.btn_hphone_on {
    width: 80px;
    height: 50px;
    border: none;
    border-radius: 20px;
    background: #ff4b4b;
    color: #fff;
    font-size: 15px;
    font-weight: 600;
}

.checkform{
	font-size: 12px;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>
	<div class="join_wrap">
	<div>
    	<img src="${contextPath}/resources/images/logo.png" style="width:150px;">
    </div>
    <form action="${contextPath}/member/addMember.do" method="post" onsubmit="return validateForm()">
	<div>
	<input type="hidden" name="type" value="U"/>
		<table class="formtable">
			<tbody>
				<tr>
                   <td> 
                        <input type="text" name="_mem_id" id="_mem_id" placeholder="아이디" size="20" class="dot_line1 icon_id"/>
                        <input type="hidden" name="mem_id" id="mem_id"/>
                        <input type="button" value="중복검사" class="btn_hphone_on" id="btnOverlapped" onClick="fn_overlapped()"/>  
                   </td>
                </tr>
                <tr>
					<td>
                        <input type="password" name="pwd" id="password" placeholder="비밀번호" size="20" class="dot_line icon_pass"/>
                        <br>
                        <span id="passwordFormatHint" style="color: gray; font-size: 12px;">(영문, 숫자, 특수문자를 포함한 8자 이상)</span>
                        <br>
                        <span id="passwordError" style="color: red; font-size: 12px;"></span> <!-- 비밀번호 형식 에러 메시지 표시 요소 -->
                    </td>
				</tr>
				<tr>
					<td><input type="password" name="pwd2" id="passwordConfirm" placeholder="비밀번호확인" size="20" class="dot_line icon_pass2"/></td>
				</tr>
				<tr>
					<td><span id="confirmMsg"></span></td>
				</tr>
				<tr>
					<td><input name="mem_name" type="text" placeholder="이름" class="dot_line icon_name"/></td>
				</tr>
				<tr>
					<td><input name="email" id="email" type="text" placeholder="이메일"  class="dot_line icon_email"/></td>
     			</tr>
				<tr>
				    <td><span id="emailError" style="color: red;"></span></td> <!-- 이메일 형식 에러 메시지 표시 요소 -->
				</tr>
				<tr>
					<td><input name="phone" type="text" id="phone" placeholder="핸드폰번호"  class="dot_line icon_phone"></td> 
				</tr>
				<tr>
					<td>
						<input name="post" id="post" placeholder="우편번호" readonly="readonly" class="dot_line1">
                        <input type="button" class="btn_hphone_on" onclick="execPostCode();" value="우편번호">
                    </td>
                </tr>
                <tr>
                    <td><input placeholder="세부주소1" name="addr1" id="addr1" type="text"  class="dot_line" />
                </tr>
                <tr>
					<td><input placeholder="세부주소2" name="addr2" id="addr2" type="text" class="dot_line"  />
				</tr>
			</tbody>
		</table>
	</div>
</table>
	<section class="section_wrap">
            <div style="margin-top: 30px; margin-bottom: 10px; font-size: 12px;">이용약관 동의</div>
            <div class="checkbox_group" style="margin-top:0;">
                <div class="check_all">
                    <input type="checkbox" name="checkbox" id="checkAll" class="checkbox">
                    <label class="checkform" for="checkAll">전체 동의</label>
                </div>
                <div class="checkbox_line">
                    <input type="checkbox" id="check_1" class="checkbox">
                    <label class="checkform" for="check_1">만 14세 이상입니다<span class="check_req">(필수)</span></label>
                </div>
                <div class="detail_seperate" style="border:none;">
                    <div>
                        <input type="checkbox" id="check_2" class="checkbox">
                        <label class="checkform" for="check_2">이용약관 동의<span class="check_req">(필수)</span></label>
                    </div>
                    <div class="detail_seperate" style="border:none;">
                        <div>
                            <input type="checkbox" id="check_3" class="checkbox">
                            <label class="checkform" for="check_3">개인정보 수집·이용 동의<span class="check_req">(필수)</span></label>
                        </div>
                    </div>
                </div>
		<div>
			<div class="input_title" disabled="" id="recaptcha-container"><div class="grecaptcha-badge" data-style="bottomright" style="width: 256px; height: 60px; display: block; transition: right 0.3s ease 0s; position: fixed; bottom: 14px; right: -186px; box-shadow: gray 0px 0px 5px; border-radius: 2px; overflow: hidden;"><div class="grecaptcha-logo"><iframe title="reCAPTCHA" src="https://www.google.com/recaptcha/api2/anchor?ar=1&amp;k=6LcMZR0UAAAAALgPMcgHwga7gY5p8QMg1Hj-bmUv&amp;co=aHR0cHM6Ly90aW1ldGlja2V0LmNvLmtyOjQ0Mw..&amp;hl=ko&amp;v=3kTz7WGoZLQTivI-amNftGZO&amp;size=invisible&amp;cb=sqgb2miiatpc" width="256" height="60" role="presentation" name="a-9xajmtra3vir" frameborder="0" scrolling="no" sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox"></iframe></div><div class="grecaptcha-error"></div><textarea id="g-recaptcha-response" name="g-recaptcha-response" class="g-recaptcha-response" style="width: 250px; height: 40px; border: 1px solid rgb(193, 193, 193); margin: 10px 25px; padding: 0px; resize: none; display: none;"></textarea></div><iframe style="display: none;"></iframe></div>
		</div>
	</div>
			 <input type="submit" id="submitComplete" class="btn_submit" value="가입완료" alt="가입완료">
	</section>	
    </form>
	</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
//아이디
function fn_overlapped() {
    var _id = $("#_mem_id").val();
    
    if (_id === '') {
        alert("ID를 입력하세요");
        return;
    }
    
    var idPattern = /^[A-Za-z0-9]{4,20}$/;
    
    if (!idPattern.test(_id)) {
        alert("아이디는 4~20자의 영문, 숫자로 구성되어야 합니다..");
        return;
    }
    
    $.ajax({
        type: "post",
        async: false,
        url: "${contextPath}/member/overlapped.do",
        dataType: "text",
        data: { id: _id },
        success: function(data, textStatus) {
            if (data === 'false') {
                alert("사용할 수 있는 ID입니다.");
                $('#btnOverlapped').prop(true);
                $('#_mem_id').prop( true);
                $('#mem_id').val(_id);
            } else {
                alert("사용할 수 없는 ID입니다.");
            }
        },
        error: function(data, textStatus) {
            alert("에러가 발생했습니다.");
        },
        complete: function(data, textStatus) {
            //alert("작업을 완료 했습니다");
        }
    }); //end ajax
}
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
//체크박스
document.addEventListener('DOMContentLoaded', function() {
    var checkAll = document.getElementById('checkAll');
    var check_1 = document.getElementById('check_1');
    var check_2 = document.getElementById('check_2');
    var check_3 = document.getElementById('check_3');
    
    checkAll.addEventListener('click', function() {
        var isChecked = checkAll.checked;
        check_1.checked = isChecked;
        check_2.checked = isChecked;
        check_3.checked = isChecked;
    });
});

//정보 미입력 시 오류
function validateForm() {
    var memId = document.getElementById("_mem_id").value;
    var password = document.getElementById("password").value;
    var passwordConfirm = document.getElementById("passwordConfirm").value;
    var email = document.getElementById("email").value;
    var phone = document.getElementById("phone").value;
    var addr1 = document.getElementById("addr1").value;
    var addr2 = document.getElementById("addr2").value;
    
    var check_1 = document.getElementById("check_1").checked;
    var check_2 = document.getElementById("check_2").checked;
    var check_3 = document.getElementById("check_3").checked;
    
    if (memId === "" || password === "" || passwordConfirm === "" ||
        email === "" || phone === "" || addr1 === "" || addr2 === "") {
        alert("모든 항목을 입력해주세요.");
        return false; // 폼 제출 방지
    }
    
    if (!check_1 || !check_2 || !check_3) {
        alert("이용약관에 동의해주세요.");
        return false; // 폼 제출 방지
    }
    
    if (password !== passwordConfirm) {
        alert("비밀번호가 일치하지 않습니다.");
        return false; // 폼 제출 방지
    }
    
    return true; // 폼 제출 허용
}
//회원가입 폼 제출
var submitButton = document.getElementById('submitComplete');
var joinForm = document.getElementById('joinForm');

submitButton.addEventListener('click', function() {
    if (validateForm()) {
        var confirmation = confirm("회원 가입을 완료하시겠습니까?");
        if (confirmation) {
            alert("가입하신 정보로 로그인 해주세요");
            joinForm.submit();
        }
    }
});
</script>
</body>
</html>