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
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="container my-4">
<div class="table-responsive"">
  <table class="table table-bordered table-hover align-middle shadow-sm" style="text-align:center;">
    <thead class="table-light">
        <tr class="text-center">
            <th style="width: 120px;">이미지</th>
            <th>가게명</th>
            <th>주소</th>
            <th style="width: 140px;">영업시간</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="r" items="${restaurantList}">
            <tr>
                <!-- 이미지 -->
                <td class="text-center">
                    <img
                        src="${pageContext.request.contextPath}${r.imagePath}"
                        alt="${r.restaurantName}"
                        class="img-fluid rounded"
                        style="width: 100px; height: 70px; object-fit: cover;"
                        onerror="this.src='${pageContext.request.contextPath}/images/no-image.png'"
                    />
                </td>

                <!-- 가게명 -->
                <td class="fw-bold">
<a href="${pageContext.request.contextPath}/restaurant/${r.id}"
   class="text-decoration-none text-dark fw-bold">
    ${r.restaurantName}
</a>
</td>

                <!-- 주소 -->
                <td>${r.address}</td>

                <!-- 영업시간 -->
                <td class="text-nowrap text-center">
                    ${r.operatingHours}
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<!-- Bootstrap core JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Core theme JS -->
<script src="${pageContext.request.contextPath}/js/H_scripts.js"></script>
<script>
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

