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
    header {
        position: sticky;
        top: 0;
        z-index: 1000;
        background: rgba(255, 255, 255, 0.8);
        backdrop-filter: blur(8px);
        transition: all 0.3s ease;
    }

    header.scrolled {
        background: rgba(255, 255, 255, 0.95);
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .header-container {
        max-width: 1280px;
        margin: 0 auto;
        padding: 0 1.5rem;
        display: flex;
        align-items: center;
        justify-content: space-between;
        height: 80px;
    }

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
    </style>
</head>
<body>
    <!-- Header -->
<header id="header">
    <div class="header-container">
        <a href="http://localhost:6805/home" class="logo">
            <img src="/images/icon/logo.png" width="180px" height="50px">
        </a>
        
        <nav class="nav-menu">
            <a href="http://localhost:6805/home" class="nav-link">
                <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
                </svg>
                <span>Home</span>
            </a>
            <a href="http://localhost:6805/login" class="nav-link">
                <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                </svg>
                <span>Login</span>
            </a>
        </nav>
    </div>
</header>

    <!-- Main Content -->
    <div class="main-content">
        <div class="login-card">
            <h1 class="login-title">HAMBOOKS</h1>
            <p class="login-subtitle">맛집을 읽다, 예약을 잇다</p>
            
            <form id="loginForm" method="post" action="/login">
                <div class="mb-3">
                    <div class="input-icon">
                        <input type="text" class="form-control" placeholder="아이디를 입력하세요">
                    </div>
                </div>
                
                <div class="mb-3">
                    <div class="input-icon password-icon" style="position: relative;">
                        <input type="password" class="form-control" id="password" placeholder="비밀번호를 입력하세요">
                        <span class="password-toggle" onclick="togglePassword()">
						    <img src="/images/icon/닫힌눈.png" width="30">
						</span>
                    </div>
                </div>
                
                <div class="clearfix">
                    <div class="form-check float-start">
                        <input class="form-check-input" type="checkbox" id="remember">
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

    <!-- Footer -->
    <footer class="py-5 bg-dark">
        <div class="container">
            <p class="m-0 text-center text-white">
                Copyright &copy; HamBooks 2025
            </p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    function togglePassword() {
        const passwordInput = document.getElementById('password');
        const toggle = document.querySelector('.password-toggle');

        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            toggle.innerHTML = '<img src="/images/icon/뜬눈.png" width="30">';
        } else {
            passwordInput.type = 'password';
            toggle.innerHTML = '<img src="/images/icon/닫힌눈.png" width="30">';
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
        document.getElementById('loginForm').addEventListener('submit', function (e) {
            const userId = document.getElementById('userId').value.trim();
            const password = document.getElementById('password').value.trim();

            if (!userId) {
                alert('아이디를 입력해주세요.');
                e.preventDefault();
                return;
            }

            if (!password) {
                alert('비밀번호를 입력해주세요.');
                e.preventDefault();
                return;
            }
        });
    </script>
</body>
</html>