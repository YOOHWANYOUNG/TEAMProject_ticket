<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스케줄 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/calendar_theme.css">
<style>
 .container {
    display: flex;
    flex-wrap: wrap;
    width: 1100px;
    margin: auto;
    justify-content: space-between;
    align-items: flex-start;
    justify-content: center;
  }

  .row {
    display: flex;
    flex-wrap: nowrap;
    margin-bottom: 10px;
  }
  #frm1 {
  	justify-content: center;
  }
  .item {
    box-sizing: border-box;
    padding: 10px;
    border: 0px solid #ccc;
  }

  .item-28 {
    width: 28%;
  }

  .item-38 {
    width: 38%;
  }

  .item-58 {
    width: 58%;
  }
  /* 선택되지 않은 라벨의 스타일 */
.btn.btn_sm.font-weight-bold.mx-1.my-2 {
    border: none;
    color: none;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
	var selectGoodsCode = "";
	var selectTheaterCode = "";
	var selectScheduleDate = "";
	var selectSeats = "";
	
	/* 상품 코드 클릭 */
	function goodsCodeClick(goodsObj, goods){
		/* 상품 코드 css 변경 */
		$("#goodsList div").removeClass("bg-secondary").css("color","");
		$(goodsObj).addClass("bg-secondary").css("color","white");
		
		/* 선택 내용 출력 */
		$("#scGoodsCode").val(goods);
		selectGoodsCode = goods;
		getScRoomTime();
	}
	
	/* 공연장 코드 클릭 */
	function thCodeClick(thObj, theater){
		/* 공연장 코드 css 변경 */
		$("#thList div").removeClass("bg-secondary").css("color","");
		$(thObj).addClass("bg-secondary").css("color","white");
		
		/* 선택 내용 출력 */
		$("#scThCode").val(theater);
		selectTheaterCode = theater;
		getScRoomTime();
	}
	
	/* 달력 출력
	$(function() {
		$("#datepicker").datepicker();
	});
	$("#datepicker").datepicker({
		dateFormat : 'yy-mm-dd',
		yearSuffix : '년',
		showMonthAfterYear : true,
		changeMonth : true,
		dayNames : [ '월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일' ],
		dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
		monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8',
				'9', '10', '11', '12' ],
		monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
				'9월', '10월', '11월', '12월' ],
		onSelect:function(selDate, inst){
			console.log(selDate);
			
			선택 내용 출력
			$("#scDate").val(selDate);
			selectScheduleDate = selDate;
			getScRoomTime();
		}
	}) */
	
	/* 상영관 출력 */
	function getScRoomTime(){
		if(selectTheaterCode.length>0 && selectGoodsCode.length>0 && selectScheduleDate.length>0){
			var thTimeList = ['10:00', '13:00', '16:00','19:00','22:00'];
			var output = "";
			/* for(var thTime=0; thTime<thTimeList.length; thTime++){
				output += "<input class=\"btn_dNone\""+thTimeList[thTime]+"\" type=\"checkbox\" name=\"scRoomTime\" value=\""+thTimeList[thTime]+"\">";
				output += "<label class=\"btn btn_sm font-weight-bold mx-1 my-2\" for=\""+thTimeList[thTime]+"\" onclick=\"ScRoomTime(this)\">"+thTimeList[thTime]+"</label>";
			} */
			$.ajax({
				type : "get",
				url : "/schedule/getSelectedSchedule.do",
				data : {"theater_id" : selectTheaterCode, "s_date" : selectScheduleDate},
				dataType : "json",
				success : function(result){
						var registTime = [];
				        if (result) { // result가 null 또는 undefined인 경우를 방지하기 위한 조건
				            for (var i = 0; i < result.length; i++) {
				                registTime.push(result[i].s_date);
				            }
				        }
						var registTime = registTime.map(function(item) {
						    return item.split(' ')[1]; // 공백을 기준으로 나눈 두 번째 부분을 추출 (시간 부분)
						});
						console.log("registTime: "+registTime);
						for(var thTime=0; thTime<thTimeList.length; thTime++){
							var currentTime = thTimeList[thTime];
							if(registTime.includes(currentTime)){
								output += "<button disabled class=\"btn btn-sm btn-danger font-weight-bold mx-1 my-2\" for=\"" + thTimeList[thTime] + "\">" + thTimeList[thTime] + "</button>";
							} else {
								output += "<label class=\"btn btn_sm font-weight-bold mx-1 my-2\" for=\""+thTimeList[thTime]+"\" onclick=\"ScRoomTime(this)\" >"+thTimeList[thTime]+"</label>";
								output += "<input class=\"btn-check\" id=\""+thTimeList[thTime]+"\" type=\"checkbox\" name=\"s_time\" value=\""+thTimeList[thTime]+"\">";
							}
						}
					$("#scRoomAndTime").html(output);
				}
			});
		}
	}
	/* label 클릭 css */
	function ScRoomTime(selObj){
		if($(selObj).hasClass("bg-secondary")){
			$(selObj).removeClass("bg-secondary").css("color","");
		} else {
			$(selObj).addClass("bg-secondary").css("color","white");
		}
	}
	/* form 확인 */
	function scFormCheck(){
		selectSeats = document.getElementById("seats").value;
		if(selectGoodsCode.length==0){
			alert("공연이 선택되지 않았습니다.");
			return false;
		}
		if(selectTheaterCode.length==0){
			alert("공연장이 선택되지 않았습니다.");
			return false;
		}
		if(selectScheduleDate.length==0){
			alert("날짜가 선택되지 않았습니다.");
			return false;
		}
		var check = $("input[name=s_time]").is(":checked");
		console.log(check);
		if(!check){
			alert("공연 시간이 선택되지 않았습니다.");
			return false;
		}
		if(selectSeats.length==0){
			alert("좌석 수가 입력되지 않았습니다.");
			return false;
		}
	}
</script>
</head>
<body>
<div class="container">
<form id="frm1" action="${contextPath}/schedule/addSchedule.do" method="get" onsubmit="return scFormCheck()">
	<div class="row">
		<div class="item item-28">
			<div class="card shadow mb-2">
				<div class="card-header py-3" style="text-align: center">
					<h6 class="m-0 font-weight-bold text-primary">상품 선택</h6>
				</div>
				<div class="card-body text-center scrollerline" id="goodsList">
					<c:choose>
						<c:when test="${type=='B'}">
							<c:forEach var="goods" items="${goodsList}">
								<c:choose>
									<c:when test="${goods.mem_id==member.mem_id}">
										<div title="${goods.goods_name}" class="p-3 font-weight0bold text-dark" id="mygoods" onclick="goodsCodeClick(this, '${goods.goods_id}')">${goods.goods_name}</div>
									</c:when>
									<c:otherwise>
										
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach var="goods" items="${goodsList}">
								<div title="${goods.goods_name}" class="p-3 font-weight0bold text-dark" id="mygoods" onclick="goodsCodeClick(this, '${goods.goods_id}')">${goods.goods_name}</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<div class="item item-28">
			<div class="card shadow mb-2">
				<div class="card-header py-3" style="text-align: center">
					<h6 class="m-0 font-weight-bold text-primary">공연장 선택</h6>
				</div>
				<div class="card-body text-center scrollerline" id="thList">
					<c:forEach items="${theaterList}" var="theater">
						<div title="${theater.theater_name}" class="p-3 font-weight0bold text-dark" id="mytheater" onclick="thCodeClick(this, '${theater.theater_id}')">${theater.theater_name}</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div id="calendar_popup" class="item item-38 calendar_popup_02 choice_day">
			<div class="card shadow mb-2">
				<div class="card-header py-3" style="text-align: center">
					<h6 class="m-0 font-weight-bold text-primary">날짜 선택</h6>
				</div>
				<div class="card-body text-center">
					<div id="datepicker" ></div>
					<script type="text/javascript">
						$(function() {
							$("#datepicker").datepicker();
						});
						$("#datepicker").datepicker({
							dateFormat : 'yy-mm-dd',
							yearSuffix : '년',
							showMonthAfterYear : true,
							changeMonth : true,
							dayNames : [ '월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일' ],
							dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
							monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8',
									'9', '10', '11', '12' ],
							monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
									'9월', '10월', '11월', '12월' ],
							onSelect:function(selDate){
								
								$("#scDate").val(selDate);
								selectScheduleDate = selDate;
								getScRoomTime();
							}
						})
					</script>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="item item-58">
			<div class="card shadow mb-2" style="display=inline;">
				<div class="card-header py-3" style="text-align: center">
					<h6 class="m-0 font-weight-bold text-primary">공연 시간</h6>
				</div>
				<div class="card-body text-center" id="scRoomAndTime">
				</div>
			</div>
		</div>
		<div class="item item-38">
			<div class="card shadow mb-2">
				<div class="card-header py-3" style="text-align: center">
					<h6 class="m-0 font-weight-bold text-primary">스케줄 등록</h6>
				</div>
				<div class="card-body text-center" id="goodsList">
					<input type="text" name="goods_id" id="scGoodsCode" placeholder="상품코드">
					<input type="text" name="theater_id" id="scThCode" placeholder="공연장코드">
					<input type="text" name="s_date" id="scDate" placeholder="날짜">
					<input type="text" name="seats" id="seats" placeholder="좌석수">
				</div>
				<button class="btn Secondary btn-user" type="submit">스케줄 등록</button>
			</div>
		</div>
	</div>
</form>
</div>
</body>
</html>