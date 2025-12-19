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
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
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
            color: #5b21b6;
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
            border-color: #5b21b6;
            box-shadow: 0 0 0 3px rgba(91, 33, 182, 0.1);
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
            background-color: #5b21b6;
            border-color: #5b21b6;
        }
        
        .forgot-link {
            color: #5b21b6;
            text-decoration: none;
            font-weight: 600;
            float: right;
        }
        
        .forgot-link:hover {
            color: #4c1d95;
            text-decoration: underline;
        }
        
        .btn-login {
            width: 100%;
            padding: 1rem;
            background: #5b21b6;
            color: white;
            border: none;
            border-radius: 0.75rem;
            font-size: 1.1rem;
            font-weight: 600;
            margin-top: 1rem;
            transition: all 0.2s;
        }
        
        .btn-login:hover {
            background: #4c1d95;
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(91, 33, 182, 0.4);
        }
        
        .signup-text {
            text-align: center;
            margin-top: 1.5rem;
            color: #6b7280;
        }
        
        .signup-link {
            color: #5b21b6;
            text-decoration: none;
            font-weight: 600;
        }
        
        .signup-link:hover {
            color: #4c1d95;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="/home">
                    <img src="/upload/hambooks.png" width="180px" height="60px" alt="HamBooks">
                </a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="/home">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="/">로그인</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <!-- Main Content -->
    <div class="main-content">
        <div class="login-card">
            <h1 class="login-title">HAMBOOKS</h1>
            <p class="login-subtitle">맛집을 읽다, 예약을 잇다</p>
            
            <form>
                <div class="mb-3">
                    <div class="input-icon">
                        <input type="text" class="form-control" placeholder="아이디를 입력하세요">
                    </div>
                </div>
                
                <div class="mb-3">
                    <div class="input-icon password-icon" style="position: relative;">
                        <input type="password" class="form-control" id="password" placeholder="비밀번호를 입력하세요">
                        <span class="password-toggle" onclick="togglePassword()">👁️</span>
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
                    아직 회원이 아니신가요? <a href="#" class="signup-link">회원가입</a>
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
                toggle.textContent = '🙈';
            } else {
                passwordInput.type = 'password';
                toggle.textContent = '👁️';
            }
        }
    </script>
</body>
</html>