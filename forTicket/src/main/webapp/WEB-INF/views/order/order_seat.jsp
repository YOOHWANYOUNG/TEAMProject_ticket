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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예매 페이지</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript"
	src="${contextPath}/resources/js/ajaxtabs.js"></script>

<script>
	$(function() {
		$("#datepicker").datepicker();
	});

	$("#datepicker").datepicker(
			{
				dateFormat : 'yy-mm-dd',
				yearSuffix : '년',
				showMonthAfterYear : true,
				changeMonth : true,
				dayNames : [ '월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일' ],
				dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
				monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8',
						'9', '10', '11', '12' ],
				monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
						'9월', '10월', '11월', '12월' ]
			});
</script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/calendar_theme.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/detail.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/user_review.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/common.css">
<style>
.main_tab_wrap {
	/* border: 1px solid #eee; */
	border-top: none;
	padding: 30px 59px;
	border-radius: 10px;
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
	box-shadow: 1px 1px 3px 2px #ddd;
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
	background-image:
		url('./wys2/file_attach_thumb/2021/05/21/1621571534-67-0_wonbon_N_7_600x600_70_2.jpg');
}

.info_detail_gradient {
	width: 100%;
	height: 700px;
	background-image: linear-gradient(to bottom, rgba(255, 255, 255, 0) 40%,
		rgba(255, 255, 255, 0.4) 60%, rgba(255, 255, 255, 0.8) 80%,
		rgb(255, 255, 255) 100%);
}

/* 상세 이미지 스타일   */
.main_img {
	margin-top: 35px;
	width: 700px;
	text-align: center;
}

.main_img img {
	display: block;
	width: 100%;
}

.viewpage_flex {
	display: flex;
	justify-content: flex-start;
}

.viewpage_flex div:nth-child(1) {
	padding-left: 10px;
	width: 120px;
	color: #888;
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
	border-bottom: 1px solid #eee;
	padding-bottom: 8px;
	margin-bottom: 8px;
}

.border_box .viewpage_flex:last-child {
	border: none;
	padding-bottom: 0;
	margin-bottom: 0;
}

.now_engine {
	padding-bottom: 15px;
	font-size: 15px;
	font-weight: 400;
}

.now_engine a {
	color: #555;
}
/* 좌석선택 스타일 */
#body {
	font-family: 'Lato', sans-serif;
	background-color: #ffffff;
	color: #fff;
	box-sizing: border-box;
	border: 1px solid #c5c5c5;
	border-radius: 10px;
}

#container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 450px;
}

.movieContainer {
	margin: 20px 0px;
}

.showcase {
	background-color: #777;
	background: rgba(0, 0, 0, 0.1);
	border-radius: 5px;
	display: flex;
	justify-content: center;
	margin: 16px 0;
	padding: 5px 10px;
}

.movieContainer select {
	margin: 10px;
	padding: 5px 15px 5px 15px;
	border-radius: 7px;
	appearance: none;
	border: 0;
}

.movieContainer select option {
	text-align: left;
}

li {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-left: 10px;
}

.small {
	color: #777;
	margin-left: 2px;
}

.showcase .seat:hover {
	cursor: default;
	scale: 1;
}

.showcase .selectedSeat:hover {
	cursor: default;
	scale: 1;
}

.screen {
	background-color: #fff;
	margin: 15px auto;
	border: 1px solid #ccc;
	padding: 5px;
	width: 140px;
	height: 80px;
	transform: rotateX(-45deg);
	/* box-shadow: 0 3px 10px rgb(255 255 255/ 70%); */
}

.colNum {
	width: 15px;
	height: 12px;
	margin: 3px;
	margin-right: 10px;
	margin-left: 4px;
	display: flex;
	color: black;
	text-align: center;
	margin-bottom: 10px;
}

.colNum:nth-of-type(3) {
	margin-right: 19px;
}

.colNum:nth-of-type(8) {
	margin-left: 19px;
}

.rowNum {
	width: 15px;
	height: 12px;
	margin: 3px;
	display: flex;
	color: black;
}

.seat {
	background-color: #444451;
	width: 15px;
	height: 12px;
	margin: 3px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	cursor: pointer;
}

.availableSeat {
	background-color: #444451;
	width: 15px;
	height: 12px;
	margin: 3px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	cursor: default;
}

.selectedSeatIcon {
	background-color: #ff4b4b;
	width: 15px;
	height: 12px;
	margin: 3px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	cursor: default;
}

.seat:hover {
	scale: 1.2;
}

.selectedSeat:hover {
	scale: 1.2;
}

.seat:nth-of-type(3) {
	margin-right: 18px;
}

.seat:nth-of-type(8) {
	margin-left: 18px;
}

.occupiedSeat:nth-of-type(3) {
	margin-right: 18px;
}

.occupiedSeat:nth-of-type(8) {
	margin-left: 18px;
}

.selectedSeat {
	background-color: #ff4b4b;
	width: 15px;
	height: 12px;
	margin: 3px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	cursor: pointer;
}

.occupiedSeat {
	background-color: #ccc;
	width: 15px;
	height: 12px;
	margin: 3px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}

.row {
	display: flex;
}

.text {
	margin-top: 30px;
	padding: 20px;
	color: black;
}

#count {
	color: #ff4b4b;
}

#costs {
	color: #ff4b4b;
}
</style>

</head>

<body>
	<div style="padding-top: 20px; width: 815px; margin: 0 auto;">
		<!-- 카테고리 -->
		<div class="now_engine" style="margin-right: 680px;">
			🗂️ <a href="#">공연 &gt; </a><a href="#">연극 &gt; </a>
		</div>

		<!-- 왼쪽 -->
		<div
			style="float: left; position: relative; width: 482px; margin-right: 20px; border-radius: 10px;">
			<img src="${contextPath}/resources/images/act1.jpg"
				style="width: 482px; border-radius: 10px;">
			<div class="info_bg_gradient"></div>

			<!-- 좌석지정 -->
			<div id="body">
				<div id="container">
					<p style="font-size: 18px; color: #333333; text-align: center">좌석
						선택</p>
					<ul class="showcase">
						<li>
							<div class="availableSeat"></div> <small class="small">빈
								좌석</small>
						</li>
						<li>
							<div class="selectedSeatIcon"></div> <small class="small">선택
								좌석</small>
						</li>
						<li>
							<div class="occupiedSeat"></div> <small class="small">예매
								불가 좌석</small>
						</li>
					</ul>

					<div class="seatContainer">
						<div class="screen"></div>
						<div class="rowNum">
							<span class="colNum">&nbsp;&nbsp;</span><span class="colNum">A</span><span
								class="colNum">B</span> <span class="colNum">C</span><span
								class="colNum">D</span><span class="colNum">E</span> <span
								class="colNum">F</span><span class="colNum">G</span><span
								class="colNum">H</span>
						</div>
						<div class="row">
							<span class="rowNum">1</span> <span class="seat"><input
								type="hidden" name="seat" value="A-1"></span> <span
								class="seat"><input type="hidden" name="seat" value="B-1"></span>
							<span class="seat"><input type="hidden" name="seat"
								value="C-1"></span> <span class="seat"><input
								type="hidden" name="seat" value="D-1"></span> <span
								class="occupiedSeat"><input type="hidden" name="seat"
								value="E-1"></span> <span class="occupiedSeat"><input
								type="hidden" name="seat" value="F-1"></span> <span
								class="seat"><input type="hidden" name="seat" value="G-1"></span>
							<span class="seat"><input type="hidden" name="seat"
								value="H-1"></span>
						</div>

						<div class="row">
							<span class="rowNum">2</span> <span class="seat"><input
								type="hidden" name="seat" value="A-2"></span> <span
								class="seat"><input type="hidden" name="seat" value="B-2"></span>
							<span class="occupiedSeat"><input type="hidden"
								name="seat" value="C-2"></span> <span class="occupiedSeat"><input
								type="hidden" name="seat" value="D-2"></span> <span
								class="seat"><input type="hidden" name="seat" value="E-2"></span>
							<span class="seat"><input type="hidden" name="seat"
								value="F-2"></span> <span class="seat"><input
								type="hidden" name="seat" value="G-2"></span> <span
								class="seat"><input type="hidden" name="seat" value="H-2"></span>
						</div>

						<div class="row">
							<span class="rowNum">3</span> <span class="seat"><input
								type="hidden" name="seat" value="A-3"></span> <span
								class="seat"><input type="hidden" name="seat" value="B-3"></span>
							<span class="seat"><input type="hidden" name="seat"
								value="C-3"></span> <span class="seat"><input
								type="hidden" name="seat" value="D-3"></span> <span
								class="seat"><input type="hidden" name="seat" value="E-3"></span>
							<span class="occupiedSeat"><input type="hidden"
								name="seat" value="F-3"></span> <span class="occupiedSeat"><input
								type="hidden" name="seat" value="G-3"></span> <span
								class="occupiedSeat"><input type="hidden" name="seat"
								value="H-3"></span>
						</div>

						<div class="row">
							<span class="rowNum">4</span> <span class="seat"><input
								type="hidden" name="seat" value="A-4"></span> <span
								class="seat"><input type="hidden" name="seat" value="B-4"></span>
							<span class="occupiedSeat"><input type="hidden"
								name="seat" value="C-4"></span> <span class="seat"><input
								type="hidden" name="seat" value="D-4"></span> <span
								class="seat"><input type="hidden" name="seat" value="E-4"></span>
							<span class="seat"><input type="hidden" name="seat"
								value="F-4"></span> <span class="seat"><input
								type="hidden" name="seat" value="G-4"></span> <span
								class="seat"><input type="hidden" name="seat" value="H-4"></span>
						</div>

						<div class="row">
							<span class="rowNum">5</span> <span class="seat"><input
								type="hidden" name="seat" value="A-5"></span> <span
								class="seat"><input type="hidden" name="seat" value="B-5"></span>
							<span class="seat"><input type="hidden" name="seat"
								value="C-5"></span> <span class="seat"><input
								type="hidden" name="seat" value="D-5"></span> <span
								class="seat"><input type="hidden" name="seat" value="E-5"></span>
							<span class="occupiedSeat"><input type="hidden"
								name="seat" value="F-5"></span> <span class="seat"><input
								type="hidden" name="seat" value="G-5"></span> <span
								class="seat"><input type="hidden" name="seat" value="H-5"></span>
						</div>

						<div class="row">
							<span class="rowNum">6</span> <span class="seat"><input
								type="hidden" name="seat" value="A-6"></span> <span
								class="seat"><input type="hidden" name="seat" value="B-6"></span>
							<span class="seat"><input type="hidden" name="seat"
								value="C-6"></span> <span class="seat"><input
								type="hidden" name="seat" value="D-6"></span> <span
								class="seat"><input type="hidden" name="seat" value="E-6"></span>
							<span class="seat"><input type="hidden" name="seat"
								value="F-6"></span> <span class="seat"><input
								type="hidden" name="seat" value="G-6"></span> <span
								class="seat"><input type="hidden" name="seat" value="H-6"></span>
						</div>

					</div>
					<p class="text">선택한 좌석 수 : <span id="count">0</span></p>
				</div>
			</div>
		</div>

		<!-- 좌석 스크립트 -->
		<script>
        document.addEventListener('DOMContentLoaded', () =>{

const seatContainer = document.querySelector('.seatContainer');

/* const movie = document.getElementById('movie'); // 선택할 영화 */
const moviePrice = 16800; // 영화가격 

let count = document.querySelector('#count'); // 인원수
let costs = document.querySelector('#costs'); // 가격

// 선택한 좌석수 텍스트 변경해주기
function countSeatPrice(){
    const selectedSeatCount = document.querySelectorAll('.selectedSeat').length;

    count.textContent = selectedSeatCount;
    
    
    costs.textContent = costFormatToWon(selectedSeatCount * moviePrice);
    
}

//원 단위 콤마 찍기
function costFormatToWon(x){
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
//좌석 클릭했을때

seatContainer.addEventListener('click', (e) => {

    if(e.target.className === 'seat'){
        e.target.className = 'selectedSeat';
    } else if(e.target.className === 'selectedSeat'){
        e.target.className = 'seat';
    }

    countSeatPrice();
})

/* // 영화 변경할때

movie.addEventListener('change', (e) => {

    moviePrice = Number(e.target.value);

    countSeatPrice()
    
}) */




})
    </script>

		<!-- 오른쪽 -->
		<section style="float: right; width: 307px;">
			<div id="calendar_popup" class="calendar_popup_02 choice_day"
				style="">
				<div id="datepicker"></div>
				<form method="post" id="regiform" name="regiform" action="#">
					<div class="time_select selectBox" style="display: block;">
						<p class="selectbox_title" style="display: block;">
							시간선택
							<button type="button" class="time_btn" value="14:30">
								<span class="option_title">14:30</span>
							</button>
							<button type="button" class="time_btn active" value="16:45">
								<span class="option_title">16:45</span>
							</button>
							<button type="button" class="time_btn" value="19:00">
								<span class="option_title">19:00</span>
							</button>
						</p>
					</div>
					<div class="title1_select selectBox" style="display: none;">
						<p class="selectbox_title">옵션선택</p>
					</div>
					<div class="title2_select selectBox" style="display: block;">
						<p class="selectbox_title" style="display: block;">
							권종선택
							<button type="button" class="title2_btn btn_number_264681 active"
								name="264681"
								value="{&quot;number&quot;:&quot;264681&quot;,&quot;product_number&quot;:&quot;4343&quot;,&quot;run_date&quot;:&quot;2023-08-24 16:45:00&quot;,&quot;title1&quot;:&quot;★타임세일★&quot;,&quot;title2&quot;:&quot;&quot;,&quot;promo&quot;:&quot;timesale&quot;,&quot;full_price&quot;:&quot;50000&quot;,&quot;sale_price&quot;:&quot;16800&quot;,&quot;jaego&quot;:&quot;2&quot;,&quot;soldout&quot;:&quot;0&quot;,&quot;open_date&quot;:&quot;0000-00-00 00:00:00&quot;,&quot;close_date&quot;:&quot;2023-08-24 16:35:00&quot;,&quot;expire_date&quot;:&quot;0000-00-00 00:00:00&quot;}">
								<span style="color: #ff4b4b;" class="option_title">★타임세일★</span><span
									class="title2_left">남은티켓 2매</span><span style="color: #ff4b4b;"
									class="title2_price">16,800원</span>
							</button>
							<button type="button" class="title2_btn btn_number_257975"
								name="257975"
								value="{&quot;number&quot;:&quot;257975&quot;,&quot;product_number&quot;:&quot;4343&quot;,&quot;run_date&quot;:&quot;2023-08-24 16:45:00&quot;,&quot;title1&quot;:&quot;일반&quot;,&quot;title2&quot;:&quot;&quot;,&quot;promo&quot;:&quot;&quot;,&quot;full_price&quot;:&quot;50000&quot;,&quot;sale_price&quot;:&quot;18900&quot;,&quot;jaego&quot;:&quot;30&quot;,&quot;soldout&quot;:&quot;0&quot;,&quot;open_date&quot;:&quot;0000-00-00 00:00:00&quot;,&quot;close_date&quot;:&quot;2023-08-24 16:35:00&quot;,&quot;expire_date&quot;:&quot;0000-00-00 00:00:00&quot;}">
								<span class="option_title">일반</span><span class="title2_left">남은티켓
									30매</span><span class="title2_price">18,900원</span>
							</button>
						</p>
					</div>
					<div class="choice_select" style="display: block;">
						<p class="title">수량선택</p>
						<div class="select_list">
							<div class="select_item" id="264681">
								<input type="hidden" name="cate_title[]" class="cate_title"
									value="8.24[목] 16:45 ★타임세일★">
								<div class="select_name" style="float: left;">8.24[목]
									16:45&nbsp;★타임세일★&nbsp;</div>
								<div style="float: right; display: inline-block;">
									<a href="#item_close" class="close" data-store="264681"><span
										class="remove_ticket"
										style="font-size: 14px; border: 1px solid #888; border-radius: 5px; width: 16px; padding: 0 6px; color: #fff; background: #888;"
										value="16800">X</span></a>
								</div>
								<div style="clear: both;"></div>
								<div class="price_warp">
									<div class="quantity">
										<button type="button" class="remove_ticket" value="16800">
											<img
												src="${contextPath}/resources/images/btn_minus_square.png"
												style="width: 18px; vertical-align: -3px;">
										</button>
										<span class="selected_quantity">1</span>
										<button type="button" class="add_ticket" value="16800">
											<img
												src="${contextPath}/resources/images/btn_plus_square.png"
												style="width: 18px; vertical-align: -3px;">
										</button>
									</div>
									<p class="price">16,800원</p>
									<input type="hidden" name="product_cate[]" value="264681"><input
										type="hidden" name="product_cate_price[]" class="item_price"
										value="16800"><input type="hidden" name="item_jaego"
										class="item_jaego" value="2"><input type="hidden"
										name="cate_date[]" class="cate_date" value="2023-08-24"><input
										type="hidden" name="want_quantity[]" class="item_ticket"
										value="1">
								</div>
							</div>
						</div>
					</div>
					<div class="total_warp" style="display: flex;">
						<p class="title">총 결제금액</p>
						<p class="total_price"><span id="costs">0</span>원</p>
					</div>
					<div class="submit_btn">
						<button href="#" class="">결제하기</button>
					</div>
				</form>
			</div>
		</section>
		<div style="clear: both;"></div>

		<!-- 후기 -->
		<section style="width: 820px; margin: 0 auto; padding-top: 20px;">
			<div class="review_preview" style="">
				<div class="review_preview_container">
					<div class="review_preview_title_section">
						<div class="review_preview_left">
							<span class="review_preview_title">이용후기</span> <span
								class="review_preview_number">862</span> <span
								class="review_preview_title">평점</span> <span
								class="review_preview_number" style="color: #ff4b4b;">4.8/5</span>
						</div>
						<div class="review_preview_right">
							후기 더보기 <span class="review_preview_right_btn"></span>
						</div>
					</div>
					<div class="review_preview_samples">
						<div class="review_wrap" id="user_review_933478">
							<div class="review_title">
								<div class="review_title_left">
									<div class="review_title_left_stars">
										<div class="review_title_left_star">
											<div class="review_title_left_star_filled"
												style="width: calc(5 * 19px);"></div>
										</div>
									</div>
									<div class="review_title_left_name" style="padding-left: 10px;">
										김*정</div>
								</div>
								<div class="review_title_right" style="padding-right: 8px;">
									2023-08-11</div>
							</div>

							<div class="review_text">
								<div class="review_text_area" id="sample_review_0">
									우리 아이들과 모처럼 관람했는데 요 아이를 선택하기를 넘 잘했어요<br> 잔잔한 웃음과 함께 시원한
									여름을 잘 보내고왔어요
								</div>
								<div class="review_text_seemore" id="sample_seemore_0"
									onclick="showFullReviewForSample(0)" style="display: none;">
									... 더보기</div>
							</div>
						</div>

						<div class="review_wrap" id="user_review_799070">
							<div class="review_title">
								<div class="review_title_left">
									<div class="review_title_left_stars">
										<div class="review_title_left_star">
											<div class="review_title_left_star_filled"
												style="width: calc(5 * 19px);"></div>
										</div>
									</div>
									<div class="review_title_left_name" style="padding-left: 10px;">
										장*정</div>
								</div>
								<div class="review_title_right" style="padding-right: 8px;">
									2023-08-09</div>
							</div>

							<div class="review_text">
								<div class="review_text_area" id="sample_review_1">크
									멀티맨님.....ㅋㅋㅋㅋ 너무 귀여우시고 연기도 잘 하시고 감초같은 매력.. 최고였습니다... 남자친구랑 다 보고
									나와서 한참을 따라했어요..ㅋㅋㅋㅋㅋㅋ 너무너무 재밌었습니다!!!</div>
								<div class="review_text_seemore" id="sample_seemore_1"
									onclick="showFullReviewForSample(1)" style="display: none;">
									... 더보기</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- 상세정보 -->
		<section
			style="width: 820px; margin: 0 auto; padding-top: 20px; border-radius: 10px; border: 1px solid #eee;">
			<div id="ajaxcontentarea" class="contentstyle1">
				<div class="main_tab_wrap">
					<!-- 클래스 안내 배너 -->
					<div
						style="display: none;; width: 700px; height: 95px; margin-bottom: 20px;">
						<img src="img/bnr_class_noti.png"
							style="width: 700px; border-radius: 10px;" alt="예매전 주의사항 - 클래스">
					</div>

					<!-- 예매정보 -->
					<div style="margin-top: 10px;">
						<div class="viewpage_noti">예매정보</div>
						<div class="viewpage_text radius_box">
							<p>· 진행기간: OPEN RUN</p>
							<p>· 이용등급: 만 11세 이상</p>
							<p>· 이용시간: 약 90분</p>
						</div>
					</div>
					<!-- 기획사 공지사항 -->
					<div style="margin-top: 25px;">
						<div class="viewpage_noti">기획사 공지사항</div>
						<div class="viewpage_text radius_box">
							<p>· 공연사 전화문의는 마지막 회차 공연 시작 전까지 가능합니다.</p>
						</div>
					</div>
					<!-- 이용정보 -->
					<div style="margin-top: 25px;">
						<div class="viewpage_noti">이용정보</div>
						<div class="viewpage_text radius_box">
							<p>· 예매가능시간: 공연 시작 10분 전까지</p>
							<p>· 티켓배부: 공연 시작 40분 전부터 공연장 매표소에서 배부</p>
							<p>· 티켓수령: 예매내역 제시 후 현장 수령(신분증/증빙자료 지참)</p>
							<p>· 입장시간: 공연 시작 15분 전부터 입장 가능</p>
							<p>· 좌석배정: 비지정석(타예매처 지정석 제외 후 매표소 선착순 배정)</p>
							<p class="txt_red">※ 각각 예매하더라도 함께 발권하면 연석 배정 가능합니다.</p>
						</div>
					</div>


					<!-- 상세이미지 -->
					<div class="info_detail_poster" alt="상세">
						<div class="info_detail_gradient"></div>
						<div class="info_detail_btn" onclick="showMoreDetailImage()">
							펼쳐보기 <img src="${contextPath}/resources/images/icon_down.png"
								style="width: 13px; vertical-align: 2px; padding-left: 10px;">
						</div>
						<script>
            function showMoreDetailImage() {
              document.querySelector('.info_detail_btn').remove();
              document.querySelector('.info_detail_gradient').remove();
              document.querySelector('.info_detail_poster').setAttribute("style", `display:none;`);
              let xhr = new XMLHttpRequest();
              xhr.open('GET', `./index.php?number=4343&mode=extend_detail_info`, true);
              xhr.send();
              xhr.onload = () => {
                  if (xhr.status === 200) {
                    document.querySelector('.main_img').innerHTML = xhr.response;
                    document.querySelector('.main_img').scrollIntoView({ behavior: 'smooth', block: 'start' });
                  }
                }
              }
          </script>
					</div>
					<div class="main_img"></div>

					<!-- 유의사항 -->
					<div style="margin-top: 25px;">
						<div class="viewpage_noti">유의사항</div>
						<div class="viewpage_text radius_box">
							<p>· 공연 시작 후 발권 또는 입장 불가(지연입장 불가)</p>
							<p>· 지각으로 인해 관람하지 못할 시 환불/변경 불가</p>
							<p>· 지역착오, 연령 미숙지로 관람하지 못할 시 환불/변경 불가</p>
							<p>· 음식물 반입 금지. 공연 중 사진/동영상 촬영 금지</p>
							<p class="txt_red">· 관람 당일은 결제 후 환불/변경 불가하니 신중히 예매하세요.</p>
						</div>
					</div>

					<!-- 장소안내 -->
					<div style="margin-top: 25px;">
						<div class="viewpage_noti">장소안내</div>
						<div class="viewpage_text radius_box"
							style="border-radius: 10px 10px 0 0;">
							<p>· 장소: 해피씨어터&nbsp;/&nbsp;총 200석</p>
							<p>· 주소: 서울 종로구 대학로10길 5 , 지하1층</p>
							<p>· 주차: 주차불가(인근 유료주차장 이용 권장)</p>
						</div>
						<!-- 지도 -->
						<div align="center" style="margin-top: 10px;">
							<div style="z-index: -1;" id="daum_map">
								<div id="map"
									style="height: 350px; border-radius: 0px 0px 10px 10px; position: relative; overflow: hidden; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/bg_tile.png&quot;);">
									<div
										style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; touch-action: none; cursor: url(&quot;https://t1.daumcdn.net/mapjsapi/images/cursor/openhand.cur.ico&quot;) 7 5, url(&quot;https://t1.daumcdn.net/mapjsapi/images/cursor/openhand.cur.ico&quot;), default;">
										<div style="position: absolute;">
											<div
												style="position: absolute; z-index: 0; left: 0px; top: 0px;">
												<img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/2/4011/1796.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 17.5px; top: 190.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/2/4011/1797.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 145.5px; top: 190.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/2/4011/1798.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 273.5px; top: 190.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/2/4011/1799.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 401.5px; top: 190.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/2/4012/1796.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 17.5px; top: 62.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/2/4012/1797.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 145.5px; top: 62.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/2/4012/1798.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 273.5px; top: 62.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/2/4012/1799.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 401.5px; top: 62.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/2/4013/1796.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 17.5px; top: -65.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/2/4013/1797.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 145.5px; top: -65.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/2/4013/1798.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 273.5px; top: -65.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/2/4013/1799.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 401.5px; top: -65.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;">
											</div>
											<div
												style="position: absolute; z-index: 1; left: 0px; top: 0px;">
												<img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/3/2005/897.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -238px; top: 190px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/3/2005/898.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 18px; top: 190px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/3/2005/899.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 274px; top: 190px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/3/2005/900.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 530px; top: 190px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/3/2006/897.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -238px; top: -66px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/3/2006/898.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 18px; top: -66px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/3/2006/899.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 274px; top: -66px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/3/2006/900.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 530px; top: -66px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/3/2007/897.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -238px; top: -322px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/3/2007/898.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 18px; top: -322px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/3/2007/899.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 274px; top: -322px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img
													src="https://map.daumcdn.net/map_k3f_prod/bakery/image_map_png/PNGSD01/v14_hzs4v/3/2007/900.png"
													alt="" role="presentation" draggable="false"
													style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 530px; top: -322px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;">
											</div>
											<div style="position: absolute; z-index: 1;"></div>
											<div
												style="width: 700px; height: 350px; position: absolute; z-index: 1;"></div>
											<div style="position: absolute; z-index: 1;">
												<svg version="1.1"
													style="stroke: none; stroke-dashoffset: 0.5; stroke-linejoin: round; fill: none; transform: translateZ(0px); position: absolute; left: -1400px; top: -700px; width: 3500px; height: 1750px;"
													viewBox="0 0 3500 1750">
													<defs></defs></svg>
											</div>
											<div
												style="position: absolute; z-index: 1; width: 100%; height: 0px; transform: translateZ(0px);">
												<div
													style="position: absolute; margin: -39px 0px 0px -14px; z-index: 0; left: 357px; top: 133px;">
													<img draggable="false"
														src="https://t1.daumcdn.net/mapjsapi/images/marker.png"
														alt="" role="presentation" title=""
														style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 29px, 42px, 0px); top: 0px; left: 0px; width: 29px; height: 42px;"><img
														src="https://t1.daumcdn.net/mapjsapi/images/transparent.gif"
														alt="" role="presentation" draggable="false"
														usemap="#daum.maps.Marker.Area:1"
														style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; width: 29px; height: 42px;">
													<map id="daum.maps.Marker.Area:1"
														name="daum.maps.Marker.Area:1">
														<area href="javascript:void(0)" alt="" role="presentation"
															shape="poly"
															coords="14,39,9,27,4,21,1,16,1,10,4,4,11,0,18,0,25,4,28,10,28,16,25,21,20,27"
															title=""
															style="-webkit-tap-highlight-color: transparent;">
													</map>
												</div>
											</div>
										</div>
									</div>
									<div
										style="position: absolute; cursor: default; z-index: 1; margin: 0px 6px; height: 19px; line-height: 14px; left: 0px; bottom: 0px; color: rgb(0, 0, 0);">
										<div
											style="color: rgb(0, 0, 0); text-align: center; font-size: 10px; float: left;">
											<div
												style="float: left; margin: 2px 3px 0px 4px; height: 6px; transition: width 0.1s ease 0s; border-top: none rgb(0, 0, 0); border-right: 2px solid rgb(0, 0, 0); border-bottom: 2px solid rgb(0, 0, 0); border-left: 2px solid rgb(0, 0, 0); border-image: initial; width: 46px;"></div>
											<div
												style="float: left; margin: 0px 4px 0px 0px; font-family: AppleSDGothicNeo-Regular, 돋움, dotum, sans-serif; font-weight: bold; color: rgb(0, 0, 0);">50m</div>
										</div>
										<div style="margin: 0px 4px; float: left;">
											<a target="_blank" href="http://map.kakao.com/"
												title="Kakao 지도로 보시려면 클릭하세요."
												style="float: left; width: 32px; height: 10px;"><img
												src="https://t1.daumcdn.net/mapjsapi/images/m_bi_b.png"
												alt="Kakao 지도로 이동"
												style="float: left; width: 32px; height: 10px; border: none;"></a>
											<div
												style="font: 11px/11px Arial, Tahoma, Dotum, sans-serif; float: left;"></div>
										</div>
									</div>
									<div
										style="cursor: auto; position: absolute; z-index: 2; left: 0px; top: 0px;">
										<div
											style="width: 32px; border-radius: 3px; box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 2px 0px; position: absolute; left: 665px; top: 3px;">
											<button draggable="false" title="확대" type="button"
												style="float: left; cursor: pointer; width: 32px; height: 32px; user-select: none; -webkit-user-drag: none; border-top: none; border-right: none; border-bottom: 1px solid rgb(226, 226, 226); border-left: none; border-image: initial; background: url(&amp;quot;https://t1.daumcdn.net/mapjsapi/images/control.png&amp;quot;) -40px 0px/116px 264px no-repeat rgb(255, 255, 255); border-radius: 3px 3px 0px 0px;"></button>
											<div
												style="float: left; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/bg_zoom_control.png&quot;) repeat; padding: 7px 0px; transition: height 0s ease 0s, margin 0.1s ease 0s;">
												<div
													style="cursor: pointer; position: relative; background-size: 116px 264px; transition: height 0.1s ease 0s; margin: 2px 0px; display: block; width: 32px; height: 104px;">
													<div
														style="position: absolute; width: 4px; height: 100%; background-color: rgb(51, 150, 255); left: 50%; margin: 0px 0px 0px -2px;">
														<div
															style="width: 4px; height: 2px; margin-bottom: -2px; bottom: 0px; position: absolute; background: url(&amp;quot;https://t1.daumcdn.net/mapjsapi/images/control.png&amp;quot;) -50px -127px/116px 264px;"></div>
														<div
															style="width: 4px; height: 2px; margin-top: -2px; top: 0px; position: absolute; background: url(&amp;quot;https://t1.daumcdn.net/mapjsapi/images/control.png&amp;quot;) -40px -100px/116px 264px;"></div>
													</div>
													<div
														style="position: absolute; background-color: rgb(204, 204, 204); transition: height 0.1s ease 0s; left: 50%; margin: 0px 0px 0px -2px; width: 4px; height: 16px;"></div>
													<div
														style="cursor: row-resize; position: absolute; width: 20px; height: 10px; margin: -4px 0px 0px -10px; background: url(&amp;quot;https://t1.daumcdn.net/mapjsapi/images/control.png&amp;quot;) -40px -80px/116px 264px; left: 50%; transition: top 0.1s ease 0s; top: 16px;"></div>
												</div>
											</div>
											<button draggable="false" title="축소" type="button"
												style="float: left; cursor: pointer; width: 32px; height: 32px; user-select: none; -webkit-user-drag: none; border-top: 1px solid rgb(226, 226, 226); border-right: none; border-bottom: none; border-left: none; border-image: initial; background: url(&amp;quot;https://t1.daumcdn.net/mapjsapi/images/control.png&amp;quot;) -40px -32px/116px 264px no-repeat rgb(255, 255, 255); border-radius: 0px 0px 3px 3px; margin: 0px;"></button>
											<div
												style="display: none; position: absolute; margin: 41px 0px 0px -30px; background-size: 116px 264px; width: 30px; height: 104px;">
												<div
													style="position: absolute; width: 29px; height: 15px; margin: -6px 0px 0px; background: url(&amp;quot;https://t1.daumcdn.net/mapjsapi/images/control.png&amp;quot;) 0px -80px/116px 264px; left: 0px; top: 8px;"></div>
												<div
													style="position: absolute; width: 29px; height: 15px; margin: -6px 0px 0px; background: url(&amp;quot;https://t1.daumcdn.net/mapjsapi/images/control.png&amp;quot;) 0px -100px/116px 264px; left: 0px; top: 32px;"></div>
												<div
													style="position: absolute; width: 29px; height: 15px; margin: -6px 0px 0px; background: url(&amp;quot;https://t1.daumcdn.net/mapjsapi/images/control.png&amp;quot;) 0px -120px/116px 264px; left: 0px; top: 64px;"></div>
												<div
													style="position: absolute; width: 29px; height: 15px; margin: -6px 0px 0px; background: url(&amp;quot;https://t1.daumcdn.net/mapjsapi/images/control.png&amp;quot;) 0px -140px/116px 264px; left: 0px; top: 80px;"></div>
												<div
													style="position: absolute; width: 29px; height: 15px; margin: -6px 0px 0px; background: url(&amp;quot;https://t1.daumcdn.net/mapjsapi/images/control.png&amp;quot;) 0px -160px/116px 264px; left: 0px; top: 96px;"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
</body>

</html>