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
	<title>고객센터 작성</title>
	<script type = "text/javascript">
		function backToList(obj){
			obj.action = "${contextPath}/center/notice.do";
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
		border-color: #FF6251;
		padding-bottom: 50px;
	}
	
	.tb1{
		margin-left: 100px;
	}
	
	.td1{
		width: 150px;
		text-align: left;
	}
	
	.td2{
		text-align: left;
	}
	
	.td3{
		text-align: right;
	}
	</style>
</head>
<body>
<div class="center">
	<div style="margin-bottom:20px;">
    	<h2 style="text-align:left; margin-bottom:10px;">공지사항 글쓰기</h2>
        <div style="width: auto; border: 1px solid; border-color: #FF6251; margin-top: 10px; margin-bottom:10px;"></div>
    </div>
    <form name = "wirte" method="post" action="${contextPath }/center/addWirte.do">
		<table class="tb1">
			<tr>
				<td class="td1">분류</td>
				<td class="td2">
					<select name="center_Type">
						<option value="refund">환불안내</option>
						<option value="notice">공지사항</option>
						<option value="faq">FAQ</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="td1">글제목</td>
				<td class="td2"><input type="text" size ="63" maxlength="500" name="center_Title" /></td>
			</tr>
			<tr>
				<td class="td1">글내용</td>
				<td class="td2"><textarea name="center_Detail" rows ="10" cols="65" maxlength="4000"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" class="td3">
					<input type="submit" value="등록" />
					<input type="button" value="돌아가기" onclick="backToList(this.form)" />
				</td>
			</tr>
		</table>
		<input type="hidden" name="mem_id" value="${member.mem_id}" />
	</form>
</div>
</body>
</html>