<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>함 북 스</title>

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
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
</head>
<style>
html {
    scroll-behavior: smooth;
}
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
<!-- Header -->
<header class="py-5">
    <div class="container px-lg-5">
        <div class="p-4 p-lg-5 bg-light rounded-3 text-center">
            <div class="m-4 m-lg-5">
                <h1 class="display-5 fw-bold">함북스(HamBooks)</h1>
                <p class="fs-4">
                    함북스는 ‘햄버거’를 의미하는 유행어 ‘함부기’에서 착안한
                    ‘함(ham)’과 예약을 뜻하는 ‘books’의 조합으로 탄생한 브랜드입니다.
                    사용자들의 평점 데이터를 기반으로 한 맛집 랭킹 서비스와
                    빠르고 간편한 예약 기능을 제공하여,
                    더 즐겁고 스마트한 외식 경험을 제공합니다.
                </p>
                <a class="btn btn-primary btn-lg" href="#menuSection">메뉴 살펴보기</a>
            </div>
        </div>
    </div>
</header>

<!-- Page Content -->
<section class="pt-4" id="menuSection">
    <div class="container">
        <div class="row">

            <!-- 카드 반복 -->
			
  			<div class="col-lg-6 col-xxl-4 mb-5">
  			<a href="/area" class="text-decoration-none text-dark d-block">
  			<img src="${pageContext.request.contextPath}/resources/images/경주.jpg" class="d-block mx-auto" width="400px" height="200px">
   			   <div class="card bg-light border-0">
     			     <div class="card-body text-center p-4 p-lg-5 pt-0">
    			          <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4">
     			             <i class="bi bi-collection"></i>
   			           </div>
 			             <h2 class="fs-4 fw-bold">지역별</h2>
			              <p class="mb-0">지역별로 맛집을 검색합니다.</p>
			            </div>
			        </div>
			   </a>
 			</div>
  			<div class="col-lg-6 col-xxl-4 mb-5">
  			<a href="#" class="text-decoration-none text-dark d-block">
  			<img src="${pageContext.request.contextPath}/resources/images/스테이크.jpg" class="d-block mx-auto" width="400px" height="200px">
   			   <div class="card bg-light border-0">
     			     <div class="card-body text-center p-4 p-lg-5 pt-0">
    			          <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4">
     			             <i class="bi bi-collection"></i>
   			           </div>
 			             <h2 class="fs-4 fw-bold">음식 종류별</h2>
			              <p class="mb-0">음식 종류별로 맛집을 검색합니다.</p>
			            </div>
			        </div>
			   </a>
 			</div>
  			<div class="col-lg-6 col-xxl-4 mb-5">
  			<a href="${pageContext.request.contextPath}/king" class="text-decoration-none text-dark d-block">
  			<img src="${pageContext.request.contextPath}/resources/images/왕관.jpg" class="d-block mx-auto" width="400px" height="200px">
   			 	<div class="card bg-light border-0">
     			  	<div class="card-body text-center p-4 p-lg-5 pt-0">
    			        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4">
     			             <i class="bi bi-collection"></i>
   			          	</div>
 			            <h2 class="fs-4 fw-bold">리뷰 명예의 전당</h2>
			            <p class="mb-0">맛집 리뷰의 랭킹이 궁금하다면 클릭!</p>
			      	</div>
			    </div>
			</a>
 			</div>
  			<div class="col-lg-6 col-xxl-4 mb-5">
  			<a href="#" class="text-decoration-none text-dark d-block">
  			<img src="${pageContext.request.contextPath}/resources/images/크리스마스.jpg" class="d-block mx-auto" width="400px" height="200px"> 
   			   		<div class="card bg-light border-0">
     			     	<div class="card-body text-center p-4 p-lg-5 pt-0">
    			          <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4">
     			             <i class="bi bi-collection"></i>
   			           	  </div>
 			            <h2 class="fs-4 fw-bold">테마별</h2>
			            <p class="mb-0">이번 달의 테마는 "크리스마스" 입니다. 확인하고 싶으면 클릭!</p>
			            </div>
			        </div>
			</a>
 			</div>
			

            <!-- (나머지 카드 동일 – HTML 그대로 사용 가능) -->

        </div>
    </div>
</section>

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
