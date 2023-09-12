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
	<title>헤더</title>
	<!-- 스크립트구문 추가 0822-->
<script type="text/javascript">
	var loopSearch=true;
	function keywordSearch(){
		if(loopSearch==false)
			return;
	 var value=document.frm.searchWord.value;
		$.ajax({
			type : "get",
			async : true, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/goods/keywordSearch.do",
			data : {keyword:value},
			success : function(data, textStatus) {
			    var jsonInfo = JSON.parse(data);
				displayResult(jsonInfo);
			},
			
		}); //end ajax	
	}
	
	function displayResult(jsonInfo){
		var count = jsonInfo.keyword.length;
		if(count > 0) {
		    var html = '';
		    for(var i in jsonInfo.keyword){
			   html += "<a href=\"javascript:select('"+jsonInfo.keyword[i]+"')\">"+jsonInfo.keyword[i]+"</a><br/>";
		    }
		    var listView = document.getElementById("suggestList");
		    listView.innerHTML = html;
		    show('suggest');
		}else{
		    hide('suggest');
		} 
	}
	
	function select(selectedKeyword) {
		 document.frm.searchWord.value=selectedKeyword;
		 loopSearch = false;
		 hide('suggest');
	}
		
	function show(elementId) {
		 var element = document.getElementById(elementId);
		 if(element) {
		  element.style.display = 'block';
		 		 }
		}
	
	function hide(elementId){
	   var element = document.getElementById(elementId);
	   if(element){
		  element.style.display = 'none';
	   }
	}
</script>
<style>
.search_box{
	width:300px;
	margin-top: 15px;
}
#suggest{
	position:absolute;
	border: 1px solid lightgray;
	border-radius: 10px 10px;
	background-color: white;
	width:300px;
	top:59px;
	left: 380px;
	text-align: left;
	
}

</style>
	<style type="text/css">
	#top_header{
		margin: 0;
	   	margin-top: 10px;
	   	list-style: none;
	   	padding: 0;
	}
	
	.heder_1{
		position: relative;
	  	width: 1100px;
	   	margin: auto;
	}
	
	.header_bottom {
		list-style: none;
	   	vertical-align: top;
		padding-left: 30px;
	}
	
	
	ul, li, dl, dt, dd {
	   	list-style: none;
	   	margin: 0;
	   	padding: 0;
	   	float: left;
	}
	
	.header_bottom ul{
		list-style: none;
	   	vertical-align: top;
	   	padding-left: 10px;
	}
	
	input:focus {
		outline: none;
	}
	
	.search_top {
		font-size:15px;
		height:80px; 
		line-height:38px; 
		padding:0 20px; 
		vertical-align:top; 
		border:1px solid #e0e0e0; 
		width:350px; 
		border-radius:20px; 
		color:#999; 
		background: #f9f9f9;
		float: left;
	}
	
	.header_bottom > li {
		font-weight: 800;
	   	position: relative;
	  	color: #333;
	   	height: 50px;
	   	line-height: 50px;
	   	border: 0px solid #fff;
	   	padding-right:7px;
	}
	
	.button {
       color: black;
       text-align: center;
       text-decoration: none;
       font-size: 20px;
       display: inline-block;
       cursor: pointer;
	}
	
	.red-text-underline {
		color: red;
		text-decoration: underline red 2px;
	}
	   
	.top{
	   	font-size: 12px;
	   	text-decoration: none;
		margin-top: 4px;
		color: black;
		cursor: pointer;
	}
	
	.top1{
	   	font-size: 12px;
	   	text-decoration: none;
	}
	span#admin {
	    display: inline-block;
	    min-width: 67px;
	    height: 28px;
	    line-height: 28px;
	    text-align: center;
	    padding: 0 8px;
	    font-size: 12px;
	    font-weight: 700;
	    color: #ec7d2c;
	    border: 1px solid #ec7d2c;
	    border-radius: 15px;
	}
	span#user {
	    display: inline-block;
	    min-width: 67px;
	    height: 28px;
	    line-height: 28px;
	    text-align: center;
	    padding: 0 8px;
	    font-size: 12px;
	    font-weight: 700;
	    color: #3E90FF;
	    border: 1px solid #3E90FF;
	    border-radius: 15px;
	}
	span#business {
	    display: inline-block;
	    min-width: 67px;
	    height: 28px;
	    line-height: 28px;
	    text-align: center;
	    padding: 0 8px;
	    font-size: 12px;
	    font-weight: 700;
	    color: #00b300;
	    border: 1px solid #00b300;
	    border-radius: 15px;
	}
	
	
	</style>
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
</head>
<body>
<div style="width:100%;">
	<!-- header 상단 -->
	<c:choose>
	<c:when test="${isLogOn == true && type=='U' }">
	<div class="heder_1" style="height:30px;">
		<div style="position:absolute; right:0;">
		<ul id="top_header">
			<li class="top1"><span id="user">일반회원</span>&nbsp;</li>
			<li class="top">${member.mem_name} 님<br></li>
			<li>&nbsp;|&nbsp;</li>
			<li><a class="top" href="${contextPath }/member/myreservation.do?mem_id=${member.mem_id}">마이페이지<br></a></li>
			<li>&nbsp;|&nbsp;</li>
			<li><a class="top" href="${contextPath }/member/logout.do">로그아웃<br></a></li>
		</ul>
		</div>
	</div>
	</c:when>
	<c:when test="${isLogOn == true && type=='B'}">
	<div class="heder_1" style="height:30px;">
		<div style="position:absolute; right:0;">
		<ul id="top_header">
			<li class="top1"><span id="business">사업자</span>&nbsp;</li>
			<li class="top">${member.mem_name} 님<br></li>
			<li>&nbsp;|&nbsp;</li>
			<li><a class="top" href="${contextPath }/member/b_myreservation.do?mem_id=${member.mem_id}">마이페이지<br></a></li>
			<li>&nbsp;|&nbsp;</li>
			<li><a class="top" href="${contextPath }/member/logout.do">로그아웃<br></a></li>
		</ul>
		</div>
	</div>
	</c:when>
	<c:when test="${isLogOn == true && type=='admin'}">
	<div class="heder_1" style="height:30px;">
		<div style="position:absolute; right:0;">
		<ul id="top_header">
			<li class="top1"><span id="admin">관리자</span>&nbsp;</li>
			<li class="top">관리자님<br></li>
			<li>&nbsp;|&nbsp;</li>
			<li><a class="top" href="${contextPath }/member/logout.do">로그아웃<br></a></li>
		</ul>
		</div>
	</div>
	</c:when>
	<c:otherwise>
	<div class="heder_1" style="height:30px;">
    	<div style="position:absolute; right:0;">
		<ul id="top_header">
			<li><a href="${contextPath}/member/loginForm.do" class="top">로그인</a></li>
  			<li>&nbsp;|&nbsp;</li>
  			<li><a href="/member/join.do" class="top">회원가입</a></li>
		</ul>
		</div>
	</div>
	</c:otherwise>
	</c:choose>
	
	<!-- header 중단 -->
	<div class="heder_1" style="height:65px; padding-top:0px;">
		<a href="${contextPath}/main.do">
			<img src="${contextPath}/resources/images/logo.png" style="width:150px; margin-top:0px; float: left;">
	    </a>
	    <div style="position:absolute; top:15px; left:380px;">
		<form name="frm" method="get" action="${contextPath}/goods/searchGoods.do">
			<div style="vertical-align:right; position:relative; " >
    			<input type="text" name="searchWord" id="searchword"  class="search_box" placeholder="검색어를 입력해주세요." onKeyUp="keywordSearch()" >		
					<div style="position:absolute; top:7px; left:300px;">
      					<input name="image" type="image" src="${contextPath}/resources/images/search_btn.png" alt="검색하기" style="padding: 8px;">
    				</div>
  			</div>
		</form>
	    </div>
	    	<div id="suggest">		
			<div id="suggestList"></div></div>
	</div>
	
	<br>
	<br><br>
	<!-- header 하단 -->
	<c:choose>
	<c:when test="${isLogOn == true && type=='admin'}">
		<div class="heder_1" style="height:75px; padding-top:5px;">
		    <ul class="header_bottom">
				<li style="padding-right:80px;"><a href="${contextPath}/goods/a_listGoods.do" class="button" onclick="changeStyle(this)">상품관리</a></li>
				<li style="padding-right:80px;"><a href="${contextPath}/theater/listTheater.do" class="button" onclick="changeStyle(this)">공연장관리</a></li>
				<li style="padding-right:80px;"><a href="${contextPath}/schedule/listSchedule.do" class="button" onclick="changeStyle(this)">스케줄관리</a></li>
				<li style="padding-right:80px;"><a href="${contextPath}/member/a_Profile.do" class="button" onclick="changeStyle(this)">회원관리</a></li>
				<li style="padding-right:80px;"><a href="${contextPath}/event/A_listEvent.do" class="button" onclick="changeStyle(this)">이벤트</a></li>
				<li style="padding-right:80px;"><a href="${contextPath}/community/u_Commu.do" class="button" onclick="changeStyle(this)">커뮤니티</a></li>
				<li><a href="${contextPath}/center/notice.do" class="button" onclick="changeStyle(this)">고객센터</a></li>
		    </ul>
	</div>
	</c:when>
	<c:when test="${isLogOn == true && type=='B'}">
		<div class="heder_1" style="height:55px; padding-top:5px;">
		    <ul class="header_bottom">
				<li style="padding-right:85px;"><a href="${contextPath}/goods/a_listGoods.do" class="button" onclick="changeStyle(this)">상품관리</a></li>
				<li style="padding-right:85px;"><a href="${contextPath}/schedule/listSchedule.do" class="button" onclick="changeStyle(this)">스케쥴관리</a></li>
				<li style="padding-right:85px;"><a href="${contextPath}/theater/listTheater.do" class="button" onclick="changeStyle(this)">공연장</a></li>
				<li style="padding-right:85px;"><a href="${contextPath }/member/b_myreservation.do?mem_id=${member.mem_id}" class="button" onclick="changeStyle(this)">예매관리</a></li>
				<li style="padding-right:85px;"><a href="${contextPath}/event/B_listEvent.do" class="button" onclick="changeStyle(this)">이벤트</a></li>
				<li style="padding-right:85px;"><a href="${contextPath}/community/u_Commu.do" class="button" onclick="changeStyle(this)">커뮤니티</a></li>
				<li><a href="${contextPath}/center/notice.do" class="button" onclick="changeStyle(this)">고객센터</a></li>
		    </ul>
	</div>
	</c:when>
	<c:when test="${isLogOn == true && type=='U'}">
		<div class="heder_1" style="height:55px; padding-top:5px;">
			<ul class="header_bottom">
				<li style="padding-right:105px;"><a href="${contextPath}/goods/listGoods.do?goodsType=drama" class="button" onclick="changeStyle(this)">연극</a></li>
				<li style="padding-right:105px;"><a href="${contextPath}/goods/listGoods.do?goodsType=musical" class="button" onclick="changeStyle(this)">뮤지컬</a></li>
				<li style="padding-right:105px;"><a href="${contextPath}/goods/listGoods.do?goodsType=concert" class="button" onclick="changeStyle(this)">공연</a></li>
				<li style="padding-right:105px;"><a href="${contextPath}/theater/listTheater.do" class="button" onclick="changeStyle(this)">공연장</a></li>
				<li style="padding-right:105px;"><a href="${contextPath}/event/listEvent.do" class="button" onclick="changeStyle(this)">이벤트</a></li>
				<li style="padding-right:105px;"><a href="${contextPath}/community/u_Commu.do" class="button" onclick="changeStyle(this)">커뮤니티</a></li>
				<li><a href="${contextPath}/center/notice.do" class="button" onclick="changeStyle(this)">고객센터</a></li>
			</ul>
		</div>
	</c:when>
	<c:otherwise>
		<div class="heder_1" style="height:55px; padding-top:5px;">
			<ul class="header_bottom">
				<li style="padding-right:105px;"><a href="${contextPath}/goods/listGoods.do?goodsType=drama" class="button" onclick="changeStyle(this)">연극</a></li>
				<li style="padding-right:105px;"><a href="${contextPath}/goods/listGoods.do?goodsType=musical" class="button" onclick="changeStyle(this)">뮤지컬</a></li>
				<li style="padding-right:105px;"><a href="${contextPath}/goods/listGoods.do?goodsType=concert" class="button" onclick="changeStyle(this)">공연</a></li>
				
				<li style="padding-right:105px;"><a href="${contextPath}/theater/listTheater.do" class="button" onclick="changeStyle(this)">공연장</a></li>
				
				<li style="padding-right:105px;"><a href="${contextPath}/event/listEvent.do" class="button" onclick="changeStyle(this)">이벤트</a></li>
				<li style="padding-right:105px;"><a href="${contextPath}/community/u_Commu.do" class="button" onclick="changeStyle(this)">커뮤니티</a></li>
				<li><a href="${contextPath}/center/notice.do" class="button" onclick="changeStyle(this)">고객센터</a></li>
			</ul>
		</div>
	</c:otherwise>
	</c:choose>
</div>
</body>

</html>
