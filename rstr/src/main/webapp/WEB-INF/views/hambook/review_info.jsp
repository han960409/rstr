<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>리뷰 상세 페이지</title>

    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/B_favicon.ico" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	
    <link href="${pageContext.request.contextPath}/css/B_styles.css" rel="stylesheet" />
    
    <style>
        /* 캐러셀 이미지 영역 고정 */
        .carousel-item {
            width: 100%;
            height: 500px;
            background-color: #f8f9fa;
        }

        .carousel-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* 썸네일 스타일 */
        .thumb-img {
            width: 80px;
            height: 60px;
            object-fit: cover;
            cursor: pointer;
            opacity: 0.5;
            transition: all 0.2s ease;
            border: 2px solid transparent;
        }

        .thumb-img:hover {
            opacity: 1;
        }

        /* 활성화된 썸네일 강조 */
        .active-thumb {
            border: 2px solid #0d6efd !important;
            opacity: 1 !important;
            transform: scale(1.05);
        }

        /* 기타 레이아웃 */
        .logo img { width: 180px; height: 50px; object-fit: contain; }
        .nav-menu { display: flex; align-items: center; gap: 2rem; }
    </style>
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <div class="container mt-5">
        <div class="row">
            <div class="col-lg-8">
                <c:forEach var="review" items="${reviews}">
                    <article class="mb-5 border-bottom pb-4">
                        <header class="mb-4">
                            <h2 class="fw-bolder mb-1">${review.title}</h2>
                            <div class="text-muted fst-italic mb-2">작성자: ${review.userId} | 평점: ${review.rating}</div>
                            <a class="badge bg-secondary text-decoration-none link-light" href="#!">태그1</a>
                            <a class="badge bg-secondary text-decoration-none link-light" href="#!">태그2</a>
                        </header>

                        <c:if test="${not empty review.reviewImageList}">
                            <div class="review-carousel-container mb-4">
                                <div id="demo${review.id}" class="carousel slide" data-bs-ride="carousel">
                                    <div class="carousel-inner rounded">
                                        <c:forEach var="img" items="${review.reviewImageList}" varStatus="status">
                                            <div class="carousel-item ${status.first ? 'active' : ''}">
                                                <img src="${pageContext.request.contextPath}${img}" class="d-block w-100" alt="리뷰이미지">
                                            </div>
                                        </c:forEach>
                                    </div>

                                    <button class="carousel-control-prev" type="button" data-bs-target="#demo${review.id}" data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    </button>
                                    <button class="carousel-control-next" type="button" data-bs-target="#demo${review.id}" data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    </button>
                                </div>

                                <div class="thumb-wrapper d-flex justify-content-center mt-3 gap-2">
                                    <c:forEach var="img" items="${review.reviewImageList}" varStatus="status">
                                        <img src="${pageContext.request.contextPath}${img}"
                                             class="img-thumbnail thumb-img ${status.first ? 'active-thumb' : ''}"
                                             data-bs-target="#demo${review.id}"
                                             data-bs-slide-to="${status.index}">
                                    </c:forEach>
                                </div>
                            </div>
                        </c:if>

                        <section class="mb-5">
                            <p class="fs-5 mb-4">${review.body}</p>
                        </section>
                    </article>
                </c:forEach>

                <section class="mb-5">
                    <div class="card bg-light">
                        <div class="card-body">
                            <form class="mb-4"><textarea class="form-control" rows="3" placeholder="로그인 후 댓글 작성이 가능합니다."></textarea></form>
                            <div class="d-flex mb-4">
                                <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                <div class="ms-3">
                                    <div class="fw-bold">닉네임</div>
                                    맛있어 보이네요!
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>

            <div class="col-lg-4">
                <div class="card mb-4">
                    <div class="card-header">검색</div>
                    <div class="card-body">
                        <div class="input-group">
                            <input class="form-control" type="text" placeholder="검색어 입력..." />
                            <button class="btn btn-primary" type="button">Go!</button>
                        </div>
                    </div>
                </div>

                <div class="card mb-4">
                    <div class="card-header">가게 정보</div>
                    <div class="card-body">
                        <ul class="list-unstyled mb-0">
						<li class="fw-bold fs-5">
             		   <a href="${pageContext.request.contextPath}/restaurant/${restaurant.id}" 
            		       style="text-decoration: none; color: inherit;">
            		        ${restaurant.restaurantName}
           			     </a>
         			   </li>
                            <hr>
                            <li>🕕 영업시간 : ${restaurant.operatingHours}</li>
                            <li>🚩 주소 : ${restaurant.address}</li>
                            <li>📞 전화번호 : ${restaurant.phone}</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        // 모든 캐러셀 요소에 대해 이벤트 리스너 등록
        const carousels = document.querySelectorAll('.carousel');
        
        carousels.forEach(carousel => {
            carousel.addEventListener('slid.bs.carousel', function (e) {
                // 1. 현재 캐러셀의 부모 컨테이너 내에서 썸네일들을 찾음
                const container = e.target.closest('.review-carousel-container');
                const thumbs = container.querySelectorAll('.thumb-img');
                
                // 2. 모든 썸네일에서 활성화 클래스 제거
                thumbs.forEach(thumb => thumb.classList.remove('active-thumb'));
                
                // 3. 현재 슬라이드 번호(e.to)에 해당하는 썸네일에 클래스 추가
                if (thumbs[e.to]) {
                    thumbs[e.to].classList.add('active-thumb');
                }
            });
        });

        // 헤더 스크롤 이벤트 (null 체크 추가)
        const header = document.querySelector('header'); // header.jsp 내부 태그에 맞게 수정 필요
        if (header) {
            window.addEventListener('scroll', () => {
                if (window.scrollY > 20) {
                    header.classList.add('scrolled');
                } else {
                    header.classList.remove('scrolled');
                }
            });
        }
    });
    </script>
</body>
</html>