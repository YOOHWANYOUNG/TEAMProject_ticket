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
		width: 800px;
		position: relative;
		border:3px solid #FF6251;
		border-radius: 20px;
		padding: 50px 50px 10px 50px;
		margin-top: 50px;
	}
	
	.comm_title{
		font-size: 25px;
		font-weight: 900;
		text-align: left;
		padding-top: 10px;
	}
	
	.comm_title_more {
		position: absolute;
		right: 50px;
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
	    background-repeat: no-repeat;
	    background-size: 95px;
	    width: 100%;
	    height: 16px;
	}

	.review_title_left_star_filled {
	    position: absolute;
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

	.more{
		text-align: right;
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
		font-size: 15px;
		font-weight: bold;
	}
	.section_sel{
		cursor: pointer;
		color: #0066ff;
		text-decoration: none;
		font-size: 15px;
		font-weight: bold;
	}
	.page1{
		margin-top:10px;
	}
	
	.reply{
		cursor: pointer;
		color: #FF6251;
		text-decoration: none;
		font-size: 15px;
		text-align: right;	
		padding-left: 730px;	
	}
	
	.star {
	    unicode-bidi: bidi-override;
	    color: #FFD700;
	    font-size: 25px;
	    height: 35px;
	    width: 125px;
	    margin: 0 auto;
	    position: relative;
	    text-align: left;
	}
	.page1{
		margin-top:50px;
	}
	.review_link{
		text-decoration: none;
		cursor: pointer;
		color: #FF6251;
		font-weight: bold;
	}
</style>
</head>
<body>
<div class="wrap_1100">
	<div class="comm_title">
    	<div style="text-align:left;">커뮤니티</div>
    	<div class="comm_title_more">
    		<c:if test="${isLogOn == true && type=='U'}">
	    		<a class="review_link" href="${contextPath}/member/myreservation.do?mem_id=${member.mem_id }">리뷰작성</a>
    		</c:if>
		</div>
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
					<c:if test="${u_list.star =='1'}">
					<span class="star">★</span>
					</c:if>
					<c:if test="${u_list.star =='2'}">
					<span class="star">★★</span>
					</c:if>
					<c:if test="${u_list.star =='3'}">
					<span class="star">★★★</span>
					</c:if>
					<c:if test="${u_list.star =='4'}">
					<span class="star">★★★★</span>
					</c:if>
					<c:if test="${u_list.star =='5'}">
					<span class="star">★★★★★</span>
					</c:if>
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
			<div class="more">더보기</div>
			<span class="text"> ${u_list.c_content }<br><br>
				<c:if test="${not empty u_list.imageFileName && u_list.imageFileName !='null' }">
					<img width="100px" height="100px" src="${contextPath}/community/download.do?c_No=${u_list.c_No}&imageFileName=${u_list.imageFileName}"><br><br>
				</c:if>
				<c:if test="${not empty u_list.c_reply && u_list.c_reply !='null' }">
					 <img width="30px" height="30px" src="${contextPath}/resources/images/reply.png">${u_list.c_reply }<br><br>
				</c:if>
				<c:if test="${empty u_list.c_reply && isLogOn == true && type=='B'}">
					<a class="reply" href="${contextPath}/community/reply.do?c_No=${u_list.c_No}">댓글쓰기</a>
				</c:if>
				<c:if test="${isLogOn == true && type=='admin'}">
					<a class="reply" href="${contextPath}/community/delete.do?c_No=${u_list.c_No}">삭제하기</a>
				</c:if>
				<c:if test="${isLogOn == true && type=='U' && u_list.mem_id == member.mem_id}">
					<a class="reply" href="${contextPath}/community/delete.do?c_No=${u_list.c_No}">삭제하기</a>
				</c:if>				
			<input type="hidden" name="c_No" value="${u_list.c_No }">
			</span>
		</div>
		</div>
		</c:forEach>
		</c:otherwise>
	</c:choose>
	<div class="page1">
	<c:if test="${totalCommNum != null}">
			         	<c:choose>
			         		<c:when test="${totalCommNum>100 }">
				                <c:forEach var="page" begin="1" end="10" step="1" >
							         <c:if test="${section >1 && page==1 }">
							         	<a class="section" href="${contextPath}/community/u_Commu.do?section=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp;pre &nbsp;</a>
							         </c:if>
							         	<a class="section" href="${contextPath}/community/u_Commu.do?section=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
							         <c:if test="${page ==10 }">
							         	<a class="section" href="${contextPath}/community/u_Commu.do?section=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
							         </c:if> 
					      		</c:forEach>
					      	</c:when>
					      	<c:when test="${totalCommNum==100 }">
					      		<c:forEach var="page" begin="1" end="10" step="1" >
					      			<a class="section" href="#">${page}</a>
					      		</c:forEach>
					      	</c:when>
					      	<c:when test="${totalCommNum<100 }">
					      		<c:forEach var="page" begin="1" end="${totalCommNum/10 +1}" step="1">
					      			<c:choose>
					      				<c:when test="${page==pageNum}">
					      					<a class="section_sel" href="${contextPath}/community/u_Commu.do?section=${section}&pageNum=${page}">${page}</a>
					      				</c:when>
					      				<c:otherwise>
					      					<a class="section" href="${contextPath}/community/u_Commu.do?section=${section}&pageNum=${page}">${page}</a>
					      				</c:otherwise>
					      			</c:choose>
					      		</c:forEach>
					      	</c:when>
				      	</c:choose>
		      		</c:if>
	</div> 
</div>
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

	/*
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
	*/
</script>
</body>

</html>