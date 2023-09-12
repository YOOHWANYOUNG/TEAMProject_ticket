<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<c:set var="contextPath" value="${pageContext.request.contextPath}" />

		<% request.setCharacterEncoding("UTF-8"); %>

			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>회원 정보 수정창</title>
				<style>
					.text_center {
						text-align: center;
					}

					.mod1 {
						font-family: 'Cafe24Supermagic-Bold-v1.0';
					}

					.mod2 {
						font-family: 'Cafe24Supermagic-Bold-v1.0';
						padding: 10px;
						font-size: 20px;
						text-align: right;
						width: 150px;
						height: 40px;
					}

					.mod3 {
						font-family: 'Cafe24Supermagic-Bold-v1.0';
						padding: 10px;
						font-size: 20px;
						border-radius: 5px;
						text-align: left;
						width: 350px;
					}

					.mod4 {
						font-family: 'Cafe24Supermagic-Bold-v1.0';
						border: 1px solid #99e6ff;
						width: 200px;
						height: 30px;
						border-radius: 5px;
					}

					.mod5 {
						font-family: 'Cafe24Supermagic-Bold-v1.0';
						width: 200px;
						height: 30px;
						background-color: #99e6ff;
						color: #0066cc;
						border: none;
						border-radius: 5px;
					}

					.mod8 {
						height: 80px;
						text-align: center;
					}

					.member7 {
						height: 80px;
						text-align: center;
					}

					.member5 {
						font-family: 'Cafe24Supermagic-Bold-v1.0';
						width: 100px;
						height: 30px;
						background-color: #99e6ff;
						color: #0066cc;
						border: none;
						border-radius: 5px;
						font-size: 15px;
					}

					@font-face {
						font-family: 'Cafe24Supermagic-Bold-v1.0';
						src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-2@1.0/Cafe24Supermagic-Bold-v1.0.woff2') format('woff2');
						font-weight: 700;
						font-style: normal;
					}
				</style>
				<script src="http://code.jquery.com/jquery-latest.min.js"></script>
				<script type="text/javascript">
					function readURL(input) {
						if (input.files && input.files[0]) {
							var reader = new FileReader();
							reader.onload = function (e) {
								$('#preview').attr('src', e.target.result);
							}
							reader.readAsDataURL(input.files[0]);
						}
					}

					function fn_sub(obj) {
						document.getElementById("i_id").disabled = false;
						obj.submit();
					}
				</script>
			</head>

			<body>
				<div class="mod1">
					<form method="post" action="${contextPath}/member/updateMember.do" enctype="multipart/form-data">
						<h2 class="text_center">회원 정보 수정창</h2>
						<table align="center">
							<tr class="mod2">
								<td class="mod2">아이디</td>
								<td class="mod3"><input type="text" class="mod4" name="mem_id" id="i_id"
										value="${member.id}" readonly>
								</td>
							</tr>
							<tr class="mod2">
								<td class="mod2">비밀번호</td>
								<td class="mod3"><input class="mod4" type="password" name="pwd" value="${member.pwd}">
								</td>
							</tr>
							<tr class="mod2">
								<td class="mod2">이름</td>
								<td class="mod3">
									<input type="text" class="mod4" name="mem_name" value="${member.name}">
								</td>
							</tr>
							<tr class="mod2">
								<td class="mod2">이메일</td>
								<td class="mod3">
									<input type="text" class="mod4" name="email" value="${member.email}">
								</td>
							</tr>
							<tr class="mod2">
								<td class="mod2">사진 등록</td>
								<td class="mod3"><input class="mod5" type="hidden" name="originalFileName"
										value="${member.imageFileName }" />
									<img width="200" height="200"
										src="${contextPath}/download.do?articleNO=${member.articleNO}&imageFileName=${member.imageFileName }"
										id="preview" />
									<input type="file" class="mod5" name="imageFileName" id="i_imageFileName"
										onchange="readURL(this);" />
								</td>
							</tr>
							<tr class="mod2">
								<td class="member7" colspan="3">
									<input class="member5" type="button" onclick="fn_sub(this.form)"
										value="수정하기">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input class="member5" type="reset" value="다시입력">
								</td>
							</tr>

							<tr class="mod2">
								<td class="mod3" colspan="3">
									<input type="hidden" name="articleNO" value="${member.articleNO }" />
								</td>
							</tr>
						</table>
					</form>
				</div>
			</body>

			</html>