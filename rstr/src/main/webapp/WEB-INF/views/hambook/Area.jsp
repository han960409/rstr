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
    left: 0;
    right: 0;
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
    width: 20px;
    height: 20px;
}

/* 드롭다운 스타일 */
.dropdown {
    position: relative;
}

.dropdown-toggle {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    color: #374151;
    text-decoration: none;
    font-weight: 500;
    cursor: pointer;
    background: none;
    border: none;
    padding: 0;
    transition: color 0.2s ease;
}

.dropdown-toggle:hover {
    color: #f97316;
}

.dropdown-toggle svg {
    width: 20px;
    height: 20px;
}

.dropdown-menu {
    position: absolute;
    top: 100%;
    right: 0;
    margin-top: 0.5rem;
    background: white;
    border-radius: 8px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
    min-width: 200px;
    display: none;
    overflow: hidden;
    z-index: 9999;
}

.dropdown.active .dropdown-menu {
    display: block;
}

.dropdown-item {
    display: flex;
    align-items: center;
    gap: 0.75rem;
    padding: 0.875rem 1.25rem;
    color: #374151;
    text-decoration: none;
    transition: all 0.2s ease;
    border-bottom: 1px solid #f3f4f6;
}

.dropdown-item:last-child {
    border-bottom: none;
}

.dropdown-item:hover {
    background: #fff5f0;
    color: #f97316;
}

.dropdown-item svg {
    width: 18px;
    height: 18px;
}

.dropdown-item.logout {
    color: #dc2626;
}

.dropdown-item.logout:hover {
    background: #fef2f2;
    color: #dc2626;
}

@media (max-width: 768px) {
    .header-container {
        height: 64px;
    }
    .nav-menu {
        gap: 1rem;
    }
    .nav-link, .dropdown-toggle {
        gap: 0.25rem;
        font-size: 0.875rem;
    }
    .nav-link svg, .dropdown-toggle svg {
        width: 18px;
        height: 18px;
    }
    .dropdown-menu {
        min-width: 180px;
    }
    .dropdown-item {
        padding: 0.75rem 1rem;
        font-size: 0.875rem;
    }
}
.btn-custom {
    background-color: #f97316; 
    color: white;             
    border: none;             
}

.btn-custom:hover {
    background-color: #e65c00; 
    color: white;
}
</style>
</head>
<body>
<header id="header">
    <div class="header-container">
        <a href="http://localhost:6805/home" class="logo">
            <img src="/images/icon/logo.png" width="180px" height="50px" alt="함북스 로고">
        </a>

        <nav class="nav-menu">
            <a href="http://localhost:6805/home" class="nav-link">
                <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
                </svg>
                <span>Home</span>
            </a>

            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    <div class="dropdown" id="mypageDropdown">
                        <button class="dropdown-toggle" onclick="toggleDropdown()">
                            <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                            </svg>
                            <span>마이페이지</span>
                            <svg fill="none" stroke="currentColor" viewBox="0 0 24 24" style="width: 16px; height: 16px;">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
                            </svg>
                        </button>

                        <div class="dropdown-menu">
                            <c:choose>
                                <c:when test="${sessionScope.user.role == 'USER'}">
                                    <!-- 일반 사용자 메뉴 -->
                                    <a href="/mypage/profile" class="dropdown-item">
                                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z" />
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                        </svg>
                                        <span>회원정보 수정</span>
                                    </a>
                                    
                                    <a href="/mypage/reservations" class="dropdown-item">
                                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                                        </svg>
                                        <span>나의 예약</span>
                                    </a>
                                    
                                    <a href="/mypage/reviews" class="dropdown-item">
                                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11.049 2.927c.3-.921 1.603-.921 1.902 0l1.519 4.674a1 1 0 00.95.69h4.915c.969 0 1.371 1.24.588 1.81l-3.976 2.888a1 1 0 00-.363 1.118l1.518 4.674c.3.922-.755 1.688-1.538 1.118l-3.976-2.888a1 1 0 00-1.176 0l-3.976 2.888c-.783.57-1.838-.197-1.538-1.118l1.518-4.674a1 1 0 00-.363-1.118l-3.976-2.888c-.784-.57-.38-1.81.588-1.81h4.914a1 1 0 00.951-.69l1.519-4.674z" />
                                        </svg>
                                        <span>내가 쓴 리뷰 관리</span>
                                    </a>
                                    
                                    <a href="/mypage/favorites" class="dropdown-item">
                                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                                        </svg>
                                        <span>찜목록</span>
                                    </a>
                                    
                                    <a href="/mypage/inquiry" class="dropdown-item">
                                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                                        </svg>
                                        <span>1:1 문의</span>
                                    </a>
                                </c:when>
                                
                                <c:when test="${sessionScope.user.role == 'OWNER'}">
                                    <!-- 점주 메뉴 -->
                                    <a href="/restaurant/new" class="dropdown-item">
                                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
                                        </svg>
                                        <span>매장등록</span>
                                    </a>
                                    
                                    <a href="/mypage/profile" class="dropdown-item">
                                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z" />
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                        </svg>
                                        <span>회원정보 수정</span>
                                    </a>
                                    
                                    <a href="/mypage/reservations" class="dropdown-item">
                                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                                        </svg>
                                        <span>나의 예약</span>
                                    </a>
                                    
                                    <a href="/mypage/inquiry" class="dropdown-item">
                                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                                        </svg>
                                        <span>1:1 문의</span>
                                    </a>
                                </c:when>
                            </c:choose>
                            
                            <!-- 로그아웃 (공통) -->
                            <a href="http://localhost:6805/logout" class="dropdown-item logout" onclick="return confirmLogout()">
                                <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1" />
                                </svg>
                                <span>로그아웃</span>
                            </a>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <a href="http://localhost:6805/login" class="nav-link">
                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 16l-4-4m0 0l4-4m-4 4h14m-5 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h7a3 3 0 013 3v1" />
                        </svg>
                        <span>로그인</span>
                    </a>
                </c:otherwise>
            </c:choose>
        </nav>
    </div>
</header>
<br>
<h2 style="text-align:center;">현재 지역의 맛집🍖🍖<h2>
<!-- 모든 가게 보기 버튼 -->
<div style="text-align:center; margin-top:20px;">
<a href="${pageContext.request.contextPath}/list" 
   class="btn btn-custom btn-lg">
   모든 가게 보기
</a>
</div>
<div id="map" style="width:70%; height:600px;  margin:50px auto; border:5px solid black; align-items:center;"></div>
<!-- Footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

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
        	location.href = "${pageContext.request.contextPath}/restaurant/" + r.id;
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

// 드롭다운 토글 함수
function toggleDropdown() {
    const dropdown = document.getElementById('mypageDropdown');
    dropdown.classList.toggle('active');
}

// 드롭다운 외부 클릭 시 닫기
document.addEventListener('click', function(event) {
    const dropdown = document.getElementById('mypageDropdown');
    if (dropdown && !dropdown.contains(event.target)) {
        dropdown.classList.remove('active');
    }
});

// 로그아웃 확인
function confirmLogout() {
    return confirm('로그아웃 하시겠습니까?');
}
</script>
<!-- 지도 생성 스크립트 -->

</body>



</html>