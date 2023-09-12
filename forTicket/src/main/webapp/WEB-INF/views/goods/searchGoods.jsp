<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("utf-8");
%>
<%
     //치환 변수 선언합니다.
      pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
      pageContext.setAttribute("br", "<br/>"); //br 태그
%> 
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>검색 페이지</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
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
		width: 90%;
		float: left;
	}
	.search-result{
		font-size: 30px;
		text-align: center;
		font-weight: bold;
	}
</style>
</head>

<body>
<section>
	<div class="search-result">
		검색 결과입니다.

	</div>
	<div class="wrap_1100">
	<!-- 상단 -->
	<div class="main_title">
	<!--<c:choose>
		<c:when test="${goods_type == drama}">
			연극 
		</c:when>
		<c:when test="${goods_type == musical}">
			뮤지컬 
		</c:when>
		<c:otherwise>
			공연
		</c:otherwise>
	</c:choose> -->
	<div class="main_title_more">
			<ul class="category_sort">
				<li><a href="#"> 인기순 </a></li>
				<li>|</li>
				<li><a href="#"> 별점순 </a></li>
				<li>|</li>
				<li><a href="#"> 최저가순 </a></li>
				<li>|</li>
				<li><a href="#"> 최고가순 </a></li>
			</ul>
		</div>
		</div><hr>
	<!-- 중단 상품 나열 -->
	<div style="padding-top: 50px;">
	<table style="width: 100%; border: 0; cellpadding: 0; cellspacing: 0;">
	<tbody>
	<tr>
		<c:forEach var="goods" items="${goodsList}">
    <td valign="top" align="left">
        <a href="${contextPath}/goods/detailGoods.do?goods_id=${goods.goods_id}">
            <div class="drama_list">
                <div class="thumb">
                    <img src="${contextPath}/goods/download.do?goods_id=${goods.goods_id}&goods_fileName=${goods.goods_fileName}" alt="${goods.goods_name}">
                    <div></div>
                </div>
                <div class="text">
                    <p style="color:#666666;">🗂️ ${goods.goods_type} &gt; ${goods.goods_genre}</p>
                    <p style="font-size: 20px;">${goods.goods_name}</p>
                    <div>
                        <div class="price">
                            <span><img class="stars" src="${contextPath}/resources/images/ico_star.png" alt="별점">4.8 <span>(120)</span></span>
                            <span style="padding-right:30px;">${goods.goods_price}</span>
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
</section>
</body>
</html>