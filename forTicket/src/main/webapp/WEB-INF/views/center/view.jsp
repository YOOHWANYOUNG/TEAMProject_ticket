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
	<title>Insert title here</title>
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
	
	.view_table{
		margin-left:auto; 
    	margin-right:auto;
		width: 80%;
    	border-collapse: collapse;
    	border: 1px solid #FF6251;
		border-style: hidden;
        box-shadow: 0 0 0 2px #FF6251;
        border-spacing: 0;
        border-radius: 15px;
	}
	
	.view_tr1{
		border-bottom: 1px solid #FF6251;
	}
	 
	.view_td1{
		text-align: right;
		color: #bcbcbc;
		font-size: 12px;
	}
	
	.view_td2{
		text-align: right;
	}
	
	.view_input{
		width : 440px;
		height: 25px;
		text-align: left;
		font-size: 15px;
		border-radius: 15px;
	}
	
	.view_button{
		background-color: #fff;
		border: 1px solid #bcbcbc;
		border-radius: 15px;
		cursor: pointer;
		height: 30px;
		text-align: center;
	}
	
	.view_hidden{
		background-color: #fff;
		border: 1px solid #bcbcbc;
		border-radius: 15px;
		height: 30px;
		text-align: center;
	}
	
	.view_area{
		text-align: left;
		font-size: 15px;
		border-radius: 15px;
	}
	
	</style>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
	<script type = "text/javascript">
		function fn_enable(obj){
			var open = document.getElementById("i_hidden");
			open.type = "button";
			var openType = document.getElementById("i_hidden1");
			openType.type = "text"
			
			document.getElementById("i_title").disabled=false;
			document.getElementById("i_content").disabled=false;
			document.getElementById("i_select").disabled=false;
		}
				
		function fn_modify_view(obj){
			obj.action="${contextPath}/center/edit.do";
			obj.submit();		
		}
		
		function fn_remove_view(url,center_No){
			var form = document.createElement("form");
				form.setAttribute("method","post");
				form.setAttribute("action",url);
			
			var center_NoInput = document.createElement("input");
			center_NoInput.setAttribute("type","hidden");
			center_NoInput.setAttribute("name","center_No");
			center_NoInput.setAttribute("value",center_No);
				
				form.appendChild(center_NoInput);
				
				document.body.appendChild(form);
				
				form.submit();
		}
				
		function backToList(obj){
			obj.action = "${contextPath}/center/notice.do";
			obj.submit();
		}
		
	</script>
</head>
<body>
<div class="center">
	<div style="margin-bottom:20px;">
    	<h2 style="text-align:left; margin-bottom:10px;">고객센터</h2>
        <div style="width: auto; border: 1px solid; border-color: #FF6251; margin-top: 10px; margin-bottom:10px;"></div>
    </div>

<form name="frmView" method="post" action="${contextPath}">
	<table class="view_table">
		<c:if test="${isLogOn == true && type=='admin'}">
		<tr>
			<td>
			<input type="hidden" name="center_Type" value="${views.center_Type}" id="i_hidden1" class="view_hidden" readonly>
			</td>
			<td><input type="hidden" name="center_No" value="${views.center_No}" /></td>
		</tr>
		</c:if>
		<tr class="view_tr1">
			<td>
				<input class="view_input" type = "text" value = "${views.center_Title }" name = "center_Title" id = "i_title" disabled />
			</td>
		</tr>
		<tr>
			<td class="view_td1">작성 ${views.center_creDate }
		</tr>
		<tr>
			<td class="view_td1">수정 ${views.center_update }
		</tr>
		<tr>
			<td>
				<textarea class="view_area" rows="20" cols ="60" name ="center_Detail" id = "i_content" disabled>${views.center_Detail }</textarea>
			</td>
		</tr>
		<c:if test="${isLogOn == true && type=='admin'}">
		<tr id="tr_btn_modify">
			<td class="view_td2">
				<input type="hidden" value="수정반영하기" onclick="fn_modify_view(frmView)" class="view_button" id="i_hidden">
				<input type=button value = "수정하기" onclick="fn_enable(this.form)" class="view_button">
				<input type="button" value ="삭제하기" onclick="fn_remove_view('${contextPath}/center/delete.do',${views.center_No})" class="view_button">
			</td>
		</tr>
		</c:if>
		<tr id="tr_btn">
			<td class="view_td2">
				<input type="button" value="리스트로 돌아가기" onclick="backToList(this.form)" class="view_button">
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>