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
        header {
        position: sticky;
        top: 0;
        z-index: 1000;
        background: rgba(255, 255, 255, 0.8);
        backdrop-filter: blur(8px);
        transition: all 0.3s ease;
    }

    header.scrolled {
        background: rgba(255, 255, 255, 0.95);
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .header-container {
        max-width: 1280px;
        margin: 0 auto;
        padding: 0 1.5rem;
        display: flex;
        align-items: center;
        justify-content: space-between;
        height: 80px;
    }

    .logo {
        display: flex;
        align-items: center;
        text-decoration: none;
    }

    .logo img {
        width: 180px;
        height: 50px;
        object-fit: contain;
    }

    .nav-menu {
        display: flex;
        align-items: center;
        gap: 2rem;
    }

    .nav-link {
        display: flex;
        align-items: center;
        gap: 0.5rem;
        color: #374151;
        text-decoration: none;
        font-weight: 500;
        transition: color 0.2s ease;
    }

    .nav-link:hover {
        color: #f97316;
    }

    .nav-link svg {
        width: 24px;
        height: 24px;
    }

    @media (max-width: 768px) {
        .header-container {
            height: 64px;
        }
        .logo img {
            width: 140px;
            height: 40px;
        }
        .nav-menu {
            gap: 1rem;
        }
        .nav-link {
            gap: 0.25rem;
            font-size: 0.875rem;
        }
        .nav-link svg {
            width: 20px;
            height: 20px;
        }
    }
</style>
</head>
<body>
<header id="header">
    <div class="header-container">
        <a href="http://localhost:6805/home" class="logo">
            <img src="/images/icon/logo.png" width="180px" height="50px">
        </a>
        
        <nav class="nav-menu">
            <a href="http://localhost:6805/home" class="nav-link">
                <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
                </svg>
                <span>Home</span>
            </a>
            <a href="http://localhost:6805/login" class="nav-link">
                <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                </svg>
                <span>Login</span>
            </a>
        </nav>
    </div>
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
const header = document.getElementById('header');
window.addEventListener('scroll', () => {
    if (window.scrollY > 20) {
        header.classList.add('scrolled');
    } else {
        header.classList.remove('scrolled');
    }
});
</script>
<!-- 지도 생성 스크립트 -->

</body>



</html>