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
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<table>
    <thead>
        <tr>
            <th>가게명</th>
            <th>카테고리</th>
            <th>주소</th>
            <th>영업시간</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="r" items="${restaurantList}">
            <tr>
                <td>${r.restaurantName}</td>
                <td>${r.category}</td>
                <td>${r.address}</td>
                <td>${r.operatingHours}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

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

