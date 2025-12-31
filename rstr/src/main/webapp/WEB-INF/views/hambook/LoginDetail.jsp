<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 - HamBooks</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>

        body {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background: linear-gradient(135deg, #F07030 0%, #FF8C5A 100%);
        }
        
        .main-content {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
        }
        
        .login-card {
            background: white;
            border-radius: 1.5rem;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            padding: 3rem;
            max-width: 480px;
            width: 100%;
        }
        
        .login-title {
            font-size: 3rem;
            font-weight: bold;
            font-style: italic;
            color: #F07030;
            text-align: center;
            margin-bottom: 0.5rem;
        }
        
        .login-subtitle {
            text-align: center;
            color: #6b7280;
            font-size: 1.1rem;
            margin-bottom: 2rem;
        }
        
        .form-label {
            font-weight: 500;
            color: #374151;
            margin-bottom: 0.5rem;
        }
        
        .form-control {
            padding: 0.875rem 1rem;
            border: 2px solid #e5e7eb;
            border-radius: 0.75rem;
            font-size: 1rem;
            transition: all 0.2s;
        }
        
        .form-control:focus {
            border-color: #F07030;
            box-shadow: 0 0 0 3px rgba(240, 112, 48, 0.1);
        }
        
        .input-icon {
            position: relative;
        }
        
        .input-icon::before {
            content: '🐹';
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            font-size: 1.2rem;
            z-index: 1;
        }
        
        .input-icon input {
            padding-left: 2.75rem;
        }
        
        .password-icon::before {
            content: '🔒';
        }
        
        .password-toggle {
            position: absolute;
            right: 1rem;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            font-size: 1.2rem;
            z-index: 2;
        }
        
        .form-check {
            margin: 1.5rem 0;
        }
        
        .form-check-input:checked {
            background-color: #F07030;
            border-color: #F07030;
        }
        
        .forgot-link {
            color: #F07030;
            text-decoration: none;
            font-weight: 600;
            float: right;
        }
        
        .forgot-link:hover {
            color: #D85A20;
            text-decoration: underline;
        }
        
        .btn-login {
            width: 100%;
            padding: 1rem;
            background: #F07030;
            color: white;
            border: none;
            border-radius: 0.75rem;
            font-size: 1.1rem;
            font-weight: 600;
            margin-top: 1rem;
            transition: all 0.2s;
        }
        
        .btn-login:hover {
            background: #D85A20;
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(240, 112, 48, 0.4);
        }
        
        .signup-text {
            text-align: center;
            margin-top: 1.5rem;
            color: #6b7280;
        }
        
        .signup-link {
            color: #F07030;
            text-decoration: none;
            font-weight: 600;
        }
        
        .signup-link:hover {
            color: #D85A20;
            text-decoration: underline;
        }
        
        .alert {
            border-radius: 0.75rem;
            margin-bottom: 1.5rem;
        }
        
        .alert-danger {
            background-color: #fee2e2;
            border-color: #fecaca;
            color: #991b1b;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

    <!-- Main Content -->
    <div class="main-content">
        <div class="login-card">
            <h1 class="login-title">HAMBOOKS</h1>
            <p class="login-subtitle">맛집을 읽다, 예약을 잇다</p>
            
            <!-- 에러 메시지 표시 -->
            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <strong>⚠️ ${error}</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>
            
            <form id="loginForm" method="post" action="${pageContext.request.contextPath}/login">
                <div class="mb-3">
                    <div class="input-icon">
                        <input type="text" 
                               class="form-control" 
                               id="userId" 
                               name="userId" 
                               value="${userId}"
                               placeholder="아이디를 입력하세요"
                               required>
                    </div>
                </div>
                
                <div class="mb-3">
                    <div class="input-icon password-icon" style="position: relative;">
                        <input type="password" 
                               class="form-control" 
                               id="password" 
                               name="password" 
                               placeholder="비밀번호를 입력하세요"
                               required>
                        <span class="password-toggle" onclick="togglePassword()">
                            <img src="/images/icon/닫힌눈.png" width="30" alt="비밀번호 보기">
                        </span>
                    </div>
                </div>
                
                <div class="clearfix">
                    <div class="form-check float-start">
                        <input class="form-check-input" type="checkbox" id="remember" name="remember">
                        <label class="form-check-label" for="remember">
                            로그인 상태 유지
                        </label>
                    </div>
                    <a href="#" class="forgot-link">아이디 / 비밀번호 찾기</a>
                </div>
                
                <button type="submit" class="btn-login">로그인</button>
                
                <p class="signup-text">
                    아직 회원이 아니신가요? <a href="http://localhost:6805/signup" class="signup-link">회원가입</a>
                </p>
            </form>
        </div>
    </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    function togglePassword() {
        const passwordInput = document.getElementById('password');
        const toggle = document.querySelector('.password-toggle');

        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            toggle.innerHTML = '<img src="/images/icon/뜬눈.png" width="30" alt="비밀번호 숨기기">';
        } else {
            passwordInput.type = 'password';
            toggle.innerHTML = '<img src="/images/icon/닫힌눈.png" width="30" alt="비밀번호 보기">';
        }
    }
    
    const header = document.getElementById('header');
    window.addEventListener('scroll', () => {
        if (window.scrollY > 20) {
            header.classList.add('scrolled');
        } else {
            header.classList.remove('scrolled');
        }
    });
    
    // 클라이언트 측 유효성 검사
    document.getElementById('loginForm').addEventListener('submit', function (e) {
        const userId = document.getElementById('userId').value.trim();
        const password = document.getElementById('password').value.trim();

        if (!userId) {
            alert('아이디를 입력해주세요.');
            e.preventDefault();
            document.getElementById('userId').focus();
            return false;
        }

        if (!password) {
            alert('비밀번호를 입력해주세요.');
            e.preventDefault();
            document.getElementById('password').focus();
            return false;
        }
    });
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