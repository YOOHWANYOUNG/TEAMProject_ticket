<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="goods" value="${goodsMap.goodsVO}"/>
<%
request.setCharacterEncoding("utf-8");
%>
<% int goods_id = Integer.parseInt(request.getParameter("goods_id")); %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript"
	src="${contextPath}/resources/js/ajaxtabs.js">
</script>
<script>
    var goods_price = ${goods.goods_price};
    console.log(goods_price);
</script>
<script type="text/javascript">
var selectedTime = "";
var totalQuantity = 0;
var totalPrice = 0;

function getScRoomTime(){
	var output = "";
	var goods_id = <%= goods_id %>;
	var selectedDate = $("#scDate").val();
	var date;
	var hours;
	var minutes;
	var formattedTime;
	if(orderDate.length>0){
		$.ajax({
			type : "get",
			url : "/order/getSelectedSchedule.do",
			data : {
					"goods_id" : goods_id,
					"s_date" : orderDate,
					"goods_name": "${goods.goods_name}",
		            "goods_place": "${goods.goods_place}"
					},
			dataType : "json",
			async : false,
			success : function(result){
					for(var i=0; i<result.length; i++){
						date = new Date(result[i].s_date);
						hours = date.getHours();
						minutes = date.getMinutes();
						formattedTime = (hours < 10 ? "0" : "") + hours + ":" + (minutes < 10 ? "0" : "") + minutes;
						output += "<label class=\"btn btn_sm font-weight-bold mx-1 my-2\" for=\"" + result[i].s_no + "\" onclick=\"ScRoomTime(this)\" data-sno=\"" + result[i].s_no + "\">" + formattedTime + "</label>";
						output += "<input class=\"btn-check\" id=\"" + result[i].s_no + "\" type=\"radio\" name=\"s_time\" value=\"" + formattedTime + "\" data-sno=\"" + result[i].s_no + "\">";
					}
					$("#scRoomAndTime").html(output);
			}
		});
	}
}

function ScRoomTime(selObj){
    var selectedTime = $("input[name=s_time]:checked").val();
    var output = "";

    // 이전에 선택한 시간의 스타일 초기화
    $("#scRoomAndTime label").removeClass("bg-secondary").css("color","");
    
    if($(selObj).hasClass("bg-secondary")){
        // 이미 선택된 시간을 클릭한 경우, 선택 해제
        $(selObj).removeClass("bg-secondary").css("color","");
        selectedTime = undefined;
        output = "";
    } else {
        // 새로운 시간 선택한 경우
        $(selObj).addClass("bg-secondary").css("color","white");
        var formattedTime = selectedTime;

        // 선택한 시간에 맞는 HTML 요소 생성
        output += '<div class="select_item" id="264681">';
        output += '<div class="select_name" style="float: left;">' + formattedTime + '</div>';
        output += '<div style="float: right; display: inline-block;">';
        output += '<a href="#item_close" class="close" data-store="264681">';
        output += '<span class="remove_ticket" style="font-size: 14px; border: 1px solid #888; border-radius: 5px; width: 16px; padding: 0 6px; color: #fff; background: #888;" value="16800">X</span></a></div>';
        output += '<div style="clear: both;"></div>';
        output += '<div class="price_warp">';
        output += '<div class="quantity">';
        output += '<button type="button" class="remove_ticket" value="16800">';
        output += '<img src="${contextPath}/resources/images/btn_minus_square.png" style="width: 18px; vertical-align: -3px;"></button>';
        output += '<span class="selected_quantity">1</span>';
        output += '<button type="button" class="add_ticket" value="16800">';
        output += '<img src="${contextPath}/resources/images/btn_plus_square.png" style="width: 18px; vertical-align: -3px;"></button>';
        output += '</div>';
        output += '<p class="price">${goods.goods_price}</p>'; 
        output += '</div></div>';
    }
    
    // 선택한 시간의 HTML 요소 업데이트
    $(".select_item").remove(); // 기존 요소 삭제
    $(".select_list").append(output); // 새로운 요소 추가
 	// 총 결제금액 업데이트
    updateTotalPrice();
    
}

//수량조절
$(document).ready(function() {
    // "X" 버튼 클릭 시 해당 select_item 제거
    $(document).on("click", ".close .remove_ticket", function() {
        var selectItem = $(this).closest(".select_item"); // 가장 가까운 .select_item 찾기
        selectItem.remove(); // 해당 .select_item 제거

     	// 총 결제금액 업데이트
        updateTotalPrice();
    });

    // 빼기 버튼 클릭 시 수량 감소
    $(document).on("click", ".remove_ticket", function() {
        var quantitySpan = $(this).siblings(".selected_quantity"); // 해당 버튼 옆의 수량 표시
        var currentQuantity = parseInt(quantitySpan.text()); // 현재 수량 가져오기
        if (currentQuantity > 1) { // 최소 수량 제한
            currentQuantity--;
            quantitySpan.text(currentQuantity); // 수량 감소 후 업데이트
        }

     	// 총 결제금액 업데이트
        updateTotalPrice();
    });

    // 더하기 버튼 클릭 시 수량 증가
    $(document).on("click", ".add_ticket", function() {
        var quantitySpan = $(this).siblings(".selected_quantity"); // 해당 버튼 옆의 수량 표시
        var currentQuantity = parseInt(quantitySpan.text()); // 현재 수량 가져오기
        currentQuantity++;
        quantitySpan.text(currentQuantity); // 수량 증가 후 업데이트

     	// 총 결제금액 업데이트
        updateTotalPrice();
    });
});

function updateTotalPrice() {
    var totalQuantity = 0;
    var totalPrice;
    
    $(".select_item").each(function() {
        var quantity = parseInt($(this).find(".selected_quantity").text());
        totalQuantity += quantity;
    });

    totalPrice = totalQuantity * parseInt(goods_price);
    $(".total_price").text(totalPrice.toLocaleString() + '원');
    
}

function fn_order_each_goods(goods_id, goods_name,goods_place){
	//debugger;
	
	var _isLogOn=document.getElementById("isLogOn");
	var isLogOn=_isLogOn.value;
	
	if(isLogOn=="false" || isLogOn=='' ){
		alert("로그인 후 주문이 가능합니다!!!");
	} 
	
	// getScRoomTime 함수에서 가져온 selectedTime 값을 사용
    var goods_Time = $("input[name=s_time]:checked").val();
	
    // ScRoomTime 함수에서 계산한 totalQuantity 값 사용
    var totalQuantity = 0;
    $(".select_item").each(function() {
        var quantity = parseInt($(this).find(".selected_quantity").text());
        totalQuantity += quantity;
    });
    
    // updateTotalPrice 함수에서 계산한 totalPrice 값을 사용
    var totalPrice = totalQuantity * parseInt(goods_price);
    
    var s_no = $("input[name=s_time]:checked").data("sno"); // 선택한 시간의 s_no 값을 가져옴

    
    var formObj=document.createElement("form");
		
	var i_goods_id = document.createElement("input"); 
    var i_goods_name = document.createElement("input");
    var i_goods_place = document.createElement("input");
    var i_goods_Time = document.createElement("input");
    var i_totalQuantity = document.createElement("input");
    var i_goods_price = document.createElement("input");
    var i_totalPrice = document.createElement("input");
    var i_orderDate = document.createElement("input");
    var i_s_no = document.createElement("input");
    
    
    i_goods_id.name="goods_id";
    i_goods_name.name="goods_name";
    i_goods_place.name="goods_place";
    i_goods_Time.name = "goods_Time"; // 선택한 시간 값 추가
    i_totalQuantity.name = "totalQuantity"; // 총 수량 값 추가
    i_goods_price.name = "goods_price"; // 가격 값 추가
    i_totalPrice.name = "totalPrice"; // 총 가격 값 추가
    i_orderDate.name = "orderDate"; // 선택한 일자 값 추가
    i_s_no.name = "s_no";
    
    
    i_goods_id.value=goods_id;
    i_goods_name.value=goods_name;
    i_goods_place.value=goods_place;
    i_goods_Time.value = goods_Time; // 선택한 시간 값 설정
    i_totalQuantity.value = totalQuantity; // 총 수량 값 설정
    i_goods_price.value = goods_price; // 총 가격 값 설정
    i_totalPrice.value = totalPrice; // 총 가격 값 설정
    i_orderDate.value = orderDate; // 선택한 일자 값 설정
    i_s_no.value = s_no;
    
    
    formObj.appendChild(i_goods_id);
    formObj.appendChild(i_goods_name);
    formObj.appendChild(i_goods_place);
    formObj.appendChild(i_goods_Time);
    formObj.appendChild(i_totalQuantity);
    formObj.appendChild(i_goods_price);
    formObj.appendChild(i_totalPrice);
    formObj.appendChild(i_orderDate);
    formObj.appendChild(i_s_no);

    
    document.body.appendChild(formObj); 
    formObj.method="post";
    formObj.action="${contextPath}/order/ticketReservation.do";
    formObj.submit();
	}	
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/jquery-ui.css">
<link rel="stylesheet" type="text/css"	href="${contextPath}/resources/css/calendar_theme.css">
<link rel="stylesheet" type="text/css"	href="${contextPath}/resources/css/detail.css">
<link rel="stylesheet" type="text/css"	href="${contextPath}/resources/css/user_review.css">
<link rel="stylesheet" type="text/css"	href="${contextPath}/resources/css/common.css">
<style>
  .main_tab_wrap {
    /* border: 1px solid #eee; */
    border-top: none;
    padding: 30px 59px;
    border-radius:10px;
  }

  /* 상세 이미지 펼쳐보기 */
  .info_detail_btn {
    position: absolute;
    bottom: 15px;
    width: 94%;
    height: 55px;
    line-height: 55px;
    margin-left: 3%;
    border: 1px solid #ccc;
    border-radius: 10px;
    background: #fff;
    color: #000;
    font-size: 20px;
    font-weight: 600;
    text-align: center;
    box-shadow:1px 1px 3px 2px #ddd;
  }
  .info_detail_poster {
    position: relative;
    margin-top: 35px;
    width: 100%;
    height: 700px;
    color: #fff;
    font-size: 20px;
    background-size: 100%;
    background-repeat: no-repeat;
    background-position-y: 0%;
    background-image: url('./wys2/file_attach_thumb/2021/05/21/1621571534-67-0_wonbon_N_7_600x600_70_2.jpg');
  }
  .info_detail_gradient {
    width: 100%;
    height: 700px;
    background-image: linear-gradient(to bottom,
    rgba(255, 255, 255, 0) 40%,
    rgba(255, 255, 255, 0.4) 60%,
    rgba(255, 255, 255, 0.8) 80%,
    rgb(255, 255, 255) 100%);
  }

  /* 상세 이미지 스타일   */
  .main_img { margin-top:35px; width:700px; text-align: center; }
  .main_img img { display:block; width:100%; }

  .viewpage_flex {
  display: flex; justify-content: flex-start;
  }
  .viewpage_flex div:nth-child(1) {
    padding-left:10px; width: 120px; color: #888;
  }
  .viewpage_flex div:nth-child(2) {
    color: #000;
  }
  .viewpage_flex a {
    text-decoration: underline;
  }
  .border_box {
	  border: 1px solid #eee;
	  padding: 10px 20px;
	  border-radius: 10px;
  margin-top: 5px;
  }
  .border_box .viewpage_flex {
    border-bottom: 1px solid #eee; padding-bottom: 8px; margin-bottom: 8px;
  }
  .border_box .viewpage_flex:last-child {
    border: none; padding-bottom: 0; margin-bottom: 0;
  }

  .now_engine { padding-bottom:15px; font-size:15px; font-weight:400; }
  .now_engine a { color:#555; }

</style>

</head>

<body>
	<div style="padding-top: 20px; width: 815px; margin: 0 auto;">
		<div class="now_engine" style="float: left;">
			🗂️ <a href="#">
			<c:choose>
				<c:when test="${goods.goods_type == 'drama'}">
					연극
				</c:when>
				<c:when test="${goods.goods_type == 'musical'}">
					뮤지컬
				</c:when>
				<c:otherwise>
					공연
				</c:otherwise>
			</c:choose>
			 &gt; </a><a href="#">${goods.goods_genre} &gt; </a>
		</div>
		<div style="clear: both;"></div>
		<div
			style="float: left; position: relative; width: 482px; margin-right: 20px; border-radius: 10px;">
			<img src="${contextPath}/goods/download.do?goods_id=${goods.goods_id}&goods_fileName=${goods.goods_fileName}"
				style="width: 482px; border-radius: 10px;">

		</div>

		<!-- 주문정보 입력 -->
		<section style="float: right; width: 307px;">
			<!-- 달력 날짜선택 -->
			<div id="calendar_popup" class="calendar_popup_02 choice_day"
				style="">
				<div id="datepicker"></div>
				<script type="text/javascript">
						/* 상영관 출력 */
						var orderDate = "";
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
								console.log(selDate);
								$("#scDate").val(selDate);
								orderDate = selDate;
								getScRoomTime();
							}
						})
				</script>
				<input type="hidden" id="goods_id" value="${goods.goods_id}">
				<!-- 시간,수량선택 -->
				<form method="post" id="regiform" name="regiform" action="#">
					<input type="hidden" name="s_date" id="scDate" value=""/>
					<div class="time_select selectBox" style="display: block;">
						<p class="selectbox_title" style="display: block;">
							시간선택
						</p>
							<div id="scRoomAndTime">
							
							</div>
					</div>
					<div class="choice_select" style="display: block;">
						<p class="title">수량선택</p>
						<div class="select_list">
						</div>
						<div class="total_warp" style="display: flex;">
							<p class="title">총 결제금액</p>
							<p class="total_price"></p>
						</div>
						<div class="submit_btn">
						<a href="javascript:fn_order_each_goods('${goods.goods_id }','${goods.goods_name }','${goods.goods_place}');">결제하기</a>
						</div>
					</div>
				</form>
			</div>
		</section>
</body>
</html>
<input type="hidden" name="isLogOn" id="isLogOn" value="${isLogOn}"/>