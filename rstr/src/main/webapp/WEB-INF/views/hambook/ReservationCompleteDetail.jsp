<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약 완료 - HamBooks</title>
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
        
        .confirmation-card {
            background: white;
            border-radius: 1.5rem;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            padding: 3rem;
            max-width: 600px;
            width: 100%;
        }
        
        .success-icon {
            text-align: center;
            margin-bottom: 1.5rem;
        }
        
        .success-icon svg {
            width: 80px;
            height: 80px;
            color: #10b981;
            animation: scaleIn 0.5s ease-out;
        }
        
        @keyframes scaleIn {
            0% {
                transform: scale(0);
                opacity: 0;
            }
            50% {
                transform: scale(1.1);
            }
            100% {
                transform: scale(1);
                opacity: 1;
            }
        }
        
        .confirmation-title {
            font-size: 2rem;
            font-weight: bold;
            color: #F07030;
            text-align: center;
            margin-bottom: 0.5rem;
        }
        
        .confirmation-subtitle {
            text-align: center;
            color: #6b7280;
            font-size: 1rem;
            margin-bottom: 2rem;
        }
        
        .reservation-info {
            background: #f9fafb;
            border-radius: 1rem;
            padding: 1.5rem;
            margin-bottom: 2rem;
        }
        
        .info-row {
            display: flex;
            justify-content: space-between;
            padding: 0.75rem 0;
            border-bottom: 1px solid #e5e7eb;
        }
        
        .info-row:last-child {
            border-bottom: none;
        }
        
        .info-label {
            font-weight: 600;
            color: #374151;
        }
        
        .info-value {
            color: #6b7280;
            text-align: right;
        }
        
        .highlight {
            color: #F07030;
            font-weight: 600;
        }
        
        .button-group {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
        }
        
        .btn-primary-custom {
            flex: 1;
            padding: 1rem;
            background: #F07030;
            color: white;
            border: none;
            border-radius: 0.75rem;
            font-size: 1rem;
            font-weight: 600;
            transition: all 0.2s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }
        
        .btn-primary-custom:hover {
            background: #D85A20;
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(240, 112, 48, 0.4);
        }
        
        .btn-secondary-custom {
            flex: 1;
            padding: 1rem;
            background: white;
            color: #F07030;
            border: 2px solid #F07030;
            border-radius: 0.75rem;
            font-size: 1rem;
            font-weight: 600;
            transition: all 0.2s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }
        
        .btn-secondary-custom:hover {
            background: #FFF5F0;
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(240, 112, 48, 0.2);
        }
        
        .btn-icon {
            width: 20px;
            height: 20px;
        }
        
        .notice-box {
            background: #FFF5F0;
            border-left: 4px solid #F07030;
            padding: 1rem;
            border-radius: 0.5rem;
            margin-top: 1.5rem;
        }
        
        .notice-title {
            font-weight: 600;
            color: #F07030;
            margin-bottom: 0.5rem;
        }
        
        .notice-text {
            color: #6b7280;
            font-size: 0.9rem;
            line-height: 1.5;
        }

        /* 공유 모달 스타일 */
        .share-modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 2000;
            align-items: center;
            justify-content: center;
        }

        .share-modal.active {
            display: flex;
        }

        .share-content {
            background: white;
            border-radius: 1.5rem;
            padding: 2rem;
            max-width: 400px;
            width: 90%;
            animation: slideUp 0.3s ease-out;
        }

        @keyframes slideUp {
            from {
                transform: translateY(50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .share-title {
            font-size: 1.5rem;
            font-weight: bold;
            color: #374151;
            margin-bottom: 1.5rem;
            text-align: center;
        }

        .share-options {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .share-option {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 0.5rem;
            padding: 1rem;
            border-radius: 0.75rem;
            cursor: pointer;
            transition: all 0.2s;
        }

        .share-option:hover {
            background: #f9fafb;
            transform: translateY(-2px);
        }

        .share-icon {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
        }

        .kakao { background: #FEE500; }
        .facebook { background: #1877F2; color: white; }
        .twitter { background: #1DA1F2; color: white; }
        .link { background: #6B7280; color: white; }

        .share-label {
            font-size: 0.875rem;
            color: #374151;
            font-weight: 500;
        }

        .modal-close {
            width: 100%;
            padding: 0.75rem;
            background: #e5e7eb;
            color: #374151;
            border: none;
            border-radius: 0.75rem;
            font-weight: 600;
            cursor: pointer;
        }

        .modal-close:hover {
            background: #d1d5db;
        }

        @media (max-width: 768px) {
            .confirmation-card {
                padding: 2rem 1.5rem;
            }
            
            .button-group {
                flex-direction: column;
            }
            
            .share-options {
                grid-template-columns: repeat(2, 1fr);
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />

    <!-- Main Content -->
    <div class="main-content">
        <div class="confirmation-card">
            <div class="success-icon">
                <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
            </div>
            
            <h1 class="confirmation-title">예약이 완료되었습니다!</h1>
            <p class="confirmation-subtitle">예약 정보를 확인해주세요</p>
            
            <div class="reservation-info">
                <div class="info-row">
                    <span class="info-label">예약번호</span>
                    <span class="info-value highlight">HB-20251226-001</span>
                </div>
                <div class="info-row">
                    <span class="info-label">예약매장</span>
                    <span class="info-value">함께하는 맛집</span>
                </div>
                <div class="info-row">
                    <span class="info-label">예약일시</span>
                    <span class="info-value">2025년 12월 28일 오후 7:00</span>
                </div>
                <div class="info-row">
                    <span class="info-label">인원</span>
                    <span class="info-value">4명</span>
                </div>
                <div class="info-row">
                    <span class="info-label">예약자명</span>
                    <span class="info-value">홍길동</span>
                </div>
                <div class="info-row">
                    <span class="info-label">연락처</span>
                    <span class="info-value">010-1234-5678</span>
                </div>
            </div>
            
            <div class="button-group">
                <button class="btn-primary-custom" onclick="checkReservation()">
                    <svg class="btn-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2" />
                    </svg>
                    예약 확인
                </button>
                <button class="btn-secondary-custom" onclick="openShareModal()">
                    <svg class="btn-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.684 13.342C8.886 12.938 9 12.482 9 12c0-.482-.114-.938-.316-1.342m0 2.684a3 3 0 110-2.684m0 2.684l6.632 3.316m-6.632-6l6.632-3.316m0 0a3 3 0 105.367-2.684 3 3 0 00-5.367 2.684zm0 9.316a3 3 0 105.368 2.684 3 3 0 00-5.368-2.684z" />
                    </svg>
                    초대장 보내기
                </button>
            </div>
            
            <div class="notice-box">
                <div class="notice-title">📌 예약 안내</div>
                <div class="notice-text">
                    • 예약 시간 10분 전까지 도착해주세요<br>
                    • 예약 변경은 방문 24시간 전까지 가능합니다<br>
                    • 노쇼 발생 시 향후 예약이 제한될 수 있습니다
                </div>
            </div>
        </div>
    </div>

    <!-- 공유 모달 -->
    <div class="share-modal" id="shareModal">
        <div class="share-content">
            <h3 class="share-title">초대장 보내기</h3>
            <div class="share-options">
                <div class="share-option" onclick="shareKakao()">
                    <div class="share-icon kakao">💬</div>
                    <span class="share-label">카카오톡</span>
                </div>
                <div class="share-option" onclick="shareFacebook()">
                    <div class="share-icon facebook">f</div>
                    <span class="share-label">페이스북</span>
                </div>
                <div class="share-option" onclick="shareTwitter()">
                    <div class="share-icon twitter">🐦</div>
                    <span class="share-label">트위터</span>
                </div>
                <div class="share-option" onclick="copyLink()">
                    <div class="share-icon link">🔗</div>
                    <span class="share-label">링크 복사</span>
                </div>
            </div>
            <button class="modal-close" onclick="closeShareModal()">닫기</button>
        </div>
    </div>

    <!-- Footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        // Header scroll effect
        const header = document.getElementById('header');
        window.addEventListener('scroll', () => {
            if (window.scrollY > 20) {
                header.classList.add('scrolled');
            } else {
                header.classList.remove('scrolled');
            }
        });

        // 예약 확인 페이지로 이동
        function checkReservation() {
            // 예약 번호를 가지고 예약 상세 페이지로 이동
            window.location.href = '/reservation/detail?reservationNo=HB-20251226-001';
        }

        // 공유 모달 열기
        function openShareModal() {
            document.getElementById('shareModal').classList.add('active');
        }

        // 공유 모달 닫기
        function closeShareModal() {
            document.getElementById('shareModal').classList.remove('active');
        }

        // 모달 외부 클릭시 닫기
        document.getElementById('shareModal').addEventListener('click', function(e) {
            if (e.target === this) {
                closeShareModal();
            }
        });

        // 카카오톡 공유
        function shareKakao() {
            // 카카오 SDK 초기화 (본인의 JavaScript 키로 교체 필요)
            if (typeof Kakao !== 'undefined' && !Kakao.isInitialized()) {
                Kakao.init('YOUR_JAVASCRIPT_KEY'); // 본인의 카카오 JavaScript 키 입력
            }
            
            Kakao.Share.sendDefault({
                objectType: 'feed',
                content: {
                    title: 'HamBooks 예약 완료',
                    description: '함께하는 맛집에서 만나요!\n일시: 2025년 12월 28일 오후 7:00\n인원: 4명',
                    imageUrl: 'http://localhost:6805/images/icon/logo.png',
                    link: {
                        mobileWebUrl: 'http://localhost:6805/reservation/detail?reservationNo=HB-20251226-001',
                        webUrl: 'http://localhost:6805/reservation/detail?reservationNo=HB-20251226-001'
                    }
                },
                buttons: [
                    {
                        title: '예약 확인하기',
                        link: {
                            mobileWebUrl: 'http://localhost:6805/reservation/detail?reservationNo=HB-20251226-001',
                            webUrl: 'http://localhost:6805/reservation/detail?reservationNo=HB-20251226-001'
                        }
                    }
                ]
            });
        }

        // 페이스북 공유
        function shareFacebook() {
            const url = encodeURIComponent('http://localhost:6805/reservation/detail?reservationNo=HB-20251226-001');
            const text = encodeURIComponent('함께하는 맛집 예약 완료! 2025년 12월 28일 오후 7:00에 만나요!');
            window.open(`https://www.facebook.com/sharer/sharer.php?u=${url}&quote=${text}`, '_blank', 'width=600,height=400');
        }

        // 트위터 공유
        function shareTwitter() {
            const url = encodeURIComponent('http://localhost:6805/reservation/detail?reservationNo=HB-20251226-001');
            const text = encodeURIComponent('함께하는 맛집 예약 완료! 2025년 12월 28일 오후 7:00에 만나요! #HamBooks #맛집예약');
            window.open(`https://twitter.com/intent/tweet?url=${url}&text=${text}`, '_blank', 'width=600,height=400');
        }

        // 링크 복사
        function copyLink() {
            const link = 'http://localhost:6805/reservation/detail?reservationNo=HB-20251226-001';
            
            // 클립보드 API 사용
            if (navigator.clipboard) {
                navigator.clipboard.writeText(link).then(() => {
                    alert('링크가 복사되었습니다!');
                    closeShareModal();
                }).catch(err => {
                    console.error('복사 실패:', err);
                    fallbackCopyLink(link);
                });
            } else {
                fallbackCopyLink(link);
            }
        }

        // 클립보드 API를 지원하지 않는 브라우저를 위한 대체 방법
        function fallbackCopyLink(link) {
            const textarea = document.createElement('textarea');
            textarea.value = link;
            textarea.style.position = 'fixed';
            textarea.style.opacity = '0';
            document.body.appendChild(textarea);
            textarea.select();
            try {
                document.execCommand('copy');
                alert('링크가 복사되었습니다!');
                closeShareModal();
            } catch (err) {
                alert('링크 복사에 실패했습니다. 수동으로 복사해주세요: ' + link);
            }
            document.body.removeChild(textarea);
        }
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