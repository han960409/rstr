<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");%>

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
</head>
<style>


</style>
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
                       href="${pageContext.request.contextPath}/king">king</a>
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
<div class="content-wrap">
<div class="d-flex flex-column align-items-center">
<div class="card" style="border:none;">
		<!-- <img src="${pageContext.request.contextPath}/resources/images/왕관.jpg"  style=" margin:0 auto; width:50px; height:50px;">  -->
		<h1 class="card-body" style=" margin:0 auto; margin-top:30px;">리뷰 명예의 전당</h1>
</div>
<div class="d-flex justify-content mb-3" style="width:90%; margin-top:30px; align-items:left;">
  <a href="${pageContext.request.contextPath}/king?sort=like"
     class="btn btn-outline-dark me-2
     ${sort eq 'like' ? 'active' : ''}">
    🔥 공감 많은 순
  </a>

  <a href="${pageContext.request.contextPath}/king?sort=latest"
     class="btn btn-outline-dark
     ${sort eq 'latest' ? 'active' : ''}">
    🕒 오픈 최신 순
  </a>
</div>
<ul class="list-group" style="width:90%; margin-bottom:35px;margin:0 auto;">
<c:forEach var="r" items="${rstrList}" varStatus="status" begin="0" end="4">
  <li class="list-group-item">
    <!-- 카드 안 flex 배치: 리뷰 | 기본 정보 | 이미지 -->
    <div class="d-flex align-items-start">
      

      
      <!-- 2. 기본 정보 영역 (중간) -->
      <div class="flex-grow-1 me-3">
        <div style="font-size:20px;">🏆 ${status.index + 1}위</div>
        <div>👍 ${r.receiveRecommend}</div>
        <div style="font-size:20px;">${r.restaurantName}</div>
        <div>🕧 영업시간 : ${r.operatingHours}</div>
        <div>🚩 ${r.address}</div>
      </div>
            <!-- 1. 리뷰 영역 (왼쪽) -->
      <div class="review-area me-3" style="width:40%;">
        <c:set var="reviews" value="${reviewMap[r.id]}" />
        <c:forEach var="rv" items="${reviews}" end="0">
        	<div>
        	<img src="${pageContext.request.contextPath}${rv.pfImage}" style="width:30px;height:30px;border-radius:100%">
        	${rv.userId} 고객님의 리뷰
        	</div>
          <div class="p-2 mb-2 rounded">
            <div class="fw-semibold small mb-1">💬 간략 리뷰</div>
            <div class="small text-secondary">
              ${rv.body} <span class="text-success"></span>
            </div>
          </div>
        </c:forEach>
      </div>
      <!-- 3. 이미지 영역 (오른쪽) -->
      <div>
        <img src="${pageContext.request.contextPath}${r.imagePath}"
             alt="식당 이미지"
             style="width:300px; height:150px; object-fit:cover;">
      </div>
      
    </div>
  </li>
</c:forEach>
</ul>
</div>
</div>

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
<script>
  function sortByLike() {
    const list = document.querySelector(".list-group");
    const items = Array.from(list.children);

    items.sort((a, b) => {
      return b.dataset.like - a.dataset.like;
    });

    items.forEach(item => list.appendChild(item));
  }

  function sortByDate() {
    const list = document.querySelector(".list-group");
    const items = Array.from(list.children);

    items.sort((a, b) => {
      return new Date(b.dataset.date) - new Date(a.dataset.date);
    });

    items.forEach(item => list.appendChild(item));
  }
</script>
</body>
</html>

