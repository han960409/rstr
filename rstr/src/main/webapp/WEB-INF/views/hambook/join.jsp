<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 - HamBooks</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* 기존 스타일 그대로 유지 */
        body { min-height: 100vh; display: flex; flex-direction: column; background: linear-gradient(135deg, #F07030 0%, #FF8C5A 100%);}
        .main-content { flex: 1; display: flex; align-items: center; justify-content: center; padding: 2rem;}
        .login-card { background: white; border-radius: 1.5rem; box-shadow: 0 20px 60px rgba(0,0,0,0.3); padding: 3rem; max-width: 480px; width: 100%;}
        .login-title { font-size: 3rem; font-weight: bold; font-style: italic; color: #F07030; text-align: center; margin-bottom: 0.5rem;}
        .login-subtitle { text-align: center; color: #6b7280; font-size: 1.1rem; margin-bottom: 2rem;}
        .form-label { font-weight: 500; color: #374151; margin-bottom: 0.5rem;}
        .form-control { padding: 0.875rem 1rem; border: 2px solid #e5e7eb; border-radius: 0.75rem; font-size: 1rem; transition: all 0.2s;}
        .form-control:focus { border-color: #F07030; box-shadow: 0 0 0 3px rgba(240, 112, 48, 0.1);}
        .input-icon { position: relative;}
        .input-icon::before { content: '🐹'; position: absolute; left: 1rem; top: 50%; transform: translateY(-50%); font-size: 1.2rem;}
        .input-icon input { padding-left: 2.75rem;}
        .password-icon::before { content: '🔒'; }
        .password-toggle { position: absolute; right: 1rem; top: 50%; transform: translateY(-50%); cursor: pointer; font-size: 1.2rem;}
        .form-check { margin: 1.5rem 0; }
        .form-check-input:checked { background-color: #F07030; border-color: #F07030; }
        .btn-login { width: 100%; padding: 1rem; background: #F07030; color: white; border: none; border-radius: 0.75rem; font-size: 1.1rem; font-weight: 600; margin-top: 1rem; transition: all 0.2s;}
        .btn-login:hover { background: #D85A20; transform: translateY(-2px); box-shadow: 0 6px 20px rgba(240, 112, 48, 0.4);}
        .signup-text { text-align: center; margin-top: 1.5rem; color: #6b7280;}
        .signup-link { color: #F07030; text-decoration: none; font-weight: 600;}
        .signup-link:hover { color: #D85A20; text-decoration: underline;}
    </style>
</head>
<body>
    <!-- Header -->
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <!-- Main Content -->
    <div class="main-content">
        <div class="login-card">
            <h1 class="login-title">HAMBOOKS</h1>
            <p class="login-subtitle">맛집을 읽다, 예약을 잇다</p>

            <form id="signupForm" action="${pageContext.request.contextPath}/signup" method="post">
                <!-- 회원 유형 -->
                <div class="mb-3">
                    <label class="form-label">회원 유형</label>
                    <div class="d-flex gap-3">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="role" id="roleUser" value="USER" checked>
                            <label class="form-check-label" for="roleUser">일반 회원</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="role" id="roleOwner" value="OWNER">
                            <label class="form-check-label" for="roleOwner">사장님</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="role" id="roleAdmin" value="ADMIN">
                            <label class="form-check-label" for="roleAdmin">관리자</label>
                        </div>
                    </div>
                </div>

                <!-- 아이디 -->
                <div class="mb-3">
                    <div class="input-icon">
                        <input type="text" name="userId" class="form-control" placeholder="아이디를 입력하세요" required>
                    </div>
                </div>

                <!-- 비밀번호 -->
                <div class="mb-3">
                    <div class="input-icon password-icon" style="position: relative;">
                        <input type="password" name="password" class="form-control" id="password" placeholder="비밀번호" required>
                        <span class="password-toggle" onclick="togglePassword()">👁️</span>
                    </div>
                </div>

                <!-- 비밀번호 확인 -->
                <div class="mb-3">
                    <div class="input-icon password-icon">
                        <input type="password" name="passwordConfirm" class="form-control" id="passwordConfirm" placeholder="비밀번호 확인" required>
                    </div>
                </div>

                <!-- 이름 -->
                <div class="mb-3">
                    <input type="text" name="name" class="form-control" placeholder="이름을 입력하세요" required>
                </div>

                <!-- 이메일 -->
                <div class="mb-3">
                    <input type="email" name="email" class="form-control" placeholder="이메일을 입력하세요" required>
                </div>

                <!-- 전화번호 -->
                <div class="mb-3">
                    <input type="text" name="phone" class="form-control" placeholder="전화번호 (예: 01012345678)" maxlength="11" oninput="this.value = this.value.replace(/\D/g,'');" />
                </div>

                <button type="submit" class="btn-login">회원가입</button>

                <p class="signup-text">
                    이미 회원이신가요?
                    <a href="${pageContext.request.contextPath}/login" class="signup-link">로그인</a>
                </p>
            </form>
        </div>
    </div>

    <!-- Footer -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    // 비밀번호 토글
    const toggle = document.querySelector('.password-toggle');
    toggle.addEventListener('click', function() {
        const passwordInput = document.getElementById('password');
        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            toggle.textContent = '🙈';
        } else {
            passwordInput.type = 'password';
            toggle.textContent = '👁️';
        }
    });

    // 비밀번호 확인 체크
    const signupForm = document.getElementById('signupForm');
    signupForm.addEventListener('submit', function(e) {
        const password = document.getElementById('password').value;
        const passwordConfirm = document.getElementById('passwordConfirm').value;

        if (password !== passwordConfirm) {
            e.preventDefault();
            alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
            document.getElementById('passwordConfirm').focus();
            return false;
        }
    });
});
</script>
</body>
</html>
