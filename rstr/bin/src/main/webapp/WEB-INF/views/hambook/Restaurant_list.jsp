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

<div class="content-wrap">
	<div class="card">
		<h2 style="margin:50px auto;">🥩가게 list🥩</h2>
	</div>
	
	<ul class="list-group" style="width:90%; margin:0 auto;">

<li class="list-group-item"
    style="margin-bottom:30px; padding-bottom:20px; border:none; border-bottom:1px solid lightgray;">

	<div class="d-flex align-items-center" style="min-height:150px;">

		<!-- ① 가게명 -->
	<div class="p-3 d-flex" style="width:20%;">

	<!-- 🔹 왼쪽: 이미지 + 아이디 -->
<!-- ✅ 부모 (세로 정렬 기준) -->
<div class="d-flex flex-column justify-content-between">

	<!-- 위 -->
	<div class="d-flex align-items-center justify-content-end flex-grow-1">
		<div class="text-black d-flex align-items-center justify-content-center"
		     style="width:50px; height:100%;">
			번호
		</div>
	</div>

	<!-- 아래 -->
	<div class="d-flex align-items-center justify-content-end flex-grow-1">
		<div class="text-black d-flex align-items-center justify-content-center"
		     style="width:50px; height:100%;">
			👍500
		</div>
	</div>

</div>
	<div class="d-flex flex-column align-items-center"
	     style="width:200px;">

		<div class="bg-info text-white text-center mb-1">
			<img src="${pageContext.request.contextPath}/resources/images/치킨.jpg" style="width:120px; height:120px;">
		</div>

		<div class="bg-warning text-center p-2"
		     style="width:120px;">
			가게이름
		</div>

	</div>

	<!-- 🔸 오른쪽: 추천 수 -->


	</div>

		<!-- ② 리뷰 표시 영역 -->
		<div class="review-box" style="width:95%; height:170px;  align-items:center;">

			<div class="review-text"style="text-align:center;">
				<!-- 판매중인 요리 세부사항 -->
				요리 첨부 공간
			</div>

		</div>


		
		<div class="p-3 d-flex flex-column align-items-end"
		     style="width:30%;">

			<div class="bg-info text-white text-center p-2 mb-1"
			     style="width:200px;">
				위치<br>
				내용
			</div>

			<div class="d-flex" style="width:200px;">
				<div class="bg-warning text-center p-2" style="width:100px;">상세페이지 이동버튼</div>
				<div class="bg-primary text-center p-2" style="width:100px;">평점</div>
			</div>

		</div>

</div>

</li>
<li class="list-group-item"
    style="margin-bottom:30px; padding-bottom:20px; border:none; border-bottom:1px solid lightgray;">

	<div class="d-flex align-items-center" style="min-height:150px;">

		<!-- ① 가게명 -->
	<div class="p-3 d-flex" style="width:20%;">

	<!-- 🔹 왼쪽: 이미지 + 아이디 -->
<!-- ✅ 부모 (세로 정렬 기준) -->
<div class="d-flex flex-column justify-content-between">

	<!-- 위 -->
	<div class="d-flex align-items-center justify-content-end flex-grow-1">
		<div class="text-black d-flex align-items-center justify-content-center"
		     style="width:50px; height:100%;">
			번호
		</div>
	</div>

	<!-- 아래 -->
	<div class="d-flex align-items-center justify-content-end flex-grow-1">
		<div class="text-black d-flex align-items-center justify-content-center"
		     style="width:50px; height:100%;">
			👍500
		</div>
	</div>

</div>
	<div class="d-flex flex-column align-items-center"
	     style="width:200px;">

		<div class="bg-info text-white text-center mb-1">
			<img src="${pageContext.request.contextPath}/resources/images/치킨.jpg" style="width:120px; height:120px;">
		</div>

		<div class="bg-warning text-center p-2"
		     style="width:120px;">
			가게이름
		</div>

	</div>

	<!-- 🔸 오른쪽: 추천 수 -->


	</div>

		<!-- ② 리뷰 표시 영역 -->
		<div class="review-box" style="width:95%; height:170px;  align-items:center;">

			<div class="review-text"style="text-align:center;">
				<!-- 판매중인 요리 세부사항 -->
				요리 첨부 공간
			</div>

		</div>


		
		<div class="p-3 d-flex flex-column align-items-end"
		     style="width:30%;">

			<div class="bg-info text-white text-center p-2 mb-1"
			     style="width:200px;">
				위치<br>
				내용
			</div>

			<div class="d-flex" style="width:200px;">
				<div class="bg-warning text-center p-2" style="width:100px;">상세페이지 이동버튼</div>
				<div class="bg-primary text-center p-2" style="width:100px;">평점</div>
			</div>

		</div>

</div>

</li>
<li class="list-group-item"
    style="margin-bottom:30px; padding-bottom:20px; border:none; border-bottom:1px solid lightgray;">

	<div class="d-flex align-items-center" style="min-height:150px;">

		<!-- ① 가게명 -->
	<div class="p-3 d-flex" style="width:20%;">

	<!-- 🔹 왼쪽: 이미지 + 아이디 -->
<!-- ✅ 부모 (세로 정렬 기준) -->
<div class="d-flex flex-column justify-content-between">

	<!-- 위 -->
	<div class="d-flex align-items-center justify-content-end flex-grow-1">
		<div class="text-black d-flex align-items-center justify-content-center"
		     style="width:50px; height:100%;">
			번호
		</div>
	</div>

	<!-- 아래 -->
	<div class="d-flex align-items-center justify-content-end flex-grow-1">
		<div class="text-black d-flex align-items-center justify-content-center"
		     style="width:50px; height:100%;">
			👍500
		</div>
	</div>

</div>
	<div class="d-flex flex-column align-items-center"
	     style="width:200px;">

		<div class="bg-info text-white text-center mb-1">
			<img src="${pageContext.request.contextPath}/resources/images/치킨.jpg" style="width:120px; height:120px;">
		</div>

		<div class="bg-warning text-center p-2"
		     style="width:120px;">
			가게이름
		</div>

	</div>

	<!-- 🔸 오른쪽: 추천 수 -->


	</div>

		<!-- ② 리뷰 표시 영역 -->
		<div class="review-box" style="width:95%; height:170px;  align-items:center;">

			<div class="review-text"style="text-align:center;">
				<!-- 판매중인 요리 세부사항 -->
				요리 첨부 공간
			</div>

		</div>


		
		<div class="p-3 d-flex flex-column align-items-end"
		     style="width:30%;">

			<div class="bg-info text-white text-center p-2 mb-1"
			     style="width:200px;">
				위치<br>
				내용
			</div>

			<div class="d-flex" style="width:200px;">
				<div class="bg-warning text-center p-2" style="width:100px;">상세페이지 이동버튼</div>
				<div class="bg-primary text-center p-2" style="width:100px;">평점</div>
			</div>

		</div>

</div>

</li>
<li class="list-group-item"
    style="margin-bottom:30px; padding-bottom:20px; border:none; border-bottom:1px solid lightgray;">

	<div class="d-flex align-items-center" style="min-height:150px;">

		<!-- ① 가게명 -->
	<div class="p-3 d-flex" style="width:20%;">

	<!-- 🔹 왼쪽: 이미지 + 아이디 -->
<!-- ✅ 부모 (세로 정렬 기준) -->
<div class="d-flex flex-column justify-content-between">

	<!-- 위 -->
	<div class="d-flex align-items-center justify-content-end flex-grow-1">
		<div class="text-black d-flex align-items-center justify-content-center"
		     style="width:50px; height:100%;">
			번호
		</div>
	</div>

	<!-- 아래 -->
	<div class="d-flex align-items-center justify-content-end flex-grow-1">
		<div class="text-black d-flex align-items-center justify-content-center"
		     style="width:50px; height:100%;">
			👍500
		</div>
	</div>

</div>
	<div class="d-flex flex-column align-items-center"
	     style="width:200px;">

		<div class="bg-info text-white text-center mb-1">
			<img src="${pageContext.request.contextPath}/resources/images/치킨.jpg" style="width:120px; height:120px;">
		</div>

		<div class="bg-warning text-center p-2"
		     style="width:120px;">
			가게이름
		</div>

	</div>

	<!-- 🔸 오른쪽: 추천 수 -->


	</div>

		<!-- ② 리뷰 표시 영역 -->
		<div class="review-box" style="width:95%; height:170px;  align-items:center;">

			<div class="review-text"style="text-align:center;">
				<!-- 판매중인 요리 세부사항 -->
				요리 첨부 공간
			</div>

		</div>


		
		<div class="p-3 d-flex flex-column align-items-end"
		     style="width:30%;">

			<div class="bg-info text-white text-center p-2 mb-1"
			     style="width:200px;">
				위치<br>
				내용
			</div>

			<div class="d-flex" style="width:200px;">
				<div class="bg-warning text-center p-2" style="width:100px;">상세페이지 이동버튼</div>
				<div class="bg-primary text-center p-2" style="width:100px;">평점</div>
			</div>

		</div>

</div>

</li>
<li class="list-group-item"
    style="margin-bottom:30px; padding-bottom:20px; border:none; border-bottom:1px solid lightgray;">

	<div class="d-flex align-items-center" style="min-height:150px;">

		<!-- ① 가게명 -->
	<div class="p-3 d-flex" style="width:20%;">

	<!-- 🔹 왼쪽: 이미지 + 아이디 -->
<!-- ✅ 부모 (세로 정렬 기준) -->
<div class="d-flex flex-column justify-content-between">

	<!-- 위 -->
	<div class="d-flex align-items-center justify-content-end flex-grow-1">
		<div class="text-black d-flex align-items-center justify-content-center"
		     style="width:50px; height:100%;">
			번호
		</div>
	</div>

	<!-- 아래 -->
	<div class="d-flex align-items-center justify-content-end flex-grow-1">
		<div class="text-black d-flex align-items-center justify-content-center"
		     style="width:50px; height:100%;">
			👍500
		</div>
	</div>

</div>
	<div class="d-flex flex-column align-items-center"
	     style="width:200px;">

		<div class="bg-info text-white text-center mb-1">
			<img src="${pageContext.request.contextPath}/resources/images/치킨.jpg" style="width:120px; height:120px;">
		</div>

		<div class="bg-warning text-center p-2"
		     style="width:120px;">
			가게이름
		</div>

	</div>

	<!-- 🔸 오른쪽: 추천 수 -->


	</div>

		<!-- ② 리뷰 표시 영역 -->
		<div class="review-box" style="width:95%; height:170px;  align-items:center;">

			<div class="review-text"style="text-align:center;">
				<!-- 판매중인 요리 세부사항 -->
				요리 첨부 공간
			</div>

		</div>


		
		<div class="p-3 d-flex flex-column align-items-end"
		     style="width:30%;">

			<div class="bg-info text-white text-center p-2 mb-1"
			     style="width:200px;">
				위치<br>
				내용
			</div>

			<div class="d-flex" style="width:200px;">
				<div class="bg-warning text-center p-2" style="width:100px;">상세페이지 이동버튼</div>
				<div class="bg-primary text-center p-2" style="width:100px;">평점</div>
			</div>

		</div>

</div>

</li>

</ul>
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

