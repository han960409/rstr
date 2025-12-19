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
.container{
	display:flex;
	align-items:center;
	display:flex;
	justify-content: center;
}
a{
text-decoration: none;
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
<h2 style="margin-bottom:30px; color:#333; text-align:center; margin-top:35px;">✔세부지역을 선택해 주세요.✔</h2>
<div class="container">

<img src="${pageContext.request.contextPath}/resources/images/서울 경기도 지도.jpg" style="margin-top:30px;margin-bottom:30px;">
<div class="dropdown" style="margin-left:50px;">
  <button class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown">
    선택하세요
  </button>
  <ul class="dropdown-menu">
    <li><a href=""><div class="dropdown-item">서울</div></a></li>
    <li><a href=""><div class="dropdown-item">인천</div></a></li>
    <li><a href=""><div class="dropdown-item">김포</div></a></li>
    <li><a href=""><div class="dropdown-item">부천</div></a></li>
    <li><a href="${pageContext.request.contextPath}/list"><div class="dropdown-item">수원</div></a></li>
    <li><a href=""><div class="dropdown-item">평택</div></a></li>
    <li><a href=""><div class="dropdown-item">남양주</div></a></li>
    <li><a href=""><div class="dropdown-item">연천</div></a></li>
    <li><a href=""><div class="dropdown-item">가평</div></a></li>
    <li><a href=""><div class="dropdown-item">성남</div></a></li>
  </ul>
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

</body>
</html>

