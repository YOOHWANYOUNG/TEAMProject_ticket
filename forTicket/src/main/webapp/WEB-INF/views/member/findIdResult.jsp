<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath" value = "${pageContext.request.contextPath}"/>

<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디찾기결과창</title>
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

  .tab_find_id {
    color: #000;
    font-weight: 700;
    border-bottom: 6px solid #000;
  }

  .wrap_title { text-align:center; padding-top: 40px; color: #000; font-size: 24px; font-weight: 100; line-height: 150%; }
  .title_bold { font-weight: 600; }

  .section_wrap { margin: 40px 0; text-align:center; background: #fff; }

  .section_hphone { margin-top: 30px; margin-left: 35px; width: 425px; padding: 20px 0; border:none; border-radius: 10px; font-size: 18px; line-height: 180%; }
  .section_hphone img { width: 22px; vertical-align: -5px; padding-right: 3px; }

  .icon_id { background-image : url('mobile_img/member/user_id.png'); }
  .icon_email { background-image : url('mobile_img/member/user_email.png'); }
  .icon_hphone { background-image : url('/mobile_img/member/user_hphone.png'); }

  .btn_submit {
    margin-top: 30px; width: 425px; height: 60px; border: none; border-radius: 10px; background: #ff4b4b; color:#fff; font-size:18px; font-weight:600; cursor:pointer;
  }

  .noti { margin-top: 30px; margin-left:35px; width: 388px; padding: 20px; border:none; border-radius:10px; background: #f5f5f5; color:#333; font-size: 14px; text-align: justify; line-height: 180%; }
  .noti a { color: #0057FF; text-decoration: underline; }


    </style>
</head>
<body>
<div style="width:500px; margin:0 auto; margin-bottom:40px; border:1px solid #ccc; border-radius: 20px;">

    <div class="wrap_tab">
        <div class="tab_find_id">아이디</div>
        <div class="tab_find_pass">비밀번호</a></div>
    </div>

    <div class="show_find_id" style="display: block;">
        <section class="wrap_title">
            가입한 회원 정보로<br><span class="title_bold">아이디</span>를 확인하세요.
        </section>

        <div class="section_wrap">
            <c:if test="${idFound}">
                <section class="section_hphone" style="background:#FFFCB0">
                    '${param.mem_name}' 님의 아이디는<br>
                    <span style="font-weight:700;">${foundId}입니다.</span><br>
                </section>
            </c:if>
            <c:if test="${!idFound}">
                <section class="section_hphone" style="background:#FFFCB0">
                    해당 정보로 가입한 아이디가 없습니다.
                </section>
            </c:if>

            <a href="${contextPath}/member/loginForm.do">
                <button class="btn_submit">로그인</button>
            </a>

            <section class="noti">
                · <span style="font-weight:600">간편 로그인으로 가입한 경우</span> 아이디/비밀번호 정보를 별도로 보관하지 않으며, 해당 간편 로그인 아이콘을 클릭해서 로그인 할 수 있습니다.
                <br>· 간편 로그인을 통해 가입한 적이 없거나 연동 계정을 찾을 수 없는 경우 <a href="https://docs.google.com/forms/d/e/1FAIpQLSfsvkJ_Xix9dCjpX2vv0BWKd_u9jq-DA48lGihulRomPlroxQ/viewform?usp=sf_link" target="_blank">불편사항 접수</a>를 이용해주세요.
            </section>
        </div>
    </div>
    
      <div class="show_find_pass" style="display: none;">
    <section class="wrap_title">
      가입한 이메일 주소로<br><span class="title_bold">임시 비밀번호</span>를 보내드려요.
    </section>

   <div class="section_wrap">
       <form action="${contextPath}/member/sendEmail.do" method="post">
          <input type="text" id="mem_id" name="mem_id" placeholder="아이디" class="input_box icon_id" required="">
          <input type="text" id="email" name="email" placeholder="이메일" class="input_box icon_email" style="margin-top:15px;" required="">
          <button id="checkEmailButton" class="btn_submit">임시 비밀번호 발급</button>
       </form>
    </div>
  </div>

</div>
</div>


</body>
<script>
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
</script>
</html>
