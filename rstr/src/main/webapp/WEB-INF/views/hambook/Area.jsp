<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>맛집 예약</title>

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon"
          href="${pageContext.request.contextPath}/assets/H_favicon.ico" />

    <!-- Bootstrap CSS (★ 필수 ★) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- Bootstrap icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
          rel="stylesheet" />

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/css/H_styles.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/bootstrap.min_styles.css" rel="stylesheet" />
<meta charset="UTF-8">
<style>
#map {
    width: 100%;
    height: 400px;
    min-height: 400px;
}
    .map-container {
        width: 100%;
        max-width: 550px;
        margin: 40px auto;
        text-align: center;
        font-family: 'Pretendard', 'Malgun Gothic', sans-serif;
    }

    .korea-map {
        width: 100%;
        height: auto;
        overflow: visible;
        /* 전체 지도에 살짝 입체감 */
        filter: drop-shadow(2px 4px 6px rgba(0,0,0,0.15));
    }

    .region-group {
        cursor: pointer;
        transition: all 0.3s cubic-bezier(0.25, 0.46, 0.45, 0.94);
    }

    .region-path {
        stroke: #ffffff;      /* 경계선을 흰색으로 해서 깔끔하게 */
        stroke-width: 1.5px;  /* 적당한 두께 */
        stroke-linejoin: round;
        stroke-linecap: round;
        opacity: 1;
    }

    .region-label {
        font-size: 13px;
        font-weight: 700;
        fill: #444;
        text-anchor: middle;
        pointer-events: none;
        text-shadow: 0px 0px 4px rgba(255,255,255,0.8);
    }

    /* Hover 효과: 빈틈없이 떠오르기 */
    .region-group:hover {
        transform: scale(1.03) translateY(-5px); /* 살짝 커지며 위로 */
        filter: drop-shadow(0 10px 15px rgba(0,0,0,0.25)); /* 그림자 강조 */
        z-index: 100;
    }
    
    /* 호버시 색상 약간 진하게 */
    .region-group:hover .region-path {
        filter: brightness(0.97);
    }
    a{
    text-decoration: none;
    }
</style>
</head>
<body>
<header>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand"
           href="${pageContext.request.contextPath}/home">
           <img src="${pageContext.request.contextPath}/resources/images/hambooks.png"
   	 		 width="180px" height="60px">
        </a>

        <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active"
                       href="${pageContext.request.contextPath}/home">Home</a>
                </li>

                                <li class="nav-item">
                    <a class="nav-link"
                       href="${pageContext.request.contextPath}/">로그인</a>
                </li>
            </ul>
        </div>
     </div>
</nav>
</header>
<br>
<h2 style="text-align:center;">현재 지역의 맛집🍖🍖<h2>
<div id="map" style="width:70%; height:600px;  margin:50px auto; border:5px solid black; align-items:center;"></div>
<!-- Footer -->
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">
            Copyright &copy; HamBooks 2025
        </p>
    </div>
</footer>

<!-- Bootstrap core JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Core theme JS -->
<script src="${pageContext.request.contextPath}/js/H_scripts.js"></script>

<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=1cb3f6f3ef7608356132050b83e29124&autoload=false"></script>
<!-- 카카오 지도 SDK (먼저!) -->
<script>
const restaurants = [
<c:forEach var="r" items="${restaurants}" varStatus="status">
{
    id: ${r.id},
    name: "${r.restaurantName}",
    lat: ${r.latitude},
    lng: ${r.longitude}
} <c:if test="${!status.last}">,</c:if>
</c:forEach>
];

kakao.maps.load(function() {
    const mapContainer = document.getElementById('map');
    const mapOption = {
        center: new kakao.maps.LatLng(37.2750, 127.0160), // 초기 중심
        level: 3
    };
    const map = new kakao.maps.Map(mapContainer, mapOption);

    // 여러 마커 생성
    restaurants.forEach(r => {
        const marker = new kakao.maps.Marker({
            map: map,
            position: new kakao.maps.LatLng(r.lat, r.lng),
            title: r.name
        });

        // 마커 클릭 → 상세 페이지 이동
        kakao.maps.event.addListener(marker, 'click', () => {
        	location.href = "${pageContext.request.contextPath}/restaurant/detail?id=" + r.id;
        });
    });
});
</script>
<!-- 지도 생성 스크립트 -->

</body>



</html>