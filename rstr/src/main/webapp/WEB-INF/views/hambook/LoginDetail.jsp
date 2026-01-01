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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <style>
        /* 1. 브라우저 기본 눈 아이콘 숨기기 (필수) */
        input::-ms-reveal, input::-ms-clear { display: none; }
        
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
        
        .form-control {
            padding: 0.875rem 1rem;
            border: 2px solid #e5e7eb;
            border-radius: 0.75rem;
            font-size: 1rem;
            transition: all 0.2s;
            padding-left: 2.75rem;
            padding-right: 2.5rem; /* 오른쪽 눈 아이콘 공간 확보 */
        }
        
        .form-control:focus {
            border-color: #F07030;
            box-shadow: 0 0 0 3px rgba(240, 112, 48, 0.1);
        }
        
        .input-icon {
            position: relative;
        }
        
        .input-icon > i.start-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            font-size: 1.2rem;
            z-index: 5;
            color: #6b7280;
        }

        /* 2. 클릭 영역 확실하게 잡기 */
        .password-toggle {
            position: absolute;
            right: 0;      /* 오른쪽 끝에 붙임 */
            top: 0;
            height: 100%;  /* 높이를 인풋창과 맞춤 */
            width: 40px;   /* 클릭하기 편하게 넓게 잡음 */
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            z-index: 100;  /* 무조건 맨 위에 오도록 설정 */
            color: #6b7280;
        }
        
        .password-toggle:hover {
            color: #F07030;
        }
        
        .password-toggle i {
            font-size: 1.3rem;
        }
        
        .form-check { margin: 1.5rem 0; }
        
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
        
        .forgot-link:hover { color: #D85A20; text-decoration: underline; }
        
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
        .signup-link:hover { color: #D85A20; text-decoration: underline; }
        
        .alert-danger {
            background-color: #fee2e2;
            border-color: #fecaca;
            color: #991b1b;
        }
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <div class="main-content">
        <div class="login-card">
            <h1 class="login-title">HAMBOOKS</h1>
            <p class="login-subtitle">맛집을 읽다, 예약을 잇다</p>
            
            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <strong>⚠️ ${error}</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>
            
            <form id="loginForm" method="post" action="${pageContext.request.contextPath}/login">
                <div class="mb-3">
                    <div class="input-icon">
                        <i class="bi bi-person-fill start-icon"></i>
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
                    <div class="input-icon">
                        <i class="bi bi-lock-fill start-icon"></i>
                        <input type="password" 
                               class="form-control" 
                               id="password" 
                               name="password" 
                               placeholder="비밀번호를 입력하세요"
                               required>
                        <span class="password-toggle" id="passwordToggle">
                            <i class="bi bi-eye-slash"></i>
                        </span>
                    </div>
                </div>
                
                <div class="clearfix">
                    <div class="form-check float-start">
                        <input class="form-check-input" type="checkbox" id="remember" name="remember">
                        <label class="form-check-label" for="remember">로그인 상태 유지</label>
                    </div>
                    <a href="#" class="forgot-link">아이디 / 비밀번호 찾기</a>
                </div>
                
                <button type="submit" class="btn-login">로그인</button>
                
                <p class="signup-text">
                    아직 회원이 아니신가요? <a href="${pageContext.request.contextPath}/signup" class="signup-link">회원가입</a>
                </p>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        // console.log("스크립트 로드됨"); // 디버깅용

        const passwordToggle = document.getElementById('passwordToggle');
        const passwordInput = document.getElementById('password');
        
        if (passwordToggle && passwordInput) {
            passwordToggle.addEventListener('click', function(e) {
                // 이벤트 버블링 방지 및 기본 동작 막기
                e.preventDefault();
                e.stopPropagation();

                const icon = passwordToggle.querySelector('i');
                
                if (passwordInput.type === 'password') {
                    passwordInput.type = 'text';
                    icon.classList.remove('bi-eye-slash');
                    icon.classList.add('bi-eye');
                } else {
                    passwordInput.type = 'password';
                    icon.classList.remove('bi-eye');
                    icon.classList.add('bi-eye-slash');
                }
            });
        }
        
        // 헤더 스크롤 효과
        const header = document.getElementById('header');
        if (header) {
            window.addEventListener('scroll', function() {
                if (window.scrollY > 20) {
                    header.classList.add('scrolled');
                } else {
                    header.classList.remove('scrolled');
                }
            });
        }
        
        // 유효성 검사
        const loginForm = document.getElementById('loginForm');
        if (loginForm) {
            loginForm.addEventListener('submit', function(e) {
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
        }
    });
    </script>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>