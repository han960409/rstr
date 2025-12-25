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
    <body>
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/home"><img src="${pageContext.request.contextPath}/resources/images/hambooks.png" width="180px" height="60px"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}">리뷰 상세 페이지</a></li>
                        <li class="nav-item"><a class="nav-link" href="/#">로그인</a>
                </li>
                    </ul>
                </div>
            </div>
        </nav>

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
</script>
</html>
