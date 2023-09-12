<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
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
  <title>로그인창</title>
	<style>
	body, table {
	    word-break: break-all;
	    font-size: 13px;
	    font-weight: 400;
	}

	.input_box {
	    width: 350px;
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
    	background-image:url("${contextPath}/resources/images/member/user_id.png");
	}
	
	.icon_pass{
		background-image:url("${contextPath}/resources/images/member/user_pass.png")
	}	
	
	.login_btn {
	    width: 425px;
	    height: 60px;
	    border: 1px solid #ff4b4b;
	    border-radius: 20px;
	    background: #ff4b4b;
	    color: #fff;
	    font-size: 18px;
	    font-weight: 600;
	    cursor: pointer;
	}
	
	.login_submenu {
	    margin-top: 25px;
	    font-size: 18px;
	    margin-bottom: 25px;
	}
	
	.find{
		text-decoration: none;
	    color: black;
	}
	
	.social_wrap{
		margin-bottom: 50px;
	}
	
	.kakao{
		width: 425px;
		cursor: pointer;
	}
	</style>
</head>
<body style="max-height:650px;">
  <div>
    <div style="margin-top:50px;">
      <img src="${contextPath}/resources/images/logo.png" style="width:150px;">
    </div>
    <form name="frmLogin" method="post" action="${contextPath}/member/login.do" >
      <input type="hidden" name="r" value="/">
      <div style="margin-top: 30px;">
        <input type="text" name="mem_id" placeholder="아이디" class="input_box icon_id">
      </div>
      <div style="margin-top: 30px;">
        <input type="password" name="pwd" placeholder="비밀번호" class="input_box icon_pass">
      </div>
      <div style="margin-top: 30px;">
        <input type="submit" class="login_btn" value="로그인">
      </div>
<!-- 로그인 실패 메시지 -->
<c:if test="${param.result == 'loginFailed'}">
    <div style="color: red; margin-top: 10px;">
        아이디나 비밀번호가 잘못되었습니다. 다시 시도해주세요.
    </div>
</c:if>
      <div class="login_submenu">
        <a href="${contextPath}/member/findId.do" class="find">아이디 찾기</a>
        <span>|</span>
        <a href="${contextPath}/member/findId.do" class="find">비밀번호 찾기</a>
        <span>|</span>
        <a href="${contextPath}/member/join.do" class="find">회원가입</a>
      </div>
    </form>
    <div class="social_wrap">
      <div>
        <a id="kakao-login-btn"  href="javascript:void(0)" onclick="kakaoLogin();">
          <img src="${contextPath}/resources/images/member/kakao.png" alt="카카오로그인">
        </a>
        <p id="token-result"></p>
      </div>

    </div>
  </div>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
Kakao.init('714b1cee4e7cce6b2f35d6356e10b558'); 
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',

          success: function (response) {
        	 // debugger;
            KakaoLoginPro(response),
	       	  console.log(response)
          },

          fail: function (error) {
            console.log(error)
          },

        })
      },

      fail: function (error) {
        console.log(error)
      },
    })
  }

function KakaoLoginPro(response){
	var data = {id:response.id, email:response.kakao_account.email, nickname:response.kakao_account.profile.nickname }

	$.ajax({
		type : 'POST',
		url : '/member/kakaoLoginPro.do',
		data : data,
		dataType : 'json',
		success : function(data){
			console.log(data)

			if(data.JavaData == "YES"){
				alert("로그인되었습니다.");
				location.href = '/main.do'
			}
			else if(data.JavaData == "register"){
				$("#kakaoEmail").val(response.kakao_account.email);
				$("#kakaoId").val(response.id);
				$("#kakaoNickname").val(response.kakao_account.profile.nickname);
				$("#kakaoForm").submit();
			}
			else{
				alert("로그인에 실패했습니다");
				return;
			}
		},
		error: function(xhr, status, error){
			alert("로그인에 실패했습니다 ERROR CODE : "+ error);
			return;
		}
	});
}
</script>
</body>
</html>
