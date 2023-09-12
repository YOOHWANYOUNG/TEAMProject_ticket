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
	<title>1:1문의</title>
	<style>
	.center{
		border:3px solid #bcbcbc;
		border-radius: 20px;
		padding:30px;
		font-size:15px;
		line-height:280%;
		border-color: #FF6251;
		padding-bottom: 50px;
	}
	
	.board{
		width: 100%;
    	border: 1px solid #bcbcbc;
		border-collapse: collapse;
		border-style: hidden;
        box-shadow: 0 0 0 2px #bcbcbc;
        border-spacing: 0;
        border-radius: 15px;
	}
	
	.boardtr{
		 border-bottom: 2px solid #FF6251;
	}
	
	.boardtd{
	border-radius: 15px 0px 0px 0px;
		width:550px;
		background-color: #FF6251;
	}
	
	.boardtd1{
		width:550px;
		background-color: #FF6251;
	}
	.boardtd3{
	border-radius: 0px 15px 0px 0px;
		width:550px;
		background-color: #FF6251;
	}
	
	.cls1{
		text-decoration: none;
	    color: black;
	    margin-left: 750px;
	    font-size: 15px;
	    font-weight: 600;
	}
	
	.text-wrapper {
    	position: relative;
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
		/* 텍스트 양쪽정렬 */ 
	   	width: 99%;
		position: relative;
		font-size: 15px;
	}
	
	.text1 {
		/* 요소의 내용이 영역을 벗어날 경우 그 부분은 숨겨지게 처리 */ 
		overflow: hidden;
		/* 요소의 표시 방법을 -webkit-box로 표시 */
		display: none;
		/* webkit-box로 표시된 자식 요소들의 배치 방법 결정 (여기서는 수직) */ 
		-webkit-box-orient: vertical;
		/* 요소 내 텍스트를 지정한 라인수까지만 표시 */
		-webkit-line-clamp: 0;
		/* 텍스트 양쪽정렬 */ 
	   	width: 99%;
		position: relative;
		font-size: 15px;
	}
	
	.more-text{
		/* 글씨 크기,색상 지정 */ 
		font-size: 15px;
		/* 마우스 포인트가 올라갔을 때 커서 모양을 포인터로 변경 */
		cursor: pointer;
		font-weight: bold;
	}
	
	.alink{
		cursor: pointer;
		color: #FF6251;
		text-decoration: none;
	}
	
	</style>
</head>
<body>
<div class="center">
	<div style="margin-bottom:20px;">
    	<h2 style="text-align:left; margin-bottom:10px;">1:1문의</h2>
        <div style="width: auto; border: 1px solid; border-color: #FF6251; margin-top: 10px; margin-bottom:10px;"></div>
    </div>
	<div>
    	<table class="board">
		<tr class="boardtr">
			<td class="boardtd">번호</td>
			<td class="boardtd1">답변상태</td>
			<td class="boardtd1">제목</td>
			<td class="boardtd1">등록일</td>
			<td class="boardtd3">삭제</td>
		</tr>
		<c:choose>
		    <c:when test="${empty que_List}">
		    	<tr>
		            <td colspan="4">
		                <p><b><span style="font-size:9pt;">등록된 글이 없습니다.</span></b></p>
		            </td>
		        </tr>
		    </c:when>
		    <c:when test="${!empty que_List}">
		        <c:forEach var="que" items="${que_List }">
					<tr align="center">
	                    <td>${que.q_mem_No }</td>
	                	<td>${que.q_Status }</td>
	                    <td class="td1"><div class="text-wrapper">
	                    	<div>
	                    		<div class="more-text">
	                    			${que.q_Title }
	                    			<span class="text">Q. ${que.q_content }</span>
	                    			<span class="text1">A. ${que.a_reply }</span>
	                    		</div>
	                    	</div>
	                    </div></td>
	                    <td><fmt:formatDate value="${que.q_creDate }" /></td>
	                    <td><a class="alink" href="${contextPath}/center/q_delete.do?q_Num=${que.q_Num}">삭제</a></td>
	                </tr>
	            </c:forEach>
		    </c:when>
		</c:choose>
		</table>
	</div>
	<c:if test="${isLogOn == true && type !='admin'}">
		<a class="cls1" href="${contextPath}/center/q_write.do">글쓰기</a>
	</c:if>
	<input type="hidden" name="q_Num" value="${que.q_Num }">
</div>
<script>
	//코드에 필요한 요소들 변수에 할당 (전체 ui를 감싸는 div, 내용 텍스트, 더보기/줄이기 텍스트)
	//debugger;
	var arrMoreText = document.getElementsByClassName("more-text");
	var arrMoreTextLen = arrMoreText.length;
	
	for(var i=0; i<arrMoreTextLen; i++){
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
			
			//text.style.display = 'inline-block'; // 텍스트의 속성을 -webkit-box에서 일반 inline-block 으로 변경
			//text1.style.display = 'inline-block'; // 텍스트의 속성을 -webkit-box에서 일반 inline-block 으로 변경
	    });
	}
</script>
</body>
</html>