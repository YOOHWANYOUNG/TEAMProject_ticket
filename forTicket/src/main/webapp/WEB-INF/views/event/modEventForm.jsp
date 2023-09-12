<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="imageList" value="${eventMap.imageFileList}" />
<c:set var="event" value="${eventMap.event}" />
<!DOCTYPE html>
<meta charset="utf-8">
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function fn_addFile() {
		if (cnt == 0) {
			$("#d_file").append("<br>"+ "<input  type='file' name='main_image' id='f_main_image' />");
		} else {
			$("#d_file").append("<br>"+ "<input  type='file' name='detail_image"+cnt+"' />");
		}
		cnt++;
	}
	function readURL(input,preview) {
		//  alert(preview);
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	            $('#'+preview).attr('src', e.target.result);
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	  }
	  function fn_addFile(){
		  $("#d_file").append("<br>"+"<input  type='file' name='detail_image"+cnt+"' id='detail_image"+cnt+"'  onchange=readURL(this,'previewImage"+cnt+"') />");
		  $("#d_file").append("<img  id='previewImage"+cnt+"'   width=200 height=200  />");
		  $("#d_file").append("<input  type='button' value='추가'  onClick=addNewImageFile('detail_image"+cnt+"','${imageList[0].event_no}','detail_image')  />");
		  cnt++;
	  }
	  function fn_mod_new_event(obj){
			 fileName = $('#main_image').val();
			 if(fileName != null && fileName != undefined){
				 obj.submit();
			 }else{
				 alert("메인 이미지는 반드시 첨부해야 합니다.");
				 return;
			 }
		}
	  
	  function modifyImageFile(fileId, goods_id, image_id, fileType, originalFileName){
		    // alert(fileId);
			  var form = $('#FILE_FORM')[0];
		      var formData = new FormData(form);
		      formData.append(fileId, $('#'+fileId)[0].files[0]);
		      formData.append("event_no", event_no);
		      formData.append("image_id", image_id);
		      formData.append("fileType", fileType);
		      formData.append("originalFileName", originalFileName);
		      formData.append("fileName", $('#'+fileId)[0].files[0].name);
		      
		      $.ajax({
		        url: '/event/modEventImage.do',
		        processData: false,
		        contentType: false,
		        data: formData,
		        type: 'POST',
			      success: function(result){
			         alert("이미지를 수정했습니다!");
			       }
		      });
		  }
		  
		  function addNewImageFile(fileId,event_no, fileType){
			   //  alert(fileId);
				  var form = $('#FILE_FORM')[0];
			      var formData = new FormData(form);
			      formData.append(fileId, $('#'+fileId)[0].files[0]);
			      formData.append("event_no", event_no);
			      formData.append("fileType", fileType);
			      formData.append("fileName", $('#'+fileId)[0].files[0].name);
			      
			      $.ajax({
			          url: '/event/addEventImage.do',
			                  processData: false,
			                  contentType: false,
			                  data: formData,
			                  type: 'post',
			                  success: function(result){
			                      alert("이미지를 추가했습니다!");
			                  }
			          });
			  }
		  
		  function deleteImageFile(event_no,image_id,imageFileName,trId){
			var tr = document.getElementById(trId);

		      	$.ajax({
		    		type : "post",
		    		async : true, //false인 경우 동기식으로 처리한다.
		    		url : "/event/removeEventImage.do",
		    		data: {event_no:event_no,
		     	         image_id:image_id,
		     	         imageFileName:imageFileName},
		    		success : function(data, textStatus) {
		    			alert("이미지를 삭제했습니다!!");
		                tr.style.display = 'none';
		    		},
		    		error : function(data, textStatus) {
		    			alert("에러가 발생했습니다."+textStatus);
		    		},
		    		complete : function(data, textStatus) {
		    			//alert("작업을완료 했습니다");
		    			
		    		}
		    	}); //end ajax	
		  }
		  
	//이벤트 유형 선택 변경 시 호출되는 함수
	function handleEventTypeChange() {
		var eventTypeSelect = document.getElementsByName("event_type")[0];
		var eventFinalDateInput = document.getElementsByName("event_finalDate")[0];

		if (eventTypeSelect.value === "disc") {
			eventFinalDateInput.disabled = true;
		} else {
			eventFinalDateInput.disabled = false;
		}
	}
	$(document).ready(function() {

		//When page loads...
		$(".tab_content").hide(); //Hide all content
		$("ul.tabs li:first").addClass("active").show(); //Activate first tab
		$(".tab_content:first").show(); //Show first tab content

		//On Click Event
		$("ul.tabs li").click(function() {

			$("ul.tabs li").removeClass("active"); //Remove any "active" class
			$(this).addClass("active"); //Add "active" class to selected tab
			$(".tab_content").hide(); //Hide all tab content

			var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
			$(activeTab).fadeIn(); //Fade in the active ID content
			return false;
		});

	});
</script>
</head>
<style>
	hr {
		width: 90%;
		float: left;
	}
	form {
		width: 1100px;
		margin: auto;
	}
#container {
	margin: 40px auto; width: 100%;
}
#selec {
	width: 317px;
}
ul.tabs {
	list-style: none; margin: 0px; padding: 0px; width: 100%; height: 32px; border-bottom-color: rgb(255, 0, 0); border-bottom-width: 1px; border-bottom-style: solid; float: left;
}
ul.tabs li {
	border-width: 1px; border-style: solid; border-color: rgb(153, 153, 153) rgb(153, 153, 153) rgb(255, 0, 0); margin: 0px 1px; padding: 0px; border-image: none; height: 31px; line-height: 31px; overflow: hidden; float: left; border-top-left-radius: 7px; border-top-right-radius: 7px; background-color: rgb(245, 245, 245);
}
ul.tabs li a {
	padding: 0px 20px; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; text-decoration: none; display: block;
}
ul.tabs li a:hover {
	background-color: rgb(202, 228, 255);
}
ul.tabs li.active {
	background: rgb(255, 255, 255); border-color: rgb(255, 0, 0) rgb(255, 0, 0) rgb(255, 255, 255); border-bottom-width: 2px; border-bottom-style: solid;
}
ul.tabs li.active a:hover {
	background: rgb(255, 255, 255); border-color: rgb(255, 0, 0) rgb(255, 0, 0) rgb(255, 255, 255); border-bottom-width: 2px; border-bottom-style: solid;
}
.tab_container {
	background: rgb(255, 255, 255); width: 100%; clear: both; border-top-color: currentColor; border-top-width: medium; border-top-style: none; 
}
.tab_content {
	padding: 10px 10px 20px; line-height: 1.8em; font-size: 0.75em; min-height: 400px;
}
.tab_content h4 {
	background-position: left top; margin: 10px 0px; padding: 20px 0px 5px 35px; height: 30px; color: rgb(255, 255, 255); letter-spacing: 4px; font-family: "NanumGothic", Serif; font-size: 16px; font-weight: bold; background-image: url("../imgs/h4_back.png"); background-repeat: no-repeat;
}
.tab_content p {
	margin: 10px 0px 0px;
}
.tab_content img {
	margin: 10px; padding: 5px;
}
.tab_content .writer {
	margin: 10px 0px; padding: 5px; color: rgb(0, 0, 0); font-size: 1.2em; font-weight: bold; border-bottom-color: rgb(255, 153, 0); border-bottom-width: 1px; border-bottom-style: solid;
}
</style>
<body>
	<form action="${contextPath}/event/modEvent.do" method="post"
		enctype="multipart/form-data">
		<h1>이벤트 상품 수정창</h1>
		<div class="tab_container">
			<!-- 내용 들어 가는 곳 -->
			<div class="tab_container" id="container">
				<ul class="tabs">
					<li><a href="#tab1">상품정보</a></li>
					<li><a href="#tab2">이벤트 정보</a></li>
					<li><a href="#tab7">이미지</a></li>
				</ul>
				<div class="tab_container">
					<div class="tab_content" id="tab1">
						<input type="hidden" name="goods_id" value="${goods.goods_id}" />
						<table>
							<tr>
								<td width=200>상품 선택</td>
								<td width=500><input name="goods_name"
									value="${goods.goods_name}" type="text" size="40" readonly>
								</td>
							</tr>
							<tr>
								<td>상품 분류</td>
								<td><input name="goods_type" value="${goods.goods_type}"
									type="text" size="40" readonly/></td>
							</tr>
							<tr>
								<td>장르</td>
								<td><input name="goods_genre" value="${goods.goods_genre}"
									type="text" size="40" readonly/></td>
							</tr>
							<tr>
								<td>공연 기간</td>
								<td><input name="goods_startDate"
									value="${goods.goods_startDate}" type="text" size="18" readonly />
									~ <input name="goods_endDate" value="${goods.goods_endDate}"
									type="text" size="18"/></td>
							</tr>
							<tr>
								<td>러닝타임</td>
								<td><input name="goods_runningTime"
									value="${goods.goods_runningTime}" type="text" size="40" readonly
									/></td>
							</tr>
							<tr>
								<td>이용등급</td>
								<td><input name="goods_age" value="${goods.goods_age}"
									type="text" size="40" readonly/></td>
							</tr>
							<tr>
								<td>정가</td>
								<td><input name="goods_price" value="${goods.goods_price}"
									type="text" size="40" readonly/></td>
							</tr>
							<tr>
								<td>할인율</td>
								<td><input name="goods_discount"
									value="${goods.goods_discount}" type="text" size="40" /></td>
							</tr>
						</table>
					</div>
					<div class="tab_content" id="tab2">
						<input type="hidden" name="event_no" value="${event.event_no}"/>
						<table>
							<tr>
								<td width=200>이벤트 유형</td>
								<td width=500><select name="event_type"
									onchange="handleEventTypeChange()">
										<c:choose>
											<c:when test="${event.event_type == disc}">
												<option value="disc" selected>예매 할인</option>
												<option value="inv">초대권 증정</option>
											</c:when>
											<c:otherwise>
												<option value="disc">예매 할인</option>
												<option value="inv" selected>초대권 증정</option>
											</c:otherwise>
										</c:choose>
								</select></td>
							</tr>
							<tr>
								<td>이벤트 기간</td>
								<td><input name="event_startDate"
									value="${event.event_startDate}" type="date" size="18" /> ~ <input
									name="event_endDate" value="${event.event_endDate}" type="date"
									size="18" /></td>
							</tr>
							<tr>
								<td>당첨자 발표</td>
								<td><input name="event_finalDate"
									value="${event.event_finalDate}" type="date" size="40" /></td>
							</tr>
							<tr>
								<td>이벤트 제목</td>
								<td><input name="event_name" value="${event.event_name}"
									type="text" size="40" /></td>
							</tr>
							<tr>
								<td>이벤트 내용</td>
								<td><textarea rows="20" cols="80" name="event_detail">${event.event_detail}</textarea></td>
							</tr>
						</table>
					</div>
					<div class="tab_content" id="tab7">
						<form id="FILE_FORM" method="post" enctype="multipart/form-data">
							<c:set var="cnt" value="0"/>
							<table>
								<tr>
									<c:forEach var="item" items="${imageList }"
										varStatus="itemNum">
										<c:set var="cnt" value="${itemNum.count}"/>
										<c:choose>
											<c:when test="${item.fileType=='main_image' }">
												<tr>
													<td>메인 이미지</td>
													<td><input type="file" id="main_image"
														name="main_image"
														onchange="readURL(this,'preview${itemNum.count}');" />
														<input type="text" id="image_id${itemNum.count }"  value="${item.fileName }" disabled  />
														<input type="hidden" name="image_id"
														value="${item.image_id}" /> <br></td>
													<td><img id="preview${itemNum.count }" width=200
														height=200
														src="${contextPath}/event/download.do?event_no=${item.event_no}&event_fileName=${item.fileName}" />
													</td>
													<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td><input type="button" value="수정"
														onClick="modifyImageFile('main_image','${item.event_no}','${item.image_id}','${item.fileType}', '${item.fileName}')" />
													</td>
												</tr>
												<tr>
													<td><br></td>
												</tr>
											</c:when>
											<c:otherwise>
												<tr id="${itemNum.count-1}">
													<td>상세 이미지${itemNum.count-1 }</td>
													<td><input type="file" name="detail_image${itemNum.count-1}"
														id="detail_image${itemNum.count-1}"
														onchange="readURL(this,'preview${itemNum.count}');" /> <input type="text" id="image_id${itemNum.count }"  value="${item.fileName }" disabled  />
														<input type="hidden" name="image_id"
														value="${item.image_id }" /> <br></td>
													<td><img id="preview${itemNum.count }" width=200
														height=200
														src="${contextPath}/event/download.do?event_no=${item.event_no}&event_fileName=${item.fileName}">
													</td>
													<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td><input type="button" value="수정"
														onClick="modifyImageFile('detail_image${itemNum.count-1}','${item.event_no}','${item.image_id}','${item.fileType}')" />
														<input type="button" value="삭제"
														onClick="deleteImageFile('${item.event_no}','${item.image_id}','${item.fileName}','${itemNum.count-1}')" />
													</td>
												</tr>
												<tr>
													<td><br></td>
												</tr>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<script type="text/javascript">
										var cnt = ${cnt};
									</script>
								</tr>
								<tr align="center">
									<td colspan="3">
										<div id="d_file">
											
										</div>
									</td>
								</tr>
								<tr>
									<td align=center colspan=2><input type="button"
										value="이미지파일추가하기" onClick="fn_addFile()" /></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
			<div class="clear"></div>
			<center>
				<table>
					<tr>
						<td align=center><input type="button" value="상품 수정하기"
							onClick="fn_mod_new_event(this.form)"></td>
					</tr>
				</table>
			</center>
		</div>
	</form>
</body>