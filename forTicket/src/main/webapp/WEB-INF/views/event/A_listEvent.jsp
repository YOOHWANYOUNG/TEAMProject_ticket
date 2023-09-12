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
	<title>관리자 이벤트 관리</title>
	<style>
	body {
		width: 1100px;
		margin: auto;
		
	}
	.search{
		width: 100%;
		border: 1px solid #FF6251;
		border-collapse: collapse;
		border-style: hidden;
        box-shadow: 0 0 0 2px #FF6251;
        border-spacing: 0;
        border-radius: 15px;
	}
	
	tr,td{
		border-bottom: 2px solid #FF6251;
		font-size: 15px;
	}
	
	.inputSize{
		border: 1px solid #696969;
        height: 20px;
        border-radius: 10px;
	}
	
	.inputSize1{
		width:180px;
		border: 1px solid #696969;
        height: 20px;
        border-radius: 10px;
	}
	
	.clear {
		clear: both;
		height: 50px;
	}
	
	.result{
		width: 100%;
		border: 1px solid #FF6251;
		border-collapse: collapse;
		border-style: hidden;
        box-shadow: 0 0 0 2px #FF6251;
        border-spacing: 0;
        border-radius: 15px;
	}
	
	.reply{
		text-decoration: none;
		color: #FF6251;
	}
	
	.mypage4{
		border:3px solid #d2d2d2;
		border-radius: 15px;
		padding:10px 15px;
		font-size:15px;
		line-height:280%;
		border-color: #FF6251;
		padding-bottom: 50px;
	}
	
	.alink{
		text-decoration: none;
	}
	
	.optionsize{
		border: 1px solid #696969;
        height: 20px;
        border-radius: 10px;   
        text-align: center;     
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
	</style>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	function fn_modify_event(event_no, selectId){
		var value=document.getElementById(selectId).value;

		$.ajax({
			type : "post",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/event/modEventStatus.do",
			data : {
				event_no:event_no,
				attribute:"event_status",
				value:value
			},
			success : function(data, textStatus) {
				if(data.trim()=='mod_success'){
					alert("등록 상태를 수정했습니다.");
				}else if(data.trim()=='failed'){
					alert("다시 시도해 주세요.");	
				}
				
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
				
			}
		}); //end ajax	
	}	
	//버튼으로 조회하기
	function search_member(fixedSearchPeriod){	
		var formObj=document.createElement("form");
		var i_fixedSearch_period = document.createElement("input");
		i_fixedSearch_period.name="fixedSearchPeriod";
		i_fixedSearch_period.value=fixedSearchPeriod;
	    formObj.appendChild(i_fixedSearch_period);
	    document.body.appendChild(formObj); 
		
	    formObj.method="get";
	    formObj.action="${contextPath}/event/A_listEvent.do";
	    formObj.submit();
	}
					
	//상세 조회
	function fn_detail_search(){
		var frm_list = document.frm_list;
		
		beginYear = frm_list.beginYear.value; 
		beginMonth = frm_list.beginMonth.value;
		beginDay = frm_list.beginDay.value;
		endYear = frm_list.endYear.value;
		endMonth = frm_list.endMonth.value;
		endDay = frm_list.endDay.value;
		search_type = frm_list.s_search_type.value;
		search_word = frm_list.t_search_word.value;
	
		var formObj = document.createElement("form");
		var i_command = document.createElement("input");
		var i_beginDate = document.createElement("input"); 
		var i_endDate = document.createElement("input");
		var i_search_type = document.createElement("input");
		var i_search_word = document.createElement("input");
	    
		
	    i_command.name = "command";
	    i_beginDate.name = "beginDate";
	    i_endDate.name = "endDate";
	    i_search_type.name = "search_type";
	    i_search_word.name = "search_word";
	    
	    i_command.value = "fn_detail_search";
		i_beginDate.value=beginYear+"-"+beginMonth+"-"+beginDay;
	    i_endDate.value=endYear+"-"+endMonth+"-"+endDay;
	    i_search_type.value=search_type;
	    i_search_word.value=search_word;
		
	    formObj.appendChild(i_command);
	    formObj.appendChild(i_beginDate);
	    formObj.appendChild(i_endDate);
	    formObj.appendChild(i_search_type);
	    formObj.appendChild(i_search_word);
	    document.body.appendChild(formObj); 
	    formObj.method="get";
	    formObj.action="${contextPath}/event/A_listEvent.do";
	    formObj.submit();
	}
		</script>
</head>

<body>
<div>
<form method="post" name="frm_list">
	<div style="margin-bottom:20px;">
    	<h2 style="text-align:left;">이벤트 관리</h2>
        <div style="width: auto; border: 1px solid; border-color: #FF6251; margin-top: 10px; margin-bottom:10px;"></div>
        	<div style="border-color: #FF6251; width:auto;"></div>
    </div>
	<table class="search">
		<tr>
			<td colspan=4 align=right>
				<a class="alink" href="javascript:search_member('today')">
				   <img   src="${contextPath}/resources/images/button/btn_search_one_day.jpg">
				</a>
				<a class="alink" href="javascript:search_member('one_week')">
				   <img   src="${contextPath}/resources/images/button/btn_search_1_week.jpg">
				</a>
				<a class="alink" href="javascript:search_member('two_week')">
				   <img   src="${contextPath}/resources/images/button/btn_search_2_week.jpg">
				</a>
				<a class="alink" href="javascript:search_member('one_month')">
				   <img   src="${contextPath}/resources/images/button/btn_search_1_month.jpg">
				</a>
				<a class="alink" href="javascript:search_member('two_month')">
				   <img   src="${contextPath}/resources/images/button/btn_search_2_month.jpg">
				</a>
				<a class="alink" href="javascript:search_member('three_month')">
				   <img   src="${contextPath}/resources/images/button/btn_search_3_month.jpg">
				</a>
				<a class="alink" href="javascript:search_member('four_month')">
				   <img   src="${contextPath}/resources/images/button/btn_search_4_month.jpg">
				</a>
				&nbsp;까지 조회
			</td>
		</tr>

		<tr>			
			<td>조회기간</td>
			<td colspan=3 align=left>
				<select name="beginYear" class="optionsize" >
					<c:forEach   var="i" begin="0" end="5">
						<c:choose>
					    	<c:when test="${beginYear==beginYear-i }">
					        	<option value="${beginYear-i }" selected>${beginYear-i  }</option>
					        </c:when>
					        <c:otherwise>
					        	<option value="${beginYear-i }">${beginYear-i }</option>
					        </c:otherwise>
					     </c:choose>
					</c:forEach>
				</select>년 
				<select name="beginMonth" class="optionsize">
					<c:forEach   var="i" begin="1" end="12">
						<c:choose>
					    	<c:when test="${beginMonth==i }">
					        	<option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					        	<c:choose>
					            	<c:when test="${i <10 }">
					              		<option value="0${i }">0${i }</option>
					            	</c:when>
					            	<c:otherwise>
					            		<option value="${i }">${i }</option>
					            	</c:otherwise>
					          	</c:choose>
					        </c:otherwise>
						</c:choose>
					 </c:forEach>					
				</select>월
				<select name="beginDay" class="optionsize">
					<c:forEach   var="i" begin="1" end="31">
						<c:choose>
					    	<c:when test="${beginDay==i }">
					        	<option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					        	<c:choose>
					            	<c:when test="${i <10 }">
					              		<option value="0${i }">0${i }</option>
					            	</c:when>
					            <c:otherwise>
					            	<option value="${i }">${i }</option>
					            </c:otherwise>
					        	</c:choose>
					    	</c:otherwise>
						</c:choose>
					</c:forEach>	
				</select>일  &nbsp; ~ &nbsp;
				<select name="endYear" class="optionsize">
					<c:forEach   var="i" begin="0" end="5">
						<c:choose>
					    	<c:when test="${endYear==endYear-i }">
					        	<option value="${endYear-i }" selected>${endYear-i  }</option>
					        </c:when>
					        <c:otherwise>
					        	<option value="${endYear-i }">${endYear-i }</option>
					        </c:otherwise>
					    </c:choose>
					 </c:forEach>
				</select>년 
				<select name="endMonth" class="optionsize">
					<c:forEach   var="i" begin="1" end="12">
						<c:choose>
					    	<c:when test="${endMonth==i }">
					        	<option value="${i }"  selected>${i }</option>
					        </c:when>
					    <c:otherwise>
					    <c:choose>
					      	<c:when test="${i <10 }">
					        	<option value="0${i }">0${i }</option>
					        </c:when>
					    	<c:otherwise>
					        	<option value="${i }">${i }</option>
					        </c:otherwise>
					     </c:choose>
					     </c:otherwise>
					   	 </c:choose>
					</c:forEach>					
				</select>월
				<select name="endDay" class="optionsize">
					<c:forEach   var="i" begin="1" end="31">
				    	<c:choose>
				        	<c:when test="${endDay==i }">
				          		<option value="${i }"  selected>${i }</option>
				        	</c:when>
				        	<c:otherwise>
				          	<c:choose>
				            	<c:when test="${i<10}">
				            		<option value="0${i}">0${i }</option>
				            	</c:when>
				            	<c:otherwise>
				            		<option value="${i}">${i }</option>
				            	</c:otherwise>
				          	</c:choose>
				        	</c:otherwise>
				      	</c:choose>
				    </c:forEach>	
				</select>
			</td>
		</tr>
		<tr>
			<td>
				<select class="optionsize" name="s_search_type">
					<option value="all" checked>전체</option>
					<option value="goods_name">상품명</option>
					<option value="event_name">이벤트 제목</option>
					<option value="event_type">이벤트 유형</option>
				</select>
			</td>
			<td align="left"><input class="inputSize1" type="text" name="t_search_word"></td>
			<td align="right">
			<input type="button" name="btn_search" onClick="fn_detail_search()" value="검색">
			<input type="submit" value="초기화">
		</td>
		</tr>
	</table>

<div class="clear"></div>

	<table class="result">
		<tr>
			<td>이벤트 번호</td>
			<td>상품명</td>
			<td>이벤트 유형</td>
			<td>이벤트 제목</td>
			<td>이벤트 기간</td>
			<td>등록일</td>
			<td>등록 상태</td>
			<td>반영</td>
			<td>삭제</td>
		</tr>
		<c:choose>
			<c:when test="${empty eventList}">
				<tr>
					<td colspan="9">
					<strong>조회된 이벤트 상품이 없습니다.</strong>
					</td>		
			</c:when>
			<c:otherwise>
				<c:forEach var="list" items="${eventList}" varStatus="index">
					<tr>
						<td><a href="${contextPath}/event/detailEvent.do?event_no=${list.event_no}">${list.event_no }</a></td>
						<td><a href="${contextPath}/goods/detailGoods?goods_id=${list.goods_id}">${list.goods_name }</a></td>
						<td>${list.event_type }</td>
						<td>${list.event_name }</td>
						<td>${list.event_startDate}~${list.event_endDate}</td>
						<td>${list.event_creDate}</td>
						<td>
							<select name="event_status" id="event_status_${index.index}">
								<c:choose>
									<c:when test="${list.event_status=='진행중'}">
										<option value="등록대기">등록대기</option>
										<option value="진행중" selected>진행중</option>
										<option value="종료">종료</option>
									</c:when>
									<c:when test="${list.event_status=='종료'}">
										<option value="등록대기">등록대기</option>
										<option value="진행중">진행중</option>
										<option value="종료" selected>종료</option>
									</c:when>
									<c:otherwise>
										<option value="등록대기" selected>등록대기</option>
										<option value="진행중">진행중</option>
										<option value="종료">종료</option>
									</c:otherwise>
								</c:choose>
							</select>
						</td>
						<td><a href="javascript:void(0);" onClick="fn_modify_event('${list.event_no }','event_status_${index.index}');" class="reply">반영</a></td>
						<td><a href="${contextPath }/event/removeEvent.do?event_no=${list.event_no }" class="reply">삭제</a></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		  <tr>
             <td colspan=8 class="fixed">
             <div class="page1">
                 <c:if test="${totalEventNum != null}">
		         	<c:choose>
		         		<c:when test="${totalEventNum>100 }">
			                <c:forEach var="page" begin="1" end="10" step="1" >
						         <c:if test="${section >1 && page==1 }">
						         	<a class="section" href="${contextPath}/event/A_listEvent.do?section=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp;pre &nbsp;</a>
						         </c:if>
						         	<a class="section" href="${contextPath}/event/A_listEvent.do?section=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
						         <c:if test="${page ==10 }">
						         	<a class="section" href="${contextPath}/event/A_listEvent.do?section=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
						         </c:if> 
				      		</c:forEach>
			      	</c:when>
			      	<c:when test="${totalEventNum==100 }">
			      		<c:forEach var="page" begin="1" end="10" step="1" >
			      			<a class="section" href="#">${page}</a>
			      		</c:forEach>
			      	</c:when>
			      	<c:when test="${totalEventNum<100 }">
			      		<c:forEach var="page" begin="1" end="${totalEventNum/10 +1}" step="1">
			      			<c:choose>
			      				<c:when test="${page==pageNum}">
			      					<a class="section_sel" href="${contextPath}/event/A_listEvent.do?section=${section}&pageNum=${page}">${page}</a>
			      				</c:when>
			      				<c:otherwise>
			      					<a class="section" href="${contextPath}/event/A_listEvent.do?section=${section}&pageNum=${page}">${page}</a>
			      				</c:otherwise>
			      			</c:choose>
			      		</c:forEach>
			      	</c:when>
			      	</c:choose>
	      		</c:if>
	      	</div>
           </td>
        </tr>
	</table>
</form>
</div>
</body>
</html>