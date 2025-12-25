<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>리뷰 상세 페이지</title>

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon"
          href="${pageContext.request.contextPath}/assets/B_favicon.ico" />

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          rel="stylesheet">
	
    <!-- Core theme CSS -->
    <link href="${pageContext.request.contextPath}/css/B_styles.css" rel="stylesheet" />
    
</head>
<style>
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
.thumb-img {
    width: 80px;
    height: 60px;
    object-fit: cover;
    cursor: pointer;
    opacity: 0.6;
}

.thumb-img:hover {
    opacity: 1;
}

.active-thumb {
    border: 2px solid #0d6efd;
    opacity: 1;
}
</style>
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
    <body>
        <!-- Responsive navbar-->


<div class="container mt-5">
            <div class="row">
                <div class="col-lg-8">
                    <!-- Post content-->
                    <c:forEach var="review" items="${reviews}">
                    <article class="mb-5 border-bottom pb-4">
                        <!-- Post header-->
                        <header class="mb-4">
                            <!-- Post title-->
                            <h1 class="fw-bolder mb-1">${review.title}</h1>
                            <!-- Post meta content-->
                            <div class="text mb-2">작성자 : ${review.userId} | 평점 : ${review.rating}</div>
                            <!-- Post categories-->
                            <a class="badge bg-secondary text-decoration-none link-light" href="#!">태그1</a>
                            <a class="badge bg-secondary text-decoration-none link-light" href="#!">태그2</a>
                        </header>
                        <!-- Preview image figure-->
                        <!-- Page content-->
<c:if test="${not empty review.reviewImageList}">
<div id="demo${review.id}" class="carousel slide" data-bs-ride="carousel">

  <!-- Indicators -->
  <div class="carousel-indicators">
    <c:forEach var="img" items="${review.reviewImageList}" varStatus="status">
      <button type="button"
              data-bs-target="#demo${review.id}"
              data-bs-slide-to="${status.index}"
              class="${status.first ? 'active' : ''}">
      </button>
    </c:forEach>
  </div>

  <!-- Slides -->
  <div class="carousel-inner">
    <c:forEach var="img" items="${review.reviewImageList}" varStatus="status">
      <div class="carousel-item ${status.first ? 'active' : ''} text-center">
        <img src="${pageContext.request.contextPath}${img}"
             class="d-block mx-auto img-fluid">
      </div>
    </c:forEach>
  </div>

  <!-- Controls -->
  <button class="carousel-control-prev" type="button"
          data-bs-target="#demo${review.id}" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </button>

  <button class="carousel-control-next" type="button"
          data-bs-target="#demo${review.id}" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
  </button>

</div>

<!-- Thumbnail navigation -->
<div class="d-flex justify-content-center mt-3 gap-2">
  <c:forEach var="img" items="${review.reviewImageList}" varStatus="status">
    <img src="${pageContext.request.contextPath}${img}"
         class="img-thumbnail thumb-img ${status.first ? 'active-thumb' : ''}"
         data-bs-target="#demo${review.id}"
         data-bs-slide-to="${status.index}">
  </c:forEach>
</div>
</c:if>
<!-- Post content-->
<section class="mb-5">
<p class="fs-5 mb-4">${review.body}</p>

                        </section>
                    </article>
                    </c:forEach>
                    <!-- Comments section-->
                    <section class="mb-5">
                        <div class="card bg-light">
                            <div class="card-body">
                                <!-- Comment form-->
                                <form class="mb-4"><textarea class="form-control" rows="3" placeholder="로그인 후 댓글 작성이 가능합니다."></textarea></form>
                                <!-- Comment with nested comments-->
                                <div class="d-flex mb-4">
                                    <!-- Parent comment-->
                                    <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                    <div class="ms-3">
                                        <div class="fw-bold">닉네임</div>
                                        댓글
                                        <!-- Child comment 1-->
                                        <div class="d-flex mt-4">
                                            <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                            <div class="ms-3">
                                                <div class="fw-bold">닉네임</div>
                                                대댓글
                                                </div>
                                        </div>
                                        <!-- Child comment 2-->
                                        <div class="d-flex mt-4">
                                            <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                            <div class="ms-3">
                                                <div class="fw-bold">닉네임</div>
                                                대댓글
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Single comment-->
                                <div class="d-flex">
                                    <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                    <div class="ms-3">
                                        <div class="fw-bold">닉네임</div>
                                        댓글
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <!-- Side widgets-->
                <div class="col-lg-4">
                    <!-- Search widget-->
                    <div class="card mb-4">
                        <div class="card-header">검색</div>
                        <div class="card-body">
                            <div class="input-group">
                                <input class="form-control" type="text" placeholder="검색 할 내용을 입력하세요." aria-label="Enter search term..." aria-describedby="button-search" />
                                <button class="btn btn-primary" id="button-search" type="button">Go!</button>
                            </div>
                        </div>
                    </div>
                <!-- Categories widget-->
<div class="card mb-4">
    <div class="card-header">리뷰의 가게 정보</div>
    <div class="card-body">
        <div class="row">
            <div>
                <ul class="list-unstyled">
                    <li>${restaurant.restaurantName}</li>
                    <br>
                    <li>🕕 영업시간 : ${restaurant.operatingHours}</li>
                    <li>🚩 주소 : ${restaurant.address}</li>
                    <li>📞 전화번호 : ${restaurant.phone}</li>
                </ul>
            </div>
        </div>
    </div>
</div>
                    <!-- Side widget-->
                    <div class="card mb-4">
                        <div class="card-header">Side Widget</div>
                        <div class="card-body">You can put anything you want inside of these side widgets. They are easy to use, and feature the Bootstrap 5 card component!</div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; HamBooks 2025</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/B_scripts.js"></script>
    </body>
    <script>
const carousel = document.getElementById('demo');
const thumbs = document.querySelectorAll('.thumb-img');

carousel.addEventListener('slid.bs.carousel', function (e) {
    thumbs.forEach(t => t.classList.remove('active-thumb'));
    thumbs[e.to].classList.add('active-thumb');
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
</html>
