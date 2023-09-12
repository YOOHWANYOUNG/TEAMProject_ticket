<<<<<<< HEAD
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
<title>관리자 커뮤티니</title>
<style>
	.wrap_1100 {
		margin: auto;
		width: 1100px;
		position: relative;
	}
	
	.comm_title{
		font-size: 25px;
		font-weight: 900;
		text-align: left;
		padding-top: 50px;
	}
	
	.comm_title_more {
		position: absolute;
		right: 750px;
		font-size: 15px;
		text-decoration: none;
	}
		
	.review_title {
    	display: flex;
    	justify-content: space-between;
    	padding: 10px 0 7px 0;
	}

	.review_title_left {
    	display: flex;
    	align-items: center;
	}

	.review_title_left_stars {
	    width: 95px;
	    height: 16px;
	}

	.review_title_left_star {
	    background-image: url(${contextPath}/resources/images/stars.png);
	    background-repeat: no-repeat;
	    background-size: 95px;
	    width: 100%;
	    height: 16px;
	}

	.review_title_left_star_filled {
	    position: absolute;
	    background-image: url(${contextPath}/resources/images/member/stars.png);
	    background-repeat: no-repeat;
	    background-size: 95px;
	    height: 16px;
	}
	
	.review_title_left_name {
   		align-items: flex-end;
	}

	.review_title_left_name, .review_title_right {
	    color: #777;
	    font-size: 14px;
	}
	
	.text-wrapper {
    	position: relative;
	}
	
	.text {
		/* 요소의 내용이 영역을 벗어날 경우 그 부분은 숨겨지게 처리 */ 
		overflow: hidden;
		/* 요소의 표시 방법을 -webkit-box로 표시 */
		display: -webkit-box;
		/* webkit-box로 표시된 자식 요소들의 배치 방법 결정 (여기서는 수직) */ 
		-webkit-box-orient: vertical;
		/* 요소 내 텍스트를 지정한 라인수까지만 표시 */
		-webkit-line-clamp: 3;
		/* 텍스트 양쪽정렬 */ 
		text-align :justify;
	   	width: 99%;
		position: relative;
		font-size: 15px;
		padding-top: 7px;
	}
	
	.more-text{
		/* 글씨 크기,색상 지정 */ 
		font-size: 15px;
		/* 마우스 포인트가 올라갔을 때 커서 모양을 포인터로 변경 */
		cursor: pointer;
		font-weight: bold;
		position: absolute;
        bottom: 2px;
		right: 1%;
		padding-left: 20px;
		color: #000;
	}
	
	.less-text {
		/* 글씨 크기,색상 지정 */
		font-size: 15px;
		/* 마우스 포인트가 올라갔을 때 커서 모양을 포인터로 변경 */ 
		cursor: pointer;
		/* 줄이기 버튼 (처음에는 안보이게) */
		display: none;
		font-weight: bold;
        position: absolute;
        bottom: 2px;
		right: 1%;
		padding-left: 20px;
		color: #000;
	}
</style>
</head>
<body>
<div class="wrap_1100">
	<div class="comm_title">
    	<div style="text-align:left;">커뮤니티 관리</div>
    	<div class="comm_title_more"><a href="${contextPath}/community/adminCommunity.do" align="left"> 리뷰조회</a> | 리뷰삭제</div>
        <div style="width: auto; border: 1px solid; border-color: #FF6251; margin-top: 30px; margin-bottom:10px;"></div>
    </div>
   	<div class="review_title">
		<div class="review_title_left">
    		<div class="review_title_left_stars">
        		<div class="review_title_left_star">
          			<div class="review_title_left_star_filled" style="width: calc(5 * 19px);"></div>
        		</div>
        	</div>
			<div class="review_title_left_name" style="padding-left: 10px;">
				장*림
			</div>
		</div>
		<div class="review_title_right" style="padding-right:8px;">
			2023-08-17
		</div>
	</div>
	<div class="text-wrapper">
		<span class="text">
			너무 좋았어요!! 신기한게 정말 공룡들이 찐 현실 같아서 너무 좋았어요!!<br>
			입구에 있던 티라노사우르스를 보고 애기가 놀랜거 빼면 ㅎㅎㅎ 정말 좋았어요!!<br>
			다양한 체험도 할 수 있어서 좋긴 한데 혼자 아이 데리고 가서는 정말 체험이 힘들꺼 같더라구요!!<br>
			그래도 아이가 너무 좋아서해 다행이예요!!<br>
			모든게 너무 좋았고 정말 재미있었고 진짜 주차공간도 넓고 모든게<br>
			완벽했는데..<br>
			실내가 너무 덥고 화장실을 가려면 다시 밖으로 나가야 한다는 단점 빼고는 너무 좋았습니다!!<br>
			그래서 별점 4개입니다!! 진짜 너무 더웠거든요 ㅠㅠ
		</span>
		<span class="more-text">더보기</span>
		<span class="less-text">줄이기</span> 
	</div>
</div>

<c:forEach   var="page" begin="1" end="10" step="1" >
	<c:if test="${section >1 && page==1 }">
		<a class="section" href="${contextPath}/center/refund.do?section=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp;pre &nbsp;</a>
	</c:if>
		<a class="section" href="${contextPath}/center/refund.do?section=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
	<c:if test="${page ==10 }">
		<a class="section" href="${contextPath}/center/refund.do?section=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
	</c:if> 
</c:forEach> 

<script>
	//코드에 필요한 요소들 변수에 할당 (전체 ui를 감싸는 div, 내용 텍스트, 더보기/줄이기 텍스트)
	const textWrapper = document.querySelector('.text-wrapper');
	const text = document.querySelector('.text');
	const moreText = document.querySelector('.more-text');
	const lessText = document.querySelector('.less-text'); 
	
	// 더보기 텍스트 클릭시 이벤트
	moreText.addEventListener('click', () => {
		
	moreText.style.display = 'none'; // 더보기 텍스트 삭제
    lessText.style.display = 'inline-block'; // 줄이기 텍스트 표시
    text.style.display = 'inline-block'; // 텍스트의 속성을 -webkit-box에서 일반 inline-block 으로 변경
    });

	// 줄이기 텍스트 클릭시 이벤트
    lessText.addEventListener('click', () => {

    lessText.style.display = 'none'; // 줄이기 텍스트 삭제
    moreText.style.display = 'inline-block'; // 더보기 텍스트 표시
    text.style.display = '-webkit-box'; // 텍스트의 속성을 다시 -webkit-box로 표시
    });
</script>
</body>
=======
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
<title>관리자 커뮤티니</title>
<style>
	.wrap_1100 {
		margin: auto;
		width: 1100px;
		position: relative;
	}
	
	.comm_title{
		font-size: 25px;
		font-weight: 900;
		text-align: left;
		padding-top: 50px;
	}
	
	.comm_title_more {
		position: absolute;
		right: 750px;
		font-size: 15px;
		text-decoration: none;
	}
		
	.review_title {
    	display: flex;
    	justify-content: space-between;
    	padding: 10px 0 7px 0;
	}

	.review_title_left {
    	display: flex;
    	align-items: center;
	}

	.review_title_left_stars {
	    width: 95px;
	    height: 16px;
	}

	.review_title_left_star {
	    background-image: url(${contextPath}/resources/images/stars.png);
	    background-repeat: no-repeat;
	    background-size: 95px;
	    width: 100%;
	    height: 16px;
	}

	.review_title_left_star_filled {
	    position: absolute;
	    background-image: url(${contextPath}/resources/images/member/stars.png);
	    background-repeat: no-repeat;
	    background-size: 95px;
	    height: 16px;
	}
	
	.review_title_left_name {
   		align-items: flex-end;
	}

	.review_title_left_name, .review_title_right {
	    color: #777;
	    font-size: 14px;
	}
	
	.text {
		/* 요소의 내용이 영역을 벗어날 경우 그 부분은 숨겨지게 처리 */ 
		overflow: hidden;
		/* 요소의 표시 방법을 -webkit-box로 표시 */
		display: none;
		/* webkit-box로 표시된 자식 요소들의 배치 방법 결정 (여기서는 수직) */ 
		-webkit-box-orient: vertical;
		/* 요소 내 텍스트를 지정한 라인수까지만 표시 */
		-webkit-line-clamp: 0;
		width: 99%;
		font-size: 15px;
	}
	
	.more-text{
		/* 글씨 크기,색상 지정 */ 
		font-size: 15px;
		/* 마우스 포인트가 올라갔을 때 커서 모양을 포인터로 변경 */
		cursor: pointer;
		font-weight: bold;
		color: #000;
		text-align: left;
	}
	
	.section{
		cursor: pointer;
		color: black;
		text-decoration: none;
	}

</style>
</head>
<body>
<div class="wrap_1100">
	<div class="comm_title">
    	<div style="text-align:left;">커뮤니티 관리</div>
    	<div class="comm_title_more"><a href="${contextPath}/community/adminCommunity.do" align="left"> 리뷰조회</a> | 리뷰삭제</div>
        <div style="width: auto; border: 1px solid; border-color: #FF6251; margin-top: 30px; margin-bottom:10px;"></div>
    </div>
    <c:choose>
    	<c:when test="${empty u_commulist }">
    	리뷰가 없습니다.
    	</c:when>
    	<c:otherwise>
    	<c:forEach var="u_list" items="${u_commulist }">
 		   	<div class="review_title">
				<div class="review_title_left">
    				<div class="review_title_left_stars">
        				<div class="review_title_left_star">
          					<div class="review_title_left_star_filled" style="width: calc(5 * 19px);"></div>
        				</div>
        			</div>
				<div class="review_title_left_name" style="padding-left: 10px;">
				${u_list.mem_id }
				</div>
				</div>
				<div class="review_title_right" style="padding-right:8px;">
				${u_list.c_date }
				</div>
			</div>
		<div>
		<div class="more-text">
			${u_list.c_title }
			<span class="text"> ${u_list.c_content }</span>
		</div>
		</div>
		</c:forEach>
		</c:otherwise>
	</c:choose>
</div>
<c:forEach var="page" begin="1" end="10" step="1" >
	<c:if test="${section >1 && page==1 }">
		<a class="section" href="${contextPath}/community/u_Commu.do?section=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp;pre &nbsp;</a>
	</c:if>
		<a class="section" href="${contextPath}/community/u_Commu.do?section=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
	<c:if test="${page ==10 }">
		<a class="section" href="${contextPath}/community/u_Commu.do?section=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
	</c:if> 
</c:forEach> 
<script>
	//코드에 필요한 요소들 변수에 할당 (전체 ui를 감싸는 div, 내용 텍스트, 더보기/줄이기 텍스트)
	//debugger;
	var arrMoreText = document.getElementsByClassName("more-text");
	var arrMoreTextLen = arrMoreText.length;
	
	for(var i =0; i<arrMoreTextLen; i++){
		let moreTextObj = arrMoreText[i];
		
		moreTextObj.addEventListener('click', () => {
			
			moreTextObj.childNodes.forEach(function(v){//v = nodeList
				if(v.nodeName === "SPAN"){
					if(v.style.display === "inline-block"){
						v.style.display = "";
					}else{
						v.style.display = 'inline-block';
					}
				}
			});
		});
	}
</script>
</body>
>>>>>>> refs/remotes/origin/master
</html>