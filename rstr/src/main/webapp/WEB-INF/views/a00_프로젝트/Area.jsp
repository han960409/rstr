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
<div class="map-container">
    <h2 style="margin-bottom:30px; color:#333;">✔지역을 선택해 주세요.✔</h2>
    
    <svg class="korea-map" viewBox="0 0 440 680" xmlns="http://www.w3.org/2000/svg">

        <a href="${pageContext.request.contextPath}/areaplus" class="region-group">
            <path class="region-path" fill="#E1BEE7" 
                  d="M135,145 L160,120 L190,115 L220,125 L230,165 L220,200 L180,215 L150,225 L120,205 L110,170 Z" />
            <text x="170" y="175" class="region-label">경기/서울</text>
        </a>

        <a href="${pageContext.request.contextPath}" class="region-group">
            <path class="region-path" fill="#B2EBF2" 
                  d="M220,125 L240,60 L290,40 L310,100 L330,180 L280,200 L250,190 L230,165 Z" />
            <text x="270" y="130" class="region-label">강원도</text>
        </a>

        <a href="${pageContext.request.contextPath}" class="region-group">
            <path class="region-path" fill="#DCEDC8" 
                  d="M230,165 L250,190 L280,200 L290,230 L260,260 L230,245 L220,200 Z" />
            <text x="250" y="225" class="region-label">충북</text>
        </a>

        <a href="${pageContext.request.contextPath}" class="region-group">
            <path class="region-path" fill="#FFF9C4" 
                  d="M120,205 L150,225 L180,215 L220,200 L230,245 L210,270 L160,260 L130,230 Z" />
            <text x="175" y="245" class="region-label">충남/대전</text>
        </a>

        <a href="${pageContext.request.contextPath}" class="region-group">
            <path class="region-path" fill="#FFCDD2" 
                  d="M280,200 L330,180 L360,270 L380,300 L330,340 L290,320 L260,260 L290,230 Z" />
            <text x="320" y="260" class="region-label">경북/대구</text>
        </a>

        <a href="${pageContext.request.contextPath}" class="region-group">
            <path class="region-path" fill="#BBDEFB" 
                  d="M160,260 L210,270 L230,245 L260,260 L280,310 L220,340 L150,320 L140,290 Z" />
            <text x="200" y="300" class="region-label">전북/광주</text>
        </a>

        <a href="${pageContext.request.contextPath}" class="region-group">
            <path class="region-path" fill="#F8BBD0" 
                  d="M280,310 L290,320 L330,340 L380,300 L370,390 L310,400 L270,360 Z" />
            <text x="320" y="360" class="region-label">경남/부산/울산</text>
        </a>

        <a href="${pageContext.request.contextPath}" class="region-group">
            <path class="region-path" fill="#FFE0B2" 
                  d="M150,320 L220,340 L280,310 L270,360 L310,400 L250,450 L140,430 L110,380 Z" />
            <text x="200" y="390" class="region-label">전남</text>
        </a>

        <a href="${pageContext.request.contextPath}" class="region-group">
            <path class="region-path" fill="#B2DFDB" 
                  d="M150,540 L230,530 L250,560 L190,580 L140,560 Z" />
            <text x="195" y="560" class="region-label">제주</text>
        </a>

    </svg>
</div>
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

</body>
</html>