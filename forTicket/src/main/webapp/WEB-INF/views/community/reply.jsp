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
			obj.action = "${contextPath}/community/u_Commu.do";
			obj.submit();
		}
	</script>
	<style>
	.center{
		margin: auto;
		width: 800px;
		position: relative;
		border:3px solid #FF6251;
		border-radius: 20px;
		padding: 50px;
		margin-top: 50px;
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
    	<h2 style="text-align:left; margin-bottom:10px;">리뷰 답변</h2>
        <div style="width: auto; border: 1px solid; border-color: #FF6251; margin-top: 10px; margin-bottom:10px;"></div>
    </div>
    <form name = "wirte" method="post" action="${contextPath }/community/update_reply.do">
		<table class="tb1">
			<tr>
				<td class="td1">작성자</td>
				<td class="td2"><input type="text" name="mem_id" value="${reply.mem_id}" readonly/></td>
			</tr>
			<tr>
				<td class="td1">제목</td>
				<td class="td2"><input type="text" value="${reply.c_title }" name="c_title" readonly/></td>
			</tr>
			<tr>
				<td class="td1">내용</td>
				<td class="td2"><input class="inputsize" type="text" name="c_content" value="${reply.c_content }" readonly ></td>
			</tr>
			<tr>
				<td class="td1">답글</td>
				<td class="td2"><input class="inputsize" type="text" name="c_reply" value="${reply.c_reply }"></td>
			</tr>
			<tr>
				<td colspan="2" class="td3">
					<input type="submit" value="등록" />
					<input type="button" value="돌아가기" onclick="backToList(this.form)" />
				</td>
			</tr>
		</table>
		<input type="hidden" name="c_No" value="${reply.c_No }" readonly>
		<input type="hidden" name="goods_id" value="${reply.goods_id }" readonly>
	</form>
</div>
</body>

</html>