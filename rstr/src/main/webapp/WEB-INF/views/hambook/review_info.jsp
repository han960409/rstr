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
        .carousel-item { width: 100%; height: 500px; background-color: #f8f9fa; }
        .carousel-item img { width: 100%; height: 100%; object-fit: cover; }

        .thumb-img {
            width: 80px; height: 60px; object-fit: cover;
            cursor: pointer; opacity: 0.5;
            transition: all 0.2s ease;
            border: 2px solid transparent;
        }
        .thumb-img:hover { opacity: 1; }
        .active-thumb {
            border: 2px solid #0d6efd !important;
            opacity: 1 !important;
            transform: scale(1.05);
        }
    </style>
</head>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="container mt-5">
    <div class="row">

        <!-- 리뷰 영역 -->
        <div class="col-lg-8">
            <c:forEach var="review" items="${reviews}">
                <article class="mb-5 border-bottom pb-4">

                    <h1 class="mb-4">
                        <h2 class="fw-bolder mb-1">${review.title}</h2>
                        <div class="text-muted fst-italic mb-2">
                            작성자: ${review.userId} | 평점: ${review.rating}
                        </div>
                    </h1>

                    <!-- 리뷰 이미지 -->
                    <c:if test="${not empty review.reviewImageList}">
                        <div class="mb-4">
                            <div id="demo${review.id}" class="carousel slide" data-bs-ride="carousel">
                                <div class="carousel-inner rounded">
                                    <c:forEach var="img" items="${review.reviewImageList}" varStatus="status">
                                        <div class="carousel-item ${status.first ? 'active' : ''}">
                                            <img src="${pageContext.request.contextPath}${img}" class="d-block w-100">
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <p class="fs-5 mb-5">${review.body}</p>

                    <!-- ================= 댓글 영역 ================= -->

                    <!-- 댓글 작성 (로그인한 경우만) -->
                    <c:if test="${not empty sessionScope.user}">
                        <div class="card bg-light mb-4">
                            <div class="card-body">
                                <form action="${pageContext.request.contextPath}/review/addComment"
                                      method="post">
                                    <input type="hidden" name="reviewId" value="${review.id}" />
                                    <input type="hidden" name="userId"
                                           value="${sessionScope.user.userId}" />

                                    <div class="mb-3">
                                        <textarea class="form-control"
                                                  name="body"
                                                  rows="3"
                                                  placeholder="댓글을 작성해주세요."
                                                  required></textarea>
                                    </div>
                                    <button class="btn btn-primary">댓글 등록</button>
                                </form>
                            </div>
                        </div>
                    </c:if>

                    <!-- 댓글 목록 (항상 표시) -->


<section>
    <h5 class="mb-3">댓글</h5>

    <!-- 댓글 목록 -->
<c:choose>
    <c:when test="${empty review.commentList}">
        <div class="text-muted">아직 댓글이 없습니다.</div>
    </c:when>
    <c:otherwise>
        <c:forEach var="comment" items="${review.commentList}">
            <div class="d-flex mb-3">
                <div class="flex-shrink-0">
                    <img class="rounded-circle"
                         src="${pageContext.request.contextPath}/images/default-profile.png"
                         width="45" height="45">
                </div>
                <div class="ms-3 w-100">
                    <div class="fw-bold d-flex justify-content-between">
                        <span>${comment.userId}</span>

                        <!-- 🔥 본인 댓글만 삭제 버튼 -->
                        <c:if test="${sessionScope.user != null && sessionScope.user.userId == comment.userId}">
                            <form action="${pageContext.request.contextPath}/review/deleteComment"
                                  method="post" style="display:inline;">
                                <input type="hidden" name="commentId" value="${comment.id}" />
                                <input type="hidden" name="reviewId" value="${review.id}" />
                                <input type="hidden" name="userId" value="${comment.userId}" />
                                <button class="btn btn-sm btn-outline-danger"
                                        onclick="return confirm('댓글을 삭제하시겠습니까?')">
                                    삭제
                                </button>
                            </form>
                        </c:if>
                    </div>
                    <div>${comment.body}</div>
                    <small class="text-muted">${comment.createdAt}</small>
                </div>
            </div>
        </c:forEach>
    </c:otherwise>
</c:choose>

    <!-- 로그인 안내 -->
    <c:if test="${empty sessionScope.user}">
        <div class="alert alert-info mt-3">
            댓글을 작성하려면
            <a href="${pageContext.request.contextPath}/login">로그인</a>이 필요합니다.
        </div>
    </c:if>
</section>

                </article>
            </c:forEach>
        </div>

        <!-- 사이드바 -->
        <div class="col-lg-4">
            <div class="card mb-4">
                <div class="card-header">가게 정보</div>
                <div class="card-body">
                    <h5>${restaurant.restaurantName}</h5>
                    <p>${restaurant.address}</p>
                    <p>📞문의번호 : ${restaurant.phone}</p>
					<p>👍공감갯수 : <span id="recommendCount">${restaurant.receiveRecommend}</span>
					<button id="recommendBtn" class="btn btn-sm btn-primary">공감하기</button></p>
                </div>
            </div>
        </div>

    </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const restaurantId = ${restaurant.id};
    document.getElementById('recommendBtn').addEventListener('click', function() {
        fetch('${pageContext.request.contextPath}/restaurant/recommend', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: 'restaurantId=' + restaurantId
        })
        .then(response => response.json())
        .then(data => {
            if(data.success) {
                document.getElementById('recommendCount').innerText = data.newCount;
            } else {
                alert(data.message || '공감 처리에 실패했습니다.');
            }
        })
        .catch(err => console.error(err));
    });
</script>
</body>
</html>
