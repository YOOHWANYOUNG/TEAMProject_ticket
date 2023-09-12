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
<title>아이디찾기</title>
<style>
  .wrap_tab {
    display: flex;
  }

  .tab_find_id,
  .tab_find_pass {
    flex: 1;
    text-align: center;
    font-size: 22px;
    padding: 20px 0;
    color: #ccc;
    font-weight: 600;
    border-bottom: 3px solid #f1f1f1;
    cursor: pointer;
  }

  .tab_find_id.active,
  .tab_find_pass.active {
    color: #000;
    font-weight: 700;
    border-bottom: 6px solid #000;
  }

  .show_find_id,
  .show_find_pass {
    display: none;
  }

  .wrap_title { text-align:center; padding-top: 40px; color: #000; font-size: 24px; font-weight: 100; line-height: 150%; }
  .title_bold { font-weight: 600; }

  .section_wrap { margin: 40px 0; text-align:center; background: #fff; }

  .icon_id { background-image : url('mobile_img/member/user_id.png'); }
  .icon_email { background-image : url('mobile_img/member/user_email.png'); }
  .icon_hphone { background-image : url('/mobile_img/member/user_hphone.png'); }

  .input_box {
    width: 350px; height: 60px; padding: 0 10px 0 60px; font-size: 18px;
    border-radius: 10px; border: 1px solid #ddd; background-repeat : no-repeat; background-size : 27px;
    background-position: 20px 15px; /* 오른쪽, 아래 */
  }

  .btn_submit {
    width: 425px; height: 60px; margin-top:30px; border: 1px solid #ff4b4b; border-radius: 10px;
    background: #ff4b4b; color: #fff; font-size: 18px; font-weight: 600; cursor: pointer;
  }

  .noti { margin-top: 30px; margin-left:35px; width: 388px; padding: 20px; border:none; border-radius:10px; background: #f5f5f5; color:#333; font-size: 14px; text-align: justify; line-height: 180%; }
    .noti a { color: #0057FF; text-decoration: underline; }
    
.icon_name {
	background-image: url("${contextPath}/resources/images/member/user_name.png");
}
	
.icon_phone{
background-image: url("${contextPath}/resources/images/member/user_hphone.png");
}

.icon_id{
background-image: url("${contextPath}/resources/images/member/user_id.png");
}

.icon_email{
background-image: url("${contextPath}/resources/images/member/user_email.png");
}
</style>
</head>
<body>
<div style="width:500px; margin:0 auto; margin-bottom:40px; border:1px solid #ccc; border-radius: 20px;">

  <div class="wrap_tab">
    <div class="tab_find_id active">아이디</div>
    <div class="tab_find_pass">비밀번호</div>
  </div>

  <div class="show_find_id" style="display: block;">
    <section class="wrap_title">
    <img src="${contextPath}/resources/images/logo.png" style="width:150px;"><br>
      가입한 회원 정보로<br><span class="title_bold">아이디</span>를 확인하세요.
    </section>

    <div class="section_wrap">
      <form action="${contextPath}/member/findIdResult.do" name="sendEmail" method="post">
        <input type="text" name="mem_name" placeholder="이름" maxlength="13" class="input_box icon_name" required="">
        <input type="text" name="phone" id="phone" placeholder="휴대폰 번호" class="input_box icon_phone" style="margin-top:15px;" required="">
        <button class="btn_submit">아이디 찾기</button>
      </form>
    </div>
  </div>


<div class="show_find_pass" style="display: none;">
    <section class="wrap_title">
        가입한 이메일 주소로<br><span class="title_bold">임시 비밀번호</span>를 보내드려요.
    </section>

    <p id="passwordMessage"></p>
    <p id="idMessage"></p> 

    <div class="section_wrap">
        <form action="${contextPath}/member/sendEmail.do" method="post">
            <input type="text" id="mem_id" name="mem_id" placeholder="아이디" class="input_box icon_id" required="">
            <input type="text" id="email" name="email" placeholder="이메일" class="input_box icon_email" style="margin-top:15px;" required="">
            <button id="checkEmailButton" class="btn_submit">임시 비밀번호 발급</button>
        </form>
    </div>
</div>

</div>
</body>
<script>
//탭설정
    document.addEventListener("DOMContentLoaded", function() {
        const tabFindId = document.querySelector(".tab_find_id");
        const tabFindPass = document.querySelector(".tab_find_pass");
        const showFindId = document.querySelector(".show_find_id");
        const showFindPass = document.querySelector(".show_find_pass");

        tabFindId.addEventListener("click", function() {
            tabFindId.classList.add("active");
            tabFindPass.classList.remove("active");
            showFindId.style.display = "block";
            showFindPass.style.display = "none";
        });

        tabFindPass.addEventListener("click", function() {
            tabFindPass.classList.add("active");
            tabFindId.classList.remove("active");
            showFindPass.style.display = "block";
            showFindId.style.display = "none";
        });
    });
    //핸드폰유형
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
    const passwordMessage = document.getElementById('passwordMessage');
    const idMessage = document.getElementById('idMessage');

    $("#checkEmailButton").click(function () {
        const email = $("#email").val();
        const sendEmailForm = document.forms["/member/sendEmail.do"];

        $.ajax({
            type: 'post',
            url: 'emailDuplication',
            data: {
                'email': email
            },
            dataType: "text",
            success: function (result) {
                if (result === "no") {
                    // 중복되는 것이 있다면 no == 일치하는 이메일이 있다!
                    passwordMessage.innerText = "임시 비밀번호를 전송 했습니다. 로그인 후 패스워드를 변경 해주세요";
                    passwordMessage.style.display = "block";
                    idMessage.style.display = "none";
                    sendEmailForm.submit();
                } else {
                    idMessage.innerText = "가입되지 않은 이메일입니다.";
                    idMessage.style.display = "block";
                    passwordMessage.style.display = "none";
                }
            },
            error: function () {
                console.log('에러 체크!!');
            }
        });
    });
	
</script>
</html>