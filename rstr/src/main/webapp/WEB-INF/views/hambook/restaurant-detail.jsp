<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>함북스>${rstrName}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
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
        width: 24px;
        height: 24px;
    }

    @media (max-width: 768px) {
        .header-container {
            height: 64px;
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
        body {
            background-color: #FFFFE9;
        }
        .main-image-box {
            background-color: #e9ecef;
            height: 400px;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 1px solid #dee2e6;
            overflow: hidden;
        }
		.main-image-box img {
		    width: 100%;
		    height: 100%;
		    object-fit: contain;
		}
        .thumbnail-box {
            background-color: #e9ecef;
            height: 80px;
            border: 2px solid #dee2e6;
            cursor: pointer;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s;
        }
        .thumbnail-box img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .thumbnail-box:hover {
            border-color: #0d6efd;
            transform: scale(1.05);
        }
        .thumbnail-box.active {
            border-color: #0d6efd;
            border-width: 3px;
        }
        .menu-item {
            background-color: white;
            border: 1px solid #dee2e6;
            padding: 15px;
            margin-bottom: 15px;
            display: flex;
            gap: 15px;
            border-radius: 8px;
            transition: all 0.3s;
        }
        .menu-item:hover {
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        .menu-img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 8px;
            flex-shrink: 0;
        }
        .menu-info {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .menu-name {
            font-size: 1.1rem;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .menu-description {
            color: #6c757d;
            font-size: 0.9rem;
            margin-bottom: 10px;
        }
        .menu-price {
            font-size: 1.1rem;
            font-weight: bold;
            color: #0d6efd;
        }
        .info-box {
            background-color: white;
            border: 1px solid #dee2e6;
            padding: 20px;
            margin-bottom: 15px;
        }
        .tag-box {
            display: inline-block;
            padding: 5px 15px;
            margin: 5px;
            background-color: #e9ecef;
            border-radius: 20px;
        }
        .review-profile-img {
            width: 50px;
            height: 50px;
            border-radius: 4px;
            object-fit: cover;
            border: 2px solid #dee2e6;
            flex-shrink: 0;
        }
        .review-item {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
            padding-bottom: 20px;
            border-bottom: 1px solid #dee2e6;
        }
        .review-content {
            flex: 1;
        }
    </style>
</head>
<body>
<header id="header">
    <div class="header-container">
        <a href="http://localhost:6805/home" class="logo"><img src = "/images/icon/logo.png" width = "180px" height = "50px"></a>
        
        <nav class="nav-menu">
            <a href="http://localhost:6805/home" class="nav-link">
                <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
                </svg>
                <span>Home</span>
            </a>
            <a href="/login" class="nav-link">
                <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                </svg>
                <span>Login</span>
            </a>
        </nav>
    </div>
</header>
    
<div class="container mt-4">
        <h2 class="mb-4">${rstrName}</h2>
        
        <div class="row">
            <div class="col-md-8">
                <div class="main-image-box mb-3" id="mainImage">
                    <c:choose>
                        <c:when test="${not empty images}">
                            <img src="${pageContext.request.contextPath}${images[0].imgUrl}" alt="메인 이미지">
                        </c:when>
                        <c:otherwise>
                            <img src="https://via.placeholder.com/800x400?text=No+Image" alt="이미지 없음">
                        </c:otherwise>
                    </c:choose>
                </div>
                
                <div class="row g-2 mb-4">
                    <c:forEach var="img" items="${images}" varStatus="status">
                        <div class="col-2">
                            <div class="thumbnail-box ${status.first ? 'active' : ''}" onclick="changeImage(this, ${status.index})">
                                <img src="${pageContext.request.contextPath}${img.imgUrl}" alt="썸네일 ${status.count}">
                            </div>
                        </div>
                    </c:forEach>
                </div>
                
 <div class="info-box">
                    <h5 class="mb-4"><img src ="\images\icon\메뉴 아이콘.png" width = "48px", height = "40px"> 메뉴</h5>
                    
                    <c:choose>
                        <c:when test="${not empty menus}">
                            <c:forEach var="m" items="${menus}">
                                <div class="menu-item">
                                    <img src="${pageContext.request.contextPath}${m.profileImgPath}" 
                                         alt="${m.name}" class="menu-img"
                                         onerror="this.src='https://via.placeholder.com/100?text=No+Image'">
                                    
                                    <div class="menu-info">
                                        <div>
                                            <div class="menu-name">${m.name}</div>
                                            <div class="menu-description">${m.description}</div>
                                        </div>
                                        <div class="menu-price">
                                            <fmt:formatNumber value="${m.price}" pattern="#,###" />원
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="text-center py-4 text-muted">등록된 메뉴가 없습니다.</div>
                        </c:otherwise>
                    </c:choose>
                    
                </div>                
                <div class="info-box">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h5>리뷰</h5>
                        <button class="btn btn-outline-primary btn-sm">리뷰 작성</button>
                    </div>
                    
                    <div class="row">
                        <div class="col-6">
                            <label class="form-label">리뷰 정렬</label>
                            <select class="form-select">
                                <option>최신순</option>
                                <option>평점 높은순</option>
                                <option>평점 낮은순</option>
                            </select>
                        </div>
                    </div>
                    
                    <hr class="my-3">
                    
                    <div class="review-item">
                        <div>
                            <img src="https://via.placeholder.com/50/007bff/ffffff?text=U1" alt="프로필" class="review-profile-img">
                        </div>
                        <div class="review-content">
                            <div class="d-flex justify-content-between align-items-start mb-2">
                                <div>
                                    <strong>김민수</strong>
                                    <div class="text-warning">★★★★☆</div>
                                </div>
                                <small class="text-muted">2024.12.15</small>
                            </div>
                            <p class="mb-0">음식이 정말 맛있었어요! 특히 파스타가 일품이었습니다. 다음에 또 방문하고 싶네요.</p>
                        </div>
                    </div>
                    
                    <div class="review-item">
                        <div>
                            <img src="https://via.placeholder.com/50/28a745/ffffff?text=U2" alt="프로필" class="review-profile-img">
                        </div>
                        <div class="review-content">
                            <div class="d-flex justify-content-between align-items-start mb-2">
                                <div>
                                    <strong>이영희</strong>
                                    <div class="text-warning">★★★★★</div>
                                </div>
                                <small class="text-muted">2024.12.14</small>
                            </div>
                            <p class="mb-0">분위기도 좋고 서비스도 훌륭했습니다. 가족 모임하기 좋은 곳이에요.</p>
                        </div>
                    </div>
                    
                    <div class="review-item">
                        <div>
                            <img src="https://via.placeholder.com/50/dc3545/ffffff?text=U3" alt="프로필" class="review-profile-img">
                        </div>
                        <div class="review-content">
                            <div class="d-flex justify-content-between align-items-start mb-2">
                                <div>
                                    <strong>박철수</strong>
                                    <div class="text-warning">★★★★☆</div>
                                </div>
                                <small class="text-muted">2024.12.13</small>
                            </div>
                            <p class="mb-0">가성비가 좋아요. 양도 푸짐하고 맛도 괜찮습니다. 재방문 의사 있어요!</p>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="info-box">
                    <p class="text-muted">
                        ${desc}
                    </p>
                    🏠 ${loc}
                </div>
                
                <div class="info-box">
                    <div class="row text-center">
                        <div class="col-6 border-end">
                            <h6 class="text-muted mb-3">평균 평점 & 리뷰 수</h6>
                            <div class="mb-2">
                                <span class="text-warning fs-4">★</span>
                                <span class="fs-4 fw-bold" id="avgRating">4.5</span>
                                <span class="text-muted">/ 5.0</span>
                            </div>
                            <div class="text-muted">
                                리뷰 <span class="fw-bold text-dark" id="reviewCount">128</span>개
                            </div>
                        </div>
                        <div class="col-6">
                            <h6 class="text-muted mb-3">식당 정보</h6>
                            <div class="small text-start px-3">
                                <div class="mb-2">
                                    <strong>영업시간</strong><br>
                                    <span class="text-muted"> ${open} </span>
                                </div>
                                <div>
                                    <strong>전화번호</strong><br>
                                    <span class="text-muted">${num}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="info-box">
                    <h5 class="mb-3"><img src ="\images\icon\예약 아이콘.png" width = "45px", height = "40px"> 간편 예약</h5>
                    
                    <div class="mb-3">
                        <label class="form-label">방문날짜</label>
                        <input type="date" class="form-control">
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">예약자명</label>
                        <input type="text" class="form-control" placeholder="예약자 성함">
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">인원 수</label>
                        <select class="form-select">
                            <option>인원수를 선택하세요</option>
                            <option>1명</option>
                            <option>2명</option>
                            <option>3명</option>
                            <option>4명</option>
                            <option>5명 이상</option>
                        </select>
                    </div>
                    
                    <button class="btn btn-primary w-100">예약하기</button>
                </div>
            </div>
        </div>
    </div>
    
	<footer class="py-5 bg-dark">
	    <div class="container">
	        <p class="m-0 text-center text-white">
	            Copyright &copy; HamBooks 2025
	        </p>
	    </div>
	</footer>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    const images = [
        <c:forEach var="img" items="${images}" varStatus="status">
            '${pageContext.request.contextPath}${img.imgUrl}'${!status.last ? ',' : ''}
        </c:forEach>
    ];
    
    // 썸네일 클릭 시 실행되는 함수
    function changeImage(element, index) {
        const mainImage = document.querySelector('#mainImage img');
        
        // 클릭한 인덱스에 해당하는 이미지 주소로 메인 이미지 소스 변경
        mainImage.src = images[index];
        
        // 모든 썸네일에서 active 클래스 제거 (파란 테두리 제거)
        document.querySelectorAll('.thumbnail-box').forEach(thumb => {
            thumb.classList.remove('active');
        });
        
        // 클릭한 썸네일에만 active 클래스 추가 (파란 테두리 추가)
        element.classList.add('active');
    }
        // 평균 평점 및 리뷰 수 계산 함수 (예시)
        function updateReviewStats() {
            // 실제로는 서버에서 데이터를 받아와야 합니다
            const reviews = [
                { rating: 4 },
                { rating: 5 },
                { rating: 4 }
            ];
            
            // 평균 평점 계산
            const avgRating = reviews.reduce((sum, review) => sum + review.rating, 0) / reviews.length;
            document.getElementById('avgRating').textContent = avgRating.toFixed(1);
            
            // 리뷰 수
            document.getElementById('reviewCount').textContent = reviews.length;
        }
        const header = document.getElementById('header');
        window.addEventListener('scroll', () => {
            if (window.scrollY > 20) {
                header.classList.add('scrolled');
            } else {
                header.classList.remove('scrolled');
            }
        });
        
        // 페이지 로드 시 실행
        // updateReviewStats();
    </script>
</body>
</html>