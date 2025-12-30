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
.tooltip {
  position: relative;
  display: inline-block;
  cursor: pointer;
}

.tooltip .tooltiptext {
  visibility: hidden;
  width: 140px;
  background-color: black;
  color: #fff;
  text-align: center;
  padding: 5px 10px;
  border-radius: 5px;

  position: absolute;
  z-index: 1;
  bottom: 125%; /* 위쪽에 표시 */
  left: 50%;
  transform: translateX(-50%);
  opacity: 0;
  transition: opacity 0.3s;
}

.tooltip:hover .tooltiptext {
  visibility: visible;
  opacity: 1;
}
.rank-item {
  display: grid;
  grid-template-columns: 40% 1fr 300px;
  align-items: center;
  gap: 20px;
}

/* 리뷰 영역 */
.review-area {
  font-size: 14px;
}

.review-header {
  display: flex;
  align-items: center;
  gap: 8px;
  margin-bottom: 6px;
}

.review-header img {
  width: 30px;
  height: 30px;
  border-radius: 50%;
}

.review-body {
  background: #f8f9fa;
  padding: 8px;
  border-radius: 6px;
}

/* 정보 영역 */
.info-area .rank {
  font-size: 20px;
  font-weight: bold;
}

.info-area .name {
  font-size: 18px;
  font-weight: 600;
}

/* 이미지 영역 */
.image-area img {
  width: 300px;
  height: 150px;
  object-fit: cover;
  border-radius: 8px;
}
</style>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div class="content-wrap">
<div class="d-flex flex-column align-items-center">
<div class="card" style="border:none;">
		<!-- <img src="${pageContext.request.contextPath}/resources/images/왕관.jpg"  style=" margin:0 auto; width:50px; height:50px;">  -->
		<h1 class="card-body" style=" margin:0 auto; margin-top:30px;">리뷰 명예의 전당</h1>
</div>
<div class="d-flex justify-content mb-3" style="width:90%; margin-top:30px; align-items:left;">
  <a href="${pageContext.request.contextPath}/king?sort=like"
     class="btn btn-outline-dark me-2
     ${sort eq 'like' ? 'active' : ''}" title="공감이 많은 순으로 정렬합니다.">
    🔥 공감 많은 순
  </a>

  <a href="${pageContext.request.contextPath}/king?sort=latest"
     class="btn btn-outline-dark
     ${sort eq 'latest' ? 'active' : ''}" title="오픈 최신 순으로 정렬합니다.">
    🕒 오픈 최신 순
  </a>
</div>
<ul class="list-group" style="width:90%; margin-bottom:35px;margin:0 auto;">
<c:forEach var="r" items="${rstrList}" varStatus="status" begin="0" end="4">
<li class="list-group-item">
  <div class="rank-item">

    <!-- 왼쪽: 식당 정보 -->
    <div class="info-area">
    <div class="rank">🏆 ${status.index + 1}위</div>
    <div>👍 ${r.receiveRecommend}</div>
    <div class="name">
  			<a href="${pageContext.request.contextPath}/review/restaurant/${r.id}"
     			style="text-decoration:none; color:inherit;">
    			${r.restaurantName}
 			 </a>
	</div>
      <div>🕧 ${r.operatingHours}</div>
      <div>🚩 ${r.address}</div>
    </div>

    <!-- 가운데: 리뷰 -->
<div class="review-area">
  <c:set var="rv" value="${reviewMap[r.id]}" />

  <c:if test="${rv ne null}">
    <div class="review-header">
      <img src="${pageContext.request.contextPath}${rv.pfImage}">
      <span>${rv.userId} 고객님의 리뷰</span>
    </div>

    <div class="review-body">
      ${rv.body}
    </div>
  </c:if>

  <c:if test="${rv eq null}">
    <div class="text-muted small">
      아직 등록된 리뷰가 없습니다.
    </div>
  </c:if>
</div>

    <!-- 오른쪽: 이미지 -->
    <div class="image-area">
      <img src="${pageContext.request.contextPath}${r.imagePath}"           
    		width="300"
    		height="150"
           alt="식당 이미지">
    </div>

  </div>
</li>
</c:forEach>
</ul>
</div>
</div>







<jsp:include page="/WEB-INF/views/common/footer.jsp" />

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
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
  })
          const header = document.getElementById('header');
        window.addEventListener('scroll', () => {
            if (window.scrollY > 20) {
                header.classList.add('scrolled');
            } else {
                header.classList.remove('scrolled');
            }
        });

</script>
</body>
</html>

