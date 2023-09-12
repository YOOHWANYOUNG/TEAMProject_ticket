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
	<title>리뷰 작성</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type = "text/javascript">
		function backToList(obj){
			obj.action = "${contextPath}/member/myreservation.do";
			obj.submit();
		}
		
		function addList(obj){
			obj.action = "${contextPath }/community/add_review.do";
			obj.submit();
		}
		
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function (e) {
					$('#preview').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>
	<style>
	.center{
		border:3px solid  #FF6251;
		border-radius: 20px;
		padding:30px;
		font-size:15px;
		line-height:280%;
		border-color:  #FF6251;
		padding-bottom: 50px;
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
	
	.td4{
		height: 30px;
		width: 120px;
		text-align: left;
	}
	
	.td5{
		text-align: left;
	}
	
	.inputsize{
		width: 450px;
		height: 200px;
		border:1px solid  #FF6251;
		border-radius: 10px;
	}
	
	.input{
		border:1px solid  #FF6251;
		border-radius: 20px;
		width: 250px;
		height: 30px;
	}
	
	#myform fieldset{
    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
    direction: rtl; /* 이모지 순서 반전 */
    border: 0; /* 필드셋 테두리 제거 */
	}
	
	#myform input[type=radio]{
	    display: none; /* 라디오박스 감춤 */
	}
	#myform label{
	    font-size: 1em; /* 이모지 크기 */
	    color: transparent; /* 기존 이모지 컬러 제거 */
	    text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
	}
	#myform label:hover{
	    text-shadow: 0 0 0 #FFD700;; /* 마우스 호버 */
	}
	#myform label:hover ~ label{
	    text-shadow: 0 0 0 #FFD700; /* 마우스 호버 뒤에오는 이모지들 */
	}
	#myform input[type=radio]:checked ~ label{
	    text-shadow: 0 0 0 #FFD700; /* 마우스 클릭 체크 */
	}

	</style>
</head>
<body>
<div class="center">
	<div style="margin-bottom:20px;">
    	<h2 style="text-align:left; margin-bottom:10px;">리뷰 작성</h2>
        <div style="width: auto; border: 1px solid; border-color: #FF6251; margin-top: 10px; margin-bottom:10px;"></div>
    </div>
    <form name = "wirte" method="post" action="${contextPath }/community/add_review.do" enctype = "multipart/form-data">
		<table class="tb1">
			<tr>
				<td class="td1">작성자</td>
				<td class="td2"><input class="input" type="text" name="mem_id" value="${review.mem_id}" readonly/></td>
			</tr>
			<tr>
				<td class="td1">공연명</td>
				<td class="td2"><input class="input" type="text" value="${review.goods_name }" name="goods_name" readonly/></td>
			</tr>
			<tr>
				<td class="td1">제목</td>
				<td class="td2"><input class="input" type="text" value="" name="c_title"/></td>
			</tr>
			<tr>
				<td class="td4">별점</td>
				<td class="td5">
					<div name="" id="myform">
			    	<fieldset>
				        <input type="radio" name="star" value="5" id="rate1"><label for="rate1">⭐</label>
				        <input type="radio" name="star" value="4" id="rate2"><label for="rate2">⭐</label>
				        <input type="radio" name="star" value="3" id="rate3"><label for="rate3">⭐</label>
				        <input type="radio" name="star" value="2" id="rate4"><label for="rate4">⭐</label>
				        <input type="radio" name="star" value="1" id="rate5"><label for="rate5">⭐</label>
			    	</fieldset>
    				</div>				
				</td>
			</tr>
			<tr>
				<td class="td1">내용</td>
				<td class="td2">
				<textarea class="inputsize" name="c_content" rows ="20" cols="65" maxlength="4000"></textarea>
				</td>
			</tr>
			<tr>
				<td class="td1">사진첨부</td>
				<td class="td2">
					<input type="file" name="imageFileName" onchange ="readURL(this);" />
					<img id="preview" src="#" width=200 height=200 />
				</td>
			</tr>
			<tr>
				<td colspan="2" class="td3">
					<input type="button" value="등록" onclick="addList(this.form)" />
					<input type="button" value="돌아가기" onclick="backToList(this.form)" />
				</td>
			</tr>
		</table>
		<input type="hidden" name="order_No" value="${review.order_No }" readonly>		
		<input type="hidden" name="goods_id" value="${review.goods_id }" readonly>		
	</form>
</div>
</body>

</html>