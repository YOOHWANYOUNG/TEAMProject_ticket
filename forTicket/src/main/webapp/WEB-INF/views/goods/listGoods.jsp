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
<title>상품 페이지</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
	.wrap_1100 {
		margin: auto;
		width: 1100px;
		position: relative;
	}
	li.prod, a.prod {
		width: 270px;
	}
	.main_title {
		font-size: 25px;
		font-weight: 900;
		text-align: left;
		padding-top: 50px;
	}
	
	.main_title_more {
		right: 0;
		font-size: 15px;	
		text-decoration: none;
	}
	.main_title_more ul {
		float: right;
	}
	.category_sort{
		font-size: 16px;
	}
	
	.category_sort li{
		display: inline-block;
    	padding-left: 10px;
	}

	a, a.underline {
	   color: #000;
	   text-decoration: none;
		}
	
	.drama_list{
		position: relative;
	    width: 255px;
	    margin-right: 26px;
	    margin-bottom: 60px;
	    letter-spacing: -1px;
	    text-align: left;
	    transition: transform 0.3s ease-in-out;
	}

	.drama_list .thumb img{
		width: 255px;
	    height: 357px;
	    border-radius: 10px;
	    border: 1px solid #eee;
	}
	
	.drama_list:hover {
		transform: translateY(-5px);
	}

	.price {
	    display: flex;
	    justify-content: space-between;
	    margin-top: 15px;
	    font-size: 18px;
	    color: #000;
	    font-weight: 600;
	    text-align: left;
	}
	
	.stars{
		width: 20px;
	}
	hr {
		width: 100%;
		float: left;
	}
</style>
</head>

<body>
<section>
	<div class="wrap_1100">
	<!-- 상단 -->
	<div class="main_title">
	<c:choose>
		<c:when test="${goodsType == 'drama'}">
			연극
		</c:when>
		<c:when test="${goodsType == 'musical'}">
			뮤지컬
		</c:when>
		<c:otherwise>
			공연
		</c:otherwise>
	</c:choose>
	</div><hr>
	<div class="main_title_more">
			<ul class="category_sort">
				<li><a href="#" id="sortDate"> 최신순 </a></li>
				<li>|</li>
				<li><a href="#" id="sortStar"> 별점순 </a></li>
				<li>|</li>
				<li><a href="#" id="sortCheaper"> 최저가순 </a></li>
				<li>|</li>
				<li><a href="#" id="sortExpensive"> 최고가순 </a></li>
			</ul>
		</div>
	<!-- 중단 상품 나열 -->
	<div style="padding-top: 50px;">
	<c:choose>
		<c:when test="${empty goodsList}">
			<strong>등록된 상품이 없습니다.</strong>
		</c:when>
		<c:otherwise>
			<ul id="sortedList">
				<c:forEach var="goods" items="${goodsList}">
					<c:if test="${goods.goods_type == goodsType}">
						<li class="prod" data-goods_creDate="${goods.goods_creDate}" data-goods_avg="${goods.goods_avg}" data-goods_price="${goods.goods_price}">
							<a class="prod" href="${contextPath}/goods/detailGoods.do?goods_id=${goods.goods_id}">
								<div class="drama_list">
									<div class="thumb">
										<img src="${contextPath}/goods/thumbnails.do?goods_id=${goods.goods_id}&goods_fileName=${goods.goods_fileName}" alt="${goods.goods_name}">
										<div></div>
									</div>
									<div class="text">
										<p style="color:#666666;">🗂️
										<c:choose>
											<c:when test="${goods.goods_type == 'drama'}">
												연극
											</c:when>
											<c:when test="${goods.goods_type=='musical'}">
												뮤지컬
											</c:when>
											<c:otherwise>
												공연
											</c:otherwise>
										</c:choose> &gt; ${goods.goods_genre}</p>
										<p style="font-size: 20px;">${goods.goods_name}</p>
										<div>
											<div class="price">
												<span>
													<img class="stars" src="${contextPath}/resources/images/ico_star.png" alt="별점">
													${goods.goods_avg}
												</span>
												<span style="padding-right:30px;">${goods.goods_price} 원</span>
											</div>
										</div>
									</div>
								</div>
							</a>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</c:otherwise>
	</c:choose>
</div>
</section>
	<script type="text/javascript">
        $(document).ready(function() {
            // 기본 정렬 기준 (최신순)
            var currentSortKey = "goods_creDate";

            // 정렬 버튼 클릭 이벤트 처리
            $("#sortDate").click(function() {
                sortGoodsList("goods_creDate");
            });

            $("#sortStar").click(function() {
                sortGoodsList("goods_avg");
            });

            $("#sortCheaper").click(function() {
                sortGoodsList("goods_price");
            });

            $("#sortExpensive").click(function() {
                sortGoodsList("goods_price", true); // 내림차순 정렬
            });

            // 상품 목록을 정렬하는 함수
            function sortGoodsList(sortKey, reverse) {
                // 목록을 복제하여 정렬할 복제 배열 생성
                var clonedList = $("#sortedList li").clone();

                // 정렬 기준에 따라 배열 정렬
                clonedList.sort(function(a, b) {
                    var aValue = $(a).data(sortKey);
                    var bValue = $(b).data(sortKey);
                    console.log(aValue);
                    console.log(bValue);
                    return reverse ? bValue - aValue : aValue - bValue;
                });

                // 정렬된 목록을 출력하는 부분 업데이트
                $("#sortedList").empty().append(clonedList);
            }
        });
    </script>
</body>
</html>