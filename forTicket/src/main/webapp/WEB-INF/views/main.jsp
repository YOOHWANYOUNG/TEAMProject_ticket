<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<style>
	.wrap_1100 {
		margin: auto;
		width: 1100px;
		position: relative;
	}

	.main_title {
		font-size: 25px;
		font-weight: 900;
		text-align: left;
		padding-top: 50px;
		}

	.main_title_more {
		position: absolute;
		right: 0;
		font-size: 15px;
		text-decoration: none;
	}
	
	a, a.underline {
	   color: #000;
	   text-decoration: none;
	}
	
	.list{
		position: relative;
	    width: 255px;
	    margin-right: 26px;
	    margin-bottom: 60px;
	    letter-spacing: -1px;
	    text-align: left;
	    transition: transform 0.3s ease-in-out;
	}
	
	.list .thumb img{
		width: 255px;
	    height: 357px;
	    border-radius: 10px;
	    border: 1px solid #eee;
	}
	
	.list:hover {
		transform: translateY(-5px);
	}
	
	.text{
		margin-top: 10px;
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
</style>
</head>

<body>
	<!-- 메인 롤링배너 영역 시작 -->
	<div id="carouselExample" class="carousel slide" style="width: 1100px; margin: auto;">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="${contextPath}/resources/images/carousel/carousel1.jpg" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="${contextPath}/resources/images/carousel/carousel2.jpg" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="${contextPath}/resources/images/carousel/carousel3.jpg" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="${contextPath}/resources/images/carousel/carousel4.jpg" class="d-block w-100" alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev" style="padding-right: 105px;">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next" style="padding-left: 105px;">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
		</button>
	</div>
	<!-- 메인 상품 노출 -->
	<section>
		<!-- 연극 -->
		<div class="wrap_1100">
			<div class="main_title">
			연극
			<div class="main_title_more">
				<a href="${contextPath}/goods/listGoods.do?goodsType=drama"> 더보기 &gt; </a>
			</div>
			</div>
		<br>
		<div class="wrap_1100">	
			<table style="width: 100%; border: 0; cellpadding: 0; cellspacing: 0;">
			<tbody>
			<c:set  var="goods_count" value="0" />
			<tr>
			<c:forEach var="item" items="${goodsMap.drama }">
				<c:set  var="goods_count" value="${goods_count+1 }" />
				<td valign="top" align="left">
					<a href="${contextPath}/goods/detailGoods.do?goods_id=${item.goods_id}">
						<div class="list">
							<div class="thumb">
								<img src="${contextPath}/goods/thumbnails.do?goods_id=${item.goods_id}&goods_fileName=${item.goods_fileName}" alt="${item.goods_name}">
								<div></div>
							</div>
							<div class="text">
								<p style="color:#666666;">🗂️ 연극 &gt; ${item.goods_genre}</p>
								<p style="font-size: 20px;">${item.goods_name}</p>
							<div>
								<div class="price">
									<span><img class="stars" src="${contextPath}/resources/images/ico_star.png" alt="별점">${item.goods_avg}</span>
									<span style="padding-right:30px;">${item.goods_price}원</span>
								</div>
							</div>
							</div>
						</div>
					</a>
				</td>
			</c:forEach>
			</tr>
			</tbody>
			</table>
		</div>		
		</div>
		
		<!-- 뮤지컬 -->
		<div class="wrap_1100">
			<div class="main_title">
			뮤지컬
			<div class="main_title_more">
				<a href="${contextPath}/goods/listGoods.do?goodsType=musical"> 더보기 &gt; </a>
			</div>
			</div>
		<br>
		<div class="wrap_1100">	
			<table style="width: 100%; border: 0; cellpadding: 0; cellspacing: 0;">
			<tbody>
			<c:set  var="goods_count" value="0" />
			<tr>
			<c:forEach var="item" items="${goodsMap.musical }">
				<c:set  var="goods_count" value="${goods_count+1 }" />
				<td valign="top" align="left">
					<a href="${contextPath}/goods/detailGoods.do?goods_id=${item.goods_id}">
						<div class="list">
							<div class="thumb">
								<img src="${contextPath}/goods/thumbnails.do?goods_id=${item.goods_id}&goods_fileName=${item.goods_fileName}" alt="${item.goods_name}">
								<div></div>
							</div>
							<div class="text">
								<p style="color:#666666;">🗂️ 뮤지컬 &gt; ${item.goods_genre}</p>
								<p style="font-size: 20px;">${item.goods_name}</p>
							<div>
								<div class="price">
									<span><img class="stars" src="${contextPath}/resources/images/ico_star.png" alt="별점">${item.goods_avg}</span>
									<span style="padding-right:30px;">${item.goods_price}원</span>
								</div>
							</div>
							</div>
						</div>
					</a>
				</td>
			</c:forEach>
			</tr>
			</tbody>
			</table>
		</div>		
		</div>
	
		<!-- 공연 -->
		<div class="wrap_1100">
			<div class="main_title">
			공연
			<div class="main_title_more">
				<a href="${contextPath}/goods/listGoods.do?goodsType=concert"> 더보기 &gt; </a>
			</div>
			</div>
		<br>
		<div class="wrap_1100">	
			<table style="width: 100%; border: 0; cellpadding: 0; cellspacing: 0;">
			<tbody>
			<c:set  var="goods_count" value="0" />
			<tr>
			<c:forEach var="item" items="${goodsMap.concert }">
				<c:set  var="goods_count" value="${goods_count+1 }" />
				<td valign="top" align="left">
					<a href="${contextPath}/goods/detailGoods.do?goods_id=${item.goods_id}">
						<div class="list">
							<div class="thumb">
								<img src="${contextPath}/goods/thumbnails.do?goods_id=${item.goods_id}&goods_fileName=${item.goods_fileName}" alt="${item.goods_name}">
								<div></div>
							</div>
							<div class="text">
								<p style="color:#666666;">🗂️ 공연</p>
								<p style="font-size: 20px;">${item.goods_name}</p>
							<div>
								<div class="price">
									<span><img class="stars" src="${contextPath}/resources/images/ico_star.png" alt="별점">${item.goods_avg}</span>
									<span style="padding-right:30px;">${item.goods_price}원</span>
								</div>
							</div>
							</div>
						</div>
					</a>
				</td>
			</c:forEach>
			</tr>
			</tbody>
			</table>
		</div>		
		</div>
</section>
</body>

</html>