 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath" value = "${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>1:1 관리자 답변</title>
	<script type = "text/javascript">
		function backToList(obj){
			obj.action = "${contextPath}/center/question.do";
			obj.submit();
		}
	</script>
	<style>
	.center{
		border:3px solid #bcbcbc;
		border-radius: 20px;
		padding:30px;
		font-size:15px;
		line-height:280%;
		border-color: #bcbcbc;
		padding-bottom: 50px;
		width: 50%;
    	margin: auto;
	}
	
	.tb1{
		margin-left: 100px;
	}
	
	.td1{
		width: 120px;
		text-align: left;
	}
	
	.td2{
		text-align: left;
	}
	
	.td3{
		text-align: right;
	}
	
	.inputsize{
		width: 450px;
		height: 200px;
	}
	</style>
</head>
<body>
<div class="center">
	<div style="margin-bottom:20px;">
    	<h2 style="text-align:left; margin-bottom:10px;">리뷰 작성</h2>
        <div style="width: auto; border: 1px solid; border-color: #bcbcbc; margin-top: 10px; margin-bottom:10px;"></div>
    </div>
    <form name = "wirte" method="post" action="${contextPath }/center/update_reply.do">
		<table class="tb1">
			<tr>
				<td class="td1">작성자</td>
				<td class="td2"><input type="text" name="mem_id" value="${member.mem_id}" /></td>
			</tr>
			<tr>
				<td>
					<select>
	    				<c:forEach items="" var = "o">
	    					<option> </option>
	    				</c:forEach>
	    			</select>
				</td>
			</tr>
			<tr>
				<td class="td1">제목</td>
				<td class="td2"><input type="text" value="" name="q_Title" /></td>
				<td> 별점</td>
				<td>
					<div class="rate">
						<span style="width: 50%"></span>
					</div>    
    			</td>
			</tr>
			<tr>
				<td class="td1">내용</td>
				<td class="td2"><input class="inputsize" type="text" name="q_content" value="" ></td>
			</tr>
			<tr>
				<td class="td1">답글</td>
				<td class="td2"><input class="inputsize" type="text" name="a_reply" value=""></td>
			</tr>
			<tr>
				<td colspan="2" class="td3">
					<input type="submit" value="등록" />
					<input type="button" value="돌아가기" onclick="backToList(this.form)" />
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>