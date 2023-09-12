<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script>
		var previousButton = null;

        function changeStyle(link) {
            if (previousButton !== null) {
                // 이전 버튼의 스타일을 원래 스타일로 되돌리기
                previousButton.classList.remove('red-text-underline');
            }

            // 빨간색으로 글자색 및 밑줄 변경
            link.classList.add('red-text-underline');

            // 현재 버튼을 이전 버튼으로 설정
            previousButton = link;
        }
	</script>
	<style>
		.side1 {
			text-align: center;
		}

		.side2 {
			text-decoration: none;
			font-size: 20px;
			color: black;
			margin-top: 50px;
			font-weight: bold;
			cursor: pointer;
		}
		
		.side_div{
			font-size: 26px;
           	font-weight: 700;
           	color: black;
           	margin-top : 50px;
           	text-align: center;
		}
		
		.side_ul{
   			text-align: center;
   			float: none;
    	}
   		
   		.side_li{
   			float: none;
   			margin-top: 45px;
   		}
   		
   		.red-text-underline {
		color: #bcbcbc;
    }
	</style>
</head>
<body>
<div class="side1">
	<c:choose>
		<c:when test="${side_menu=='admin_mode' }">
			<div class="side_div">
				회원관리
			</div>
			<div style="width: auto; border: 1px solid; border-color: #FF6251; margin-top: 10px; margin-bottom:10px;"></div>
			<ul class="side_ul">
				<li class="side_li"><a href="${contextPath}/member/a_Profile.do" class="side2">회원</a></li>
				<li class="side_li"><a href="${contextPath}/member/a_ProfileBus.do" class="side2">사업자</a></li>
			</ul>
		</c:when>
		<c:when test="${side_menu=='bus_mode'}">
			<div class="side_div">
				마이페이지
			</div>
			<div style="width: auto; border: 1px solid; border-color: #FF6251; margin-top: 10px; margin-bottom:10px;"></div>
			<ul class="side_ul">
				<li class="side_li"><a href="${contextPath }/member/b_Edit.do?mem_id=${member.mem_id }" class="side2">사업자 정보 수정</a></li>
				<li class="side_li"><a href="${contextPath }/member/b_myreservation.do?mem_id=${member.mem_id}" class="side2">예매관리</a></li>
				<li class="side_li"><a href="${contextPath}/center/question.do?mem_id=${member.mem_id }" class="side2">1:1 문의</a></li>
			</ul>
		</c:when>		
		<c:when test="${side_menu=='center' }">
			<div class="side_div">
				고객센터
			</div>
			<div style="width: auto; border: 1px solid; border-color: #FF6251; margin-top: 10px; margin-bottom:10px;"></div>
			<ul class="side_ul">
				<li class="side_li"><a href="${contextPath}/center/refund.do" class="side2">환불안내</a></li>
				<li class="side_li"><a href="${contextPath}/center/notice.do" class="side2">공지사항</a></li>
				<li class="side_li"><a href="${contextPath}/center/faq.do" class="side2">FAQ</a></li>
				<c:if test="${member.mem_id != null && member.type !='admin'}">
					<li class="side_li"><a href="${contextPath}/center/question.do?mem_id=${member.mem_id }" class="side2">1:1 문의</a></li>
				</c:if>
				<c:if test="${member.type =='admin' }">
					<li class="side_li"><a href="${contextPath}/center/a_question.do" class="side2">1:1 문의</a></li>
				</c:if>
			</ul>
		</c:when>
		<c:when test="${side_menu=='mem_mode' }">
			<div class="side_div">
				마이페이지
			</div>
			<div style="width: auto; border: 1px solid; border-color: #FF6251; margin-top: 10px; margin-bottom:10px;"></div>
			<ul class="side_ul">		
				<li class="side_li"><a href="${contextPath }/member/m_Edit.do?mem_id=${member.mem_id }" class="side2" onclick="changeStyle(this)">회원 정보 수정</a></li>
				<li class="side_li"><a href="${contextPath }/member/basket.do?mem_id=${member.mem_id }" class="side2" onclick="changeStyle(this)">관심 공연</a></li>
				<li class="side_li"><a href="${contextPath }/member/myreservation.do?mem_id=${member.mem_id}" class="side2" onclick="changeStyle(this)">예매 내역</a></li>
				<li class="side_li"><a href="${contextPath}/center/question.do?mem_id=${member.mem_id }" class="side2" onclick="changeStyle(this)">1:1 문의</a></li>
			</ul>
		</c:when>
		<c:otherwise>
			<div class="side_div">
				마이페이지
			</div>
			<div style="width: auto; border: 1px solid; border-color: #FF6251; margin-top: 10px; margin-bottom:10px;"></div>
			<ul class="side_ul">		
				<li class="side_li"><a href="javascript:fn_login('${isLogOn }', '${contextPath }/admin/getUserInfo.do','${contextPath }/member/loginForm.do')" class="side2" onclick="changeStyle(this)">회원 정보 수정</a></li>
				<li class="side_li"><a href="javascript:fn_login1('${isLogOn }', '${contextPath }/admin/getUserGrade.do','${contextPath }/member/loginForm.do')" class="side2" onclick="changeStyle(this)">관심 공연</a></li>
				<li class="side_li"><a href="javascript:fn_login1('${isLogOn }', '${contextPath }/admin/getUserGrade.do','${contextPath }/member/loginForm.do')" class="side2" onclick="changeStyle(this)">예매 내역</a></li>
				<li class="side_li"><a href="${contextPath}/center/question.do" class="side2" onclick="changeStyle(this)">1:1 문의</a></li>
			</ul>
		</c:otherwise>
	</c:choose>
</div>
</body>

</html>