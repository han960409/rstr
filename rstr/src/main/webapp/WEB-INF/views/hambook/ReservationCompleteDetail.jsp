<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약 완료</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
        }
        
        .main-content {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
        }
        
        .image-container {
            background: white;
            border-radius: 1rem;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            padding: 2rem;
            margin-bottom: 2rem;
            height: 340px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .image-container img {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
        }
        
        .btn-custom {
            padding: 1.5rem;
            font-size: 1.1rem;
            font-weight: 600;
            border-radius: 0.75rem;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            transition: all 0.2s;
        }
        
		.btn-confirm {
		    background: #334155; /* 차콜 그레이 (단색) */
		    color: white;
		    border: none;
		}
		
		.btn-confirm:hover {
		    background: #1e293b; /* 더 어두운 블랙에 가까운 색 */
		    color: white;
		    transform: translateY(-2px);
		    box-shadow: 0 6px 16px rgba(30, 41, 59, 0.4);
		}
        
		.btn-invite {
		    /* 깊은 밤하늘색 -> 짙은 보라빛 */
		    background: linear-gradient(135deg, #4338ca 0%, #312e81 100%);
		    color: white;
		    border: none;
		}
		
		.btn-invite:hover {
		    background: linear-gradient(135deg, #3730a3 0%, #1e1b4b 100%);
		    transform: translateY(-2px);
		    box-shadow: 0 6px 16px rgba(49, 46, 129, 0.4);
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
                            <a class="nav-link active" href="/home">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/">로그인</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <!-- Main Content -->
    <div class="main-content">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <!-- 예약 완료 이미지 -->
                    <div class="image-container">
                        <img src="/upload/reserv.png" alt="예약 완료">
                    </div>

                    <!-- 버튼 영역 -->
					<div class="row g-4">
					    <div class="col-md-6">
					        <a href="/reservations/${reservationId}" class="btn btn-custom btn-confirm w-100 d-flex align-items-center justify-content-center">
					            📅 예약 확인
					        </a>
					    </div>
					    <div class="col-md-6">
					        <button class="btn btn-custom btn-invite w-100">
					            ✉️ 초대장 보내기
					        </button>
					    </div>
					</div>
                </div>
            </div>
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
</body>
</html>