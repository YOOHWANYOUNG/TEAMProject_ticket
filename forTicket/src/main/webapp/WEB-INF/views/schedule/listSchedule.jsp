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
	<title>스케줄 관리</title>
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
	<script>
		//버튼으로 조회하기
		function search_member(fixedSearchPeriod){	
			var formObj=document.createElement("form");
			var i_fixedSearch_period = document.createElement("input");
			i_fixedSearch_period.name="fixedSearchPeriod";
			i_fixedSearch_period.value=fixedSearchPeriod;
		    formObj.appendChild(i_fixedSearch_period);
		    document.body.appendChild(formObj); 
			
		    formObj.method="get";
		    formObj.action="${contextPath}/schedule/listSchedule.do";
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
		    formObj.action="${contextPath}/schedule/listSchedule.do";
		    formObj.submit();
		}
		</script>
</head>

<body>
<div>
<form method="post" name="frm_list">
	<div style="margin-bottom:20px;">
    	<h2 style="text-align:left;">스케줄 관리</h2>
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
					<option value="goods_id">상품번호</option>
					<option value="goods_name">상품명</option>
					<option value="theater_name">공연장 이름</option>
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
<input type="button" value="등록하기" style="float: right;" onclick="location.href='${contextPath}/schedule/addScheduleForm.do'"/>
	<table class="result">
		<tr>
			<td>상품 번호</td>
			<td>상품명</td>
			<td>공연일자</td>
			<td>공연시간</td>
			<td>공연장소</td>
			<td>잔여석</td>
			<td>삭제</td>
		</tr>
		<c:choose>
			<c:when test="${not empty scheduleList}">
				<c:forEach var="list" items="${scheduleList}">
					<tr>
						<td><a href="${contextPath}/goods/detailGoods.do?goods_id=${list.goods_id}">${list.goods_id }</a></td>
						<td><a href="${contextPath}/goods/detailGoods.do?goods_id=${list.goods_id}">${list.goods_name }</a></td>
						<td>${list.s_date}</td>
						<td>${list.s_time}</td>
						<td>${list.theater_name}</td>
						<td>${list.seats}</td>
						<td><a href="${contextPath}/schedule/removeSchedule.do?s_no=${list.s_no}" class="reply">삭제</a></td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="9">
					<strong>조회된 스케줄이 없습니다.</strong>
					</td>
				</tr>	
			</c:otherwise>
		</c:choose>
		   <tr>
             <td colspan=8 class="fixed">
		         <div class="page1">
                 <c:if test="${totalScheduleNum != null}">
		         	<c:choose>
		         		<c:when test="${totalScheduleNum>100 }">
			                <c:forEach var="page" begin="1" end="10" step="1" >
						         <c:if test="${section >1 && page==1 }">
						         	<a class="section" href="${contextPath}/schedule/listSchedule.do?section=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp;pre &nbsp;</a>
						         </c:if>
						         	<a class="section" href="${contextPath}/schedule/listSchedule.do?section=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
						         <c:if test="${page ==10 }">
						         	<a class="section" href="${contextPath}/schedule/listSchedule.do?section=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
						         </c:if> 
				      		</c:forEach>
			      	</c:when>
			      	<c:when test="${totalScheduleNum==100 }">
			      		<c:forEach var="page" begin="1" end="10" step="1" >
			      			<a class="section" href="#">${page}</a>
			      		</c:forEach>
			      	</c:when>
			      	<c:when test="${totalScheduleNum<100 }">
			      		<c:forEach var="page" begin="1" end="${totalScheduleNum/10 +1}" step="1">
			      			<c:choose>
			      				<c:when test="${page==pageNum}">
			      					<a class="section_sel" href="${contextPath}/schedule/listSchedule.do?section=${section}&pageNum=${page}">${page}</a>
			      				</c:when>
			      				<c:otherwise>
			      					<a class="section" href="${contextPath}/schedule/listSchedule.do?section=${section}&pageNum=${page}">${page}</a>
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