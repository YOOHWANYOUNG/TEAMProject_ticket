<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연장 목록</title>
<style>
	a,
	a.underline {
	  color: #000;
	  text-decoration: none;
	}
	
	a.underline:hover {
	  text-decoration: underline;
	}
	table {
	  border-collapse: collapse;
	}
	object {
	  display: block;
	}
	.wrap_1100 {
	  margin: auto;
	  width: 1100px;
	  position: relative;
	}
	img {
	  border: none;
	  padding: 0;
	  margin: 0;
	}
	.clear {
	  clear: both;
	}
	.theater_list {
	  position: relative;
	  width: 255px;
	  margin-right: 26px;
	  margin-bottom: 60px;
	  letter-spacing: -1px;
	  text-align: left;
	  transition: transform 0.3s ease-in-out;
	}
	.theater_list:hover {
	  transform: translateY(-5px);
	}
	.theater_list .thumb img {
	  width: 255px;
	  height: 357px;
	  border-radius: 10px;
	  border: 1px solid #eee;
	}
	.theater_list .theater_info {
	  width: 95%;
	  padding: 0 5px;
	  letter-spacing: -0.5px;
	}
	.ticket_list .ticket_info .area {
	  display: inline-block;
	  margin-top: 15px;
	  padding: 5px 10px;
	  font-size: 14px;
	  color: #333;
	  background: #eee;
	  border-radius: 10px;
	}
	.theater_list .theater_info .category {
	  display: block;
	  margin-top: 10px;
	  color: #999;
	  font-size: 14px;
	}
	.theater_list .theater_info .title {
	  margin-top: 10px;
	  font-size: 18px;
	  color: #000;
	  font-weight: 400;
	  display: block;
	  overflow: hidden;
	  white-space: nowrap;
	  text-overflow: ellipsis;
	  word-break: break-all;
	}
	.theater_list .theater_info .price {
	  display: flex;
	  justify-content: space-between;
	  margin-top: 15px;
	  font-size: 18px;
	  color: #000;
	  font-weight: 600;
	  text-align: left;
	}
</style>
<script>  
const publicDataApiUrl = 'https://api.odcloud.kr/api/15062225/v1/uddi:ebf72314-2e68-4f0f-9f2c-f3d65e38d7e3?page=1&perPage=10&serviceKey=5sLUhVVcsVMjF0nhrzssoDK5SJiA2OZOUoow5tLn0R38pBwS%2F0Nwe58BS1t5tDA5IaX1z6eGPmM9dNkffelahA%3D%3D';
const kakaoApiUrl = 'https://dapi.kakao.com/v2/local/search/address.json';
const kakaoApiKey = '1ae58be67c0483d9685d6fb00bbf2f2b'; // 본인의 카카오 API 키로 변경

// 주소를 좌표로 변환하는 함수
function convertAddressToCoordinates(address) {
  const query = encodeURIComponent(address);
  const kakaoApiRequestUrl = `${kakaoApiUrl}?query=${query}`;
  
  return fetch(kakaoApiRequestUrl, {
    headers: {
      Authorization: `KakaoAK ${kakaoApiKey}`
    }
  })
  .then(response => response.json());
}

// 공공데이터 API 호출
fetch(publicDataApiUrl)
  .then(result => result.json())
  .then(json => {
    const data = json.data;

    // 각 공연장의 주소를 기반으로 위도와 경도를 검색
    data.forEach(async theater => {
      const address = theater['소재지 도로명주소'];

      try {
        // 카카오 API 호출을 통해 주소를 좌표로 변환
        const kakaoJson = await convertAddressToCoordinates(address);
        const coordinates = kakaoJson.documents[0].address;
        const latitude = coordinates.y;
        const longitude = coordinates.x;

        // 위도와 경도 값 출력
        console.log(`공연장: ${theater['공연장명']}`);
        console.log(`주소: ${address}`);
        console.log(`위도: ${latitude}`);
        console.log(`경도: ${longitude}`);
        console.log('---');
      } catch (error) {
        console.error('카카오 API 호출 에러:', error);
      }
    });
  })
  .catch(error => {
    console.error('공공데이터 API 호출 에러:', error);
  });
</script>
</head>
<body>
<div class="wrap_1100">
<div>
	<p >공연장 목록</p>
</div>
<div style="margin-top: 25px;">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<c:forEach var="theater" items="${theatersList}">
			<td valign="top" align="left">
				<a href="${contextPath}/theater/detailTheater.do?theater_id=${theater.theater_id}">
					<div class="theater_list">
						<div class="thumb">
							<img src="${contextPath}/theater/download.do?theater_id=${theater.theater_id}&theater_image=${theater.theater_image}" alt="${theater.theater_name}">
						</div>
						<div class="theater_info">
							<p class="category">${theater.theater_cat}</p>
							<p class="title">${theater.theater_name}</p>
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
</body>
</html>