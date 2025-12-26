<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>나의 예약 - HamBooks</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background-color: #f8f9fa;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
        }
        
        main {
            flex: 1;
        }

        .sidebar {
            background-color: #fff;
            border-right: 1px solid #e9ecef;
            min-height: 600px;
        }

        .sidebar-item {
            padding: 20px 30px;
            border-bottom: 1px solid #f1f3f5;
            cursor: pointer;
            transition: all 0.2s ease;
            color: #495057;
            font-size: 15px;
            font-weight: 500;
        }

        .sidebar-item:hover {
            background-color: #f8f9fa;
            color: #212529;
        }

        .sidebar-item.active {
            background-color: #212529;
            color: white;
            border-left: 3px solid #212529;
        }

        .content-area {
            padding: 50px;
            background-color: #fff;
            margin: 20px;
            border-radius: 12px;
        }

        .page-title {
            font-size: 28px;
            font-weight: 700;
            color: #212529;
            margin-bottom: 40px;
        }

        .tab-buttons {
            display: flex;
            gap: 0;
            margin-bottom: 40px;
            border-bottom: 2px solid #e9ecef;
        }

        .tab-button {
            padding: 16px 32px;
            border: none;
            background: transparent;
            cursor: pointer;
            transition: all 0.2s ease;
            font-weight: 600;
            color: #868e96;
            font-size: 15px;
            position: relative;
        }

        .tab-button:hover {
            color: #212529;
        }

        .tab-button.active {
            color: #212529;
        }

        .tab-button.active::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            right: 0;
            height: 2px;
            background-color: #212529;
        }

        .tab-content {
            display: none;
        }

        .tab-content.active {
            display: block;
            animation: fadeIn 0.3s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .medicine-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
        }

        .medicine-table th {
            padding: 16px;
            text-align: left;
            font-weight: 600;
            color: #495057;
            font-size: 14px;
            border-bottom: 1px solid #e9ecef;
        }

        .medicine-table th:first-child {
            text-align: center;
        }

        .medicine-table td {
            padding: 20px 16px;
            border-bottom: 1px solid #f1f3f5;
            color: #495057;
            font-size: 14px;
        }

        .medicine-table td:first-child {
            text-align: center;
        }

        .medicine-row {
            background-color: white;
            transition: all 0.2s ease;
        }

        .medicine-row:hover {
            background-color: #f8f9fa;
        }

        .medicine-row img {
            border-radius: 8px;
            object-fit: cover;
        }

        .btn-cancel {
            padding: 8px 20px;
            background-color: #212529;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 6px;
            font-weight: 500;
            font-size: 13px;
            transition: all 0.2s ease;
        }

        .btn-cancel:hover {
            background-color: #000;
        }

        .status-badge {
            padding: 6px 12px;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 500;
        }

        .status-completed {
            background-color: #e9ecef;
            color: #495057;
        }

        .status-cancelled {
            background-color: #fff5f5;
            color: #e03131;
        }

        /* 모달 스타일 */
        .modal-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
            z-index: 1000;
            animation: fadeIn 0.2s ease;
        }

        .modal-overlay.show {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background: white;
            border-radius: 16px;
            padding: 0;
            max-width: 480px;
            width: 90%;
            box-shadow: 0 20px 25px -5px rgba(0,0,0,0.1), 0 10px 10px -5px rgba(0,0,0,0.04);
            animation: slideUp 0.3s ease;
        }

        @keyframes slideUp {
            from { 
                opacity: 0; 
                transform: translateY(20px); 
            }
            to { 
                opacity: 1; 
                transform: translateY(0); 
            }
        }

        .modal-header {
            padding: 32px 32px 24px;
            border-bottom: 1px solid #f1f3f5;
        }

        .modal-header h3 {
            color: #212529;
            font-weight: 700;
            font-size: 20px;
            margin-bottom: 8px;
        }

        .modal-header p {
            color: #868e96;
            font-size: 14px;
            margin: 0;
        }

        .modal-body {
            padding: 24px 32px;
        }

        .reason-group label {
            display: block;
            margin-bottom: 16px;
            color: #495057;
            font-weight: 600;
            font-size: 14px;
        }

        .reason-option {
            display: flex;
            align-items: center;
            padding: 14px 16px;
            margin-bottom: 8px;
            border: 1.5px solid #e9ecef;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.2s ease;
            background-color: white;
        }

        .reason-option:hover {
            border-color: #212529;
            background-color: #f8f9fa;
        }

        .reason-option input[type="radio"] {
            margin-right: 12px;
            width: 18px;
            height: 18px;
            cursor: pointer;
            accent-color: #212529;
        }

        .reason-option span {
            color: #495057;
            font-size: 14px;
        }

        .reason-option.selected {
            border-color: #212529;
            background-color: #f8f9fa;
        }

        .modal-footer {
            padding: 20px 32px 32px;
            display: flex;
            gap: 12px;
            justify-content: flex-end;
        }

        .modal-btn {
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            font-size: 14px;
            transition: all 0.2s ease;
        }

        .btn-modal-cancel {
            background-color: #212529;
            color: white;
        }

        .btn-modal-cancel:hover {
            background-color: #000;
        }

        .btn-modal-close {
            background-color: #f1f3f5;
            color: #495057;
        }

        .btn-modal-close:hover {
            background-color: #e9ecef;
        }

        .empty-state {
            text-align: center;
            padding: 80px 20px;
            color: #868e96;
        }

        .empty-state-icon {
            font-size: 48px;
            margin-bottom: 16px;
        }

        .empty-state-text {
            font-size: 16px;
            font-weight: 500;
        }
    </style>
</head>
<body>
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

    <main>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2 sidebar p-0">
                    <div class="sidebar-item">회원정보 수정</div>
                    <div class="sidebar-item active">나의 예약</div>
                    <div class="sidebar-item">내가 쓴 리뷰 관리</div>
                    <div class="sidebar-item">찜목록</div>
                    <div class="sidebar-item">1:1 문의</div>
                    <div style="flex: 1;"></div>
                    <div class="sidebar-item" style="border-top: 1px solid #f1f3f5;">회원탈퇴</div>
                </div>

                <div class="col-md-10">
                    <div class="content-area">
                        <h1 class="page-title">나의 예약</h1>

                        <div class="tab-buttons">
                            <button class="tab-button active" data-tab="reservation">방문 예정</button>
                            <button class="tab-button" data-tab="completed">방문 완료</button>
                            <button class="tab-button" data-tab="cancelled">예약 취소</button>
                        </div>

                        <div class="tab-content active" id="reservation-content">
                            <table class="medicine-table">
                                <thead>
                                    <tr>
                                        <th>이미지</th>
                                        <th>가게 이름</th>
                                        <th>예약 지점</th>
                                        <th>방문 날짜</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="medicine-row">
                                        <td><img src="https://via.placeholder.com/60" alt="가게" width="60" height="60"></td>
                                        <td style="font-weight: 600; color: #212529;">츄플러스</td>
                                        <td>강남점</td>
                                        <td>2025-12-20 14:00</td>
                                        <td><button class="btn-cancel" onclick="showCancelModal('서울약국', '강남점', '2025-12-20 14:00')">취소</button></td>
                                    </tr>
                                    <tr class="medicine-row">
                                        <td><img src="https://via.placeholder.com/60" alt="가게" width="60" height="60"></td>
                                        <td style="font-weight: 600; color: #212529;">곰곰</td>
                                        <td>홍대점</td>
                                        <td>2025-12-22 10:00</td>
                                        <td><button class="btn-cancel" onclick="showCancelModal('건강약국', '홍대점', '2025-12-22 10:00')">취소</button></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="tab-content" id="completed-content">
                            <table class="medicine-table">
                                <thead>
                                    <tr>
                                        <th>이미지</th>
                                        <th>가게 이름</th>
                                        <th>예약 지점</th>
                                        <th>방문 날짜</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="medicine-row">
                                        <td><img src="https://via.placeholder.com/60" alt="가게" width="60" height="60"></td>
                                        <td style="font-weight: 600; color: #212529;">곰곰</td>
                                        <td>신촌점</td>
                                        <td>2025-12-10 15:30</td>
                                        <td><span class="status-badge status-completed">완료</span></td>
                                    </tr>
                                    <tr class="medicine-row">
                                        <td><img src="https://via.placeholder.com/60" alt="가게" width="60" height="60"></td>
                                        <td style="font-weight: 600; color: #212529;">츄플러스</td>
                                        <td>압구정점</td>
                                        <td>2025-12-05 11:00</td>
                                        <td><span class="status-badge status-completed">완료</span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="tab-content" id="cancelled-content">
                            <table class="medicine-table">
                                <thead>
                                    <tr>
                                        <th>이미지</th>
                                        <th>가게 이름</th>
                                        <th>예약 지점</th>
                                        <th>방문 날짜</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="medicine-row">
                                        <td><img src="https://via.placeholder.com/60" alt="가게" width="60" height="60"></td>
                                        <td style="font-weight: 600; color: #212529;">스시하루</td>
                                        <td>종로점</td>
                                        <td>2025-12-15 16:00</td>
                                        <td><span class="status-badge status-cancelled">취소됨</span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <footer class="py-5 bg-dark">
        <div class="container">
            <p class="m-0 text-center text-white">
                Copyright &copy; HamBooks 2025
            </p>
        </div>
    </footer>

    <!-- 취소 모달 -->
    <div class="modal-overlay" id="cancelModal">
        <div class="modal-content">
            <div class="modal-header">
                <h3>예약을 취소하시겠습니까?</h3>
                <p id="reservationInfo"></p>
            </div>

            <div class="modal-body">
                <div class="reason-group">
                    <label>취소 사유를 선택해주세요</label>
                    <div class="reason-option" onclick="selectReason(this, '일정 변경')">
                        <input type="radio" name="cancel_reason" value="일정 변경">
                        <span>일정 변경</span>
                    </div>
                    <div class="reason-option" onclick="selectReason(this, '단순 변심')">
                        <input type="radio" name="cancel_reason" value="단순 변심">
                        <span>단순 변심</span>
                    </div>
                    <div class="reason-option" onclick="selectReason(this, '다른 약국 이용')">
                        <input type="radio" name="cancel_reason" value="다른 약국 이용">
                        <span>다른 약국 이용</span>
                    </div>
                    <div class="reason-option" onclick="selectReason(this, '예약 오류')">
                        <input type="radio" name="cancel_reason" value="예약 오류">
                        <span>예약 오류</span>
                    </div>
                    <div class="reason-option" onclick="selectReason(this, '기타')">
                        <input type="radio" name="cancel_reason" value="기타">
                        <span>기타</span>
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <button class="modal-btn btn-modal-close" onclick="closeModal()">닫기</button>
                <button class="modal-btn btn-modal-cancel" onclick="confirmCancel()">예약 취소</button>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        let currentReservation = null;
        let selectedReason = null;

        function showCancelModal(storeName, branch, date) {
            currentReservation = { storeName, branch, date };
            document.getElementById('reservationInfo').textContent = 
                `${storeName} (${branch}) - ${date}`;
            document.getElementById('cancelModal').classList.add('show');
            
            document.querySelectorAll('.reason-option').forEach(option => {
                option.classList.remove('selected');
            });
            document.querySelectorAll('input[name="cancel_reason"]').forEach(radio => {
                radio.checked = false;
            });
            selectedReason = null;
        }

        function closeModal() {
            document.getElementById('cancelModal').classList.remove('show');
            currentReservation = null;
            selectedReason = null;
        }

        function selectReason(element, reason) {
            document.querySelectorAll('.reason-option').forEach(option => {
                option.classList.remove('selected');
            });
            
            element.classList.add('selected');
            element.querySelector('input[type="radio"]').checked = true;
            selectedReason = reason;
        }

        function confirmCancel() {
            if (!selectedReason) {
                alert('취소 사유를 선택해주세요.');
                return;
            }

            if (confirm(`${currentReservation.storeName} 예약을 취소하시겠습니까?\n사유: ${selectedReason}`)) {
                alert('예약이 취소되었습니다.');
                closeModal();
            }
        }

        document.getElementById('cancelModal').addEventListener('click', function(e) {
            if (e.target === this) {
                closeModal();
            }
        });

        document.querySelectorAll('.tab-button').forEach(button => {
            button.addEventListener('click', function() {
                document.querySelectorAll('.tab-button').forEach(btn => {
                    btn.classList.remove('active');
                });
                
                document.querySelectorAll('.tab-content').forEach(content => {
                    content.classList.remove('active');
                });
                
                this.classList.add('active');
                
                const tabName = this.getAttribute('data-tab');
                document.getElementById(tabName + '-content').classList.add('active');
            });
        });

        document.querySelectorAll('.sidebar-item').forEach(item => {
            item.addEventListener('click', function() {
                document.querySelectorAll('.sidebar-item').forEach(i => {
                    i.classList.remove('active');
                });
                this.classList.add('active');
            });
        });
    </script>
</body>
</html>