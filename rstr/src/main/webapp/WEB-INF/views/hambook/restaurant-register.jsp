<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>함북스 - 식당 등록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        header {
            position: sticky;
            top: 0;
            left: 0;
            right: 0;
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
        body {
            background: linear-gradient(135deg, #FFF9E6 0%, #FFE8CC 100%);
            min-height: 100vh;
        }
        .register-container {
            max-width: 900px;
            margin: 2rem auto;
            background: white;
            border-radius: 16px;
            padding: 2.5rem;
            box-shadow: 0 4px 20px rgba(255, 140, 0, 0.1);
            border: 1px solid #FFE8CC;
        }
        .section-title {
            font-size: 1.3rem;
            font-weight: bold;
            margin-bottom: 1.5rem;
            padding-bottom: 0.5rem;
            border-bottom: 3px solid #FF8C00;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: #D2691E;
        }
        .image-upload-area {
            border: 2px dashed #FFB347;
            border-radius: 12px;
            padding: 2rem;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s;
            background: linear-gradient(135deg, #FFF9F0 0%, #FFEFD5 100%);
        }
        .image-upload-area:hover {
            border-color: #FF8C00;
            background: linear-gradient(135deg, #FFE8CC 0%, #FFDAB9 100%);
            transform: translateY(-2px);
        }
        .image-upload-area.dragover {
            border-color: #FF8C00;
            background: linear-gradient(135deg, #FFE8CC 0%, #FFDAB9 100%);
            box-shadow: 0 4px 12px rgba(255, 140, 0, 0.2);
        }
        .image-preview-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
            gap: 1rem;
            margin-top: 1rem;
        }
        .image-preview-item {
            position: relative;
            border: 2px solid #FFD7A6;
            border-radius: 12px;
            overflow: hidden;
            aspect-ratio: 1;
            box-shadow: 0 2px 8px rgba(255, 140, 0, 0.15);
            transition: transform 0.3s;
        }
        .image-preview-item:hover {
            transform: scale(1.05);
            border-color: #FF8C00;
        }
        .image-preview-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .image-preview-item .remove-btn {
            position: absolute;
            top: 5px;
            right: 5px;
            background: rgba(220, 53, 69, 0.95);
            color: white;
            border: none;
            border-radius: 50%;
            width: 30px;
            height: 30px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            line-height: 1;
            transition: all 0.3s;
        }
        .image-preview-item .remove-btn:hover {
            background: rgba(220, 53, 69, 1);
            transform: scale(1.1);
        }
        .menu-item-card {
            border: 2px solid #FFE8CC;
            border-radius: 12px;
            padding: 1.5rem;
            margin-bottom: 1rem;
            background: linear-gradient(135deg, #FFFAF0 0%, #FFF5E6 100%);
            position: relative;
            transition: all 0.3s;
        }
        .menu-item-card:hover {
            box-shadow: 0 4px 12px rgba(255, 140, 0, 0.15);
        }
        .menu-item-card .remove-menu-btn {
            position: absolute;
            top: 10px;
            right: 10px;
        }
        .menu-image-preview {
            width: 100%;
            max-width: 200px;
            height: 150px;
            object-fit: cover;
            border-radius: 12px;
            border: 2px solid #FFD7A6;
            margin-top: 0.5rem;
            box-shadow: 0 2px 8px rgba(255, 140, 0, 0.1);
        }
        .add-menu-btn {
            width: 100%;
            padding: 1rem;
            border: 2px dashed #FF8C00;
            background: white;
            color: #FF8C00;
            border-radius: 12px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s;
        }
        .add-menu-btn:hover {
            background: linear-gradient(135deg, #FFF9F0 0%, #FFE8CC 100%);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(255, 140, 0, 0.2);
        }
        /* 입력 필드 포커스 스타일 */
        .form-control:focus,
        .form-select:focus,
        textarea.form-control:focus {
            border-color: #FF8C00 !important;
            box-shadow: 0 0 0 0.25rem rgba(255, 140, 0, 0.25) !important;
            outline: none !important;
        }
        @media (max-width: 768px) {
            .header-container {
                height: 64px;
            }
            .register-container {
                margin: 1rem;
                padding: 1.5rem;
            }
            .image-preview-container {
                grid-template-columns: repeat(auto-fill, minmax(100px, 1fr));
            }
        }
    </style>
</head>
<body>
<header id="header">
    <div class="header-container">
        <a href="http://localhost:6805/home" class="logo">
            <img src="/images/icon/logo.png" width="180px" height="50px" alt="함북스 로고">
        </a>
        <nav class="nav-menu">
            <a href="http://localhost:6805/home" class="nav-link">
                <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
                </svg>
                <span>Home</span>
            </a>
            <a href="/login" class="nav-link">
                <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                </svg>
                <span>Login</span>
            </a>
        </nav>
    </div>
</header>

<div class="container">
    <div class="register-container">
        <h2 class="text-center mb-4"><img src="/images/icon/매장등록아이콘.png" style="width:80px; margin-right:8px;"> 식당 등록</h2>
        
        <form id="restaurantForm" action="${pageContext.request.contextPath}/restaurant/new" method="post" enctype="multipart/form-data">
            
            <div class="mb-5">
                <div class="section-title">
                    📝 기본 정보
                </div>
                
                <div class="mb-3">
                    <label class="form-label fw-bold">상호명 <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" name="rstrName" required 
                           placeholder="예: 맛있는 파스타 전문점">
                </div>
                
                <div class="mb-3">
                    <label class="form-label fw-bold">매장 종류 <span class="text-danger">*</span></label>
                    <select class="form-select" name="category" required>
                        <option value="" selected disabled>카테고리를 선택해주세요</option>
                        <option value="한식">한식</option>
                        <option value="일식">일식</option>
                        <option value="중식">중식</option>
                        <option value="양식">양식</option>
                        <option value="아시안">아시안</option>
                        <option value="패스트푸드">패스트푸드</option>
                        <option value="주점">주점</option>
                        <option value="카페">카페</option>
                        <option value="기타">기타</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold">식당 설명</label>
                    <textarea class="form-control" name="desc" rows="4"
                              placeholder="매장의 특징, 분위기, 대표 메뉴 등을 소개해주세요."></textarea>
                </div>
                
                <div class="mb-3">
                    <label class="form-label fw-bold">주소 <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" name="loc" required 
                           placeholder="예: 서울시 강남구 테헤란로 123">
                </div>
                <div class="mb-3">
                    <label class="form-label fw-bold">도시 <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" name="city" required placeholder="예: 서울시">
                </div>
                
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-bold">영업시간</label>
                        <input type="text" class="form-control" name="open"
                               placeholder="예: 11:00 - 22:00">
                    </div>
                    
                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-bold">매장번호</label>
                        <input type="tel" class="form-control" id="phone" name="num"
                               placeholder="예: 02-1234-5678" maxlength="13">
                    </div>
                </div>
            </div>
            
            <div class="mb-5">
                <div class="section-title">
                    🖼️ 홍보 이미지
                </div>
                
                <div class="image-upload-area" id="imageUploadArea">
                    <input type="file" id="restaurantImages" name="restaurantImages" 
                           multiple accept="image/*" style="display: none;">
                    <div class="mb-2">
                        <svg width="48" height="48" fill="#FF8C00" class="text-muted" viewBox="0 0 16 16">
                            <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/>
                            <path d="M7.646 1.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 2.707V11.5a.5.5 0 0 1-1 0V2.707L5.354 4.854a.5.5 0 1 1-.708-.708l3-3z"/>
                        </svg>
                    </div>
                    <h5 style="color: #D2691E; font-weight: bold;">클릭하거나 이미지를 드래그하여 업로드</h5>
                    <p class="small mb-0" style="color: #A0826D;">최대 10개의 이미지를 업로드할 수 있습니다</p>
                </div>
                
                <div class="image-preview-container" id="imagePreviewContainer"></div>
            </div>
            
            <div class="mb-5">
                <div class="section-title">
                    🍽️ 메뉴 정보
                </div>
                
                <div id="menuContainer">
                    </div>
                
                <button type="button" class="add-menu-btn" onclick="addMenuItem()">
                    ➕ 메뉴 추가
                </button>
            </div>
            
            <div class="text-center mt-4">
                <button type="submit" class="btn btn-lg px-5" 
                        style="background: linear-gradient(135deg, #FF8C00 0%, #FF6347 100%); 
                               border: none; color: white; font-weight: bold;
                               box-shadow: 0 4px 12px rgba(255, 140, 0, 0.3);
                               transition: all 0.3s;"
                        onmouseover="this.style.transform='translateY(-2px)'; this.style.boxShadow='0 6px 16px rgba(255, 140, 0, 0.4)'"
                        onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='0 4px 12px rgba(255, 140, 0, 0.3)'">
                    식당 등록하기
                </button>
                <button type="button" class="btn btn-outline-secondary btn-lg px-5 ms-2" 
                        onclick="history.back()"
                        style="border-color: #D2691E; color: #D2691E; font-weight: bold;"
                        onmouseover="this.style.background='#FFF9F0'; this.style.borderColor='#FF8C00'; this.style.color='#FF8C00'"
                        onmouseout="this.style.background='transparent'; this.style.borderColor='#D2691E'; this.style.color='#D2691E'">
                    취소
                </button>
            </div>
        </form>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const header = document.getElementById('header');
    window.addEventListener('scroll', () => {
        if (window.scrollY > 20) {
            header.classList.add('scrolled');
        } else {
            header.classList.remove('scrolled');
        }
    });

    const imageUploadArea = document.getElementById('imageUploadArea');
    const restaurantImagesInput = document.getElementById('restaurantImages');
    const imagePreviewContainer = document.getElementById('imagePreviewContainer');
    let uploadedImages = [];

    imageUploadArea.addEventListener('click', () => {
        restaurantImagesInput.click();
    });

    restaurantImagesInput.addEventListener('change', handleImageUpload);

    imageUploadArea.addEventListener('dragover', (e) => {
        e.preventDefault();
        imageUploadArea.classList.add('dragover');
    });

    imageUploadArea.addEventListener('dragleave', () => {
        imageUploadArea.classList.remove('dragover');
    });

    imageUploadArea.addEventListener('drop', (e) => {
        e.preventDefault();
        imageUploadArea.classList.remove('dragover');
        
        const files = Array.from(e.dataTransfer.files).filter(file => file.type.startsWith('image/'));
        handleImageFiles(files);
    });

    function handleImageUpload(e) {
        const files = Array.from(e.target.files);
        handleImageFiles(files);
    }

    function handleImageFiles(files) {
        if (uploadedImages.length + files.length > 10) {
            alert('최대 10개의 이미지만 업로드할 수 있습니다.');
            return;
        }

        files.forEach(file => {
            const reader = new FileReader();
            reader.onload = (e) => {
                uploadedImages.push({
                    file: file,
                    url: e.target.result
                });
                renderImagePreviews();
            };
            reader.readAsDataURL(file);
        });
    }

    function renderImagePreviews() {
        imagePreviewContainer.innerHTML = '';
        uploadedImages.forEach((img, index) => {
            const previewItem = document.createElement('div');
            previewItem.className = 'image-preview-item';
            previewItem.innerHTML = `
                <img src="${img.url}" alt="미리보기 ${index + 1}">
                <button type="button" class="remove-btn" onclick="removeImage(${index})">×</button>
            `;
            imagePreviewContainer.appendChild(previewItem);
        });
    }

    function removeImage(index) {
        uploadedImages.splice(index, 1);
        renderImagePreviews();
    }

    let menuCount = 0;

    function addMenuItem() {
        menuCount++;
        const menuContainer = document.getElementById('menuContainer');
        const menuItem = document.createElement('div');
        menuItem.className = 'menu-item-card';
        menuItem.id = `menu-${menuCount}`;
        
        // Controller의 @RequestParam 이름(menuNames, menuPrices 등)과 일치시킨 HTML 삽입
        menuItem.innerHTML = `
            <button type="button" class="btn btn-danger btn-sm remove-menu-btn" 
                    onclick="removeMenuItem(${menuCount})">
                삭제
            </button>
            
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label fw-bold">메뉴명 <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" name="menuNames" 
                           required placeholder="예: 크림 파스타">
                </div>
                
                <div class="col-md-6 mb-3">
                    <label class="form-label fw-bold">가격 <span class="text-danger">*</span></label>
                    <input type="number" class="form-control" name="menuPrices" 
                           required placeholder="15000" min="0">
                </div>
            </div>
            
            <div class="mb-3">
                <label class="form-label fw-bold">메뉴 설명</label>
                <textarea class="form-control" name="menuDescriptions" 
                          rows="2" placeholder="메뉴에 대한 간단한 설명을 입력해주세요."></textarea>
            </div>
            
            <div class="mb-3">
                <label class="form-label fw-bold">메뉴 이미지</label>
                <input type="file" class="form-control" name="menuImages" 
                       accept="image/*" onchange="previewMenuImage(this, ${menuCount})">
                <img id="menuImagePreview-${menuCount}" class="menu-image-preview" 
                     style="display: none;" alt="메뉴 이미지 미리보기">
            </div>
        `;
        menuContainer.appendChild(menuItem);
    }

    function removeMenuItem(id) {
        const menuItem = document.getElementById(`menu-${id}`);
        if (menuItem) {
            menuItem.remove();
        }
    }

    function previewMenuImage(input, menuId) {
        const preview = document.getElementById(`menuImagePreview-${menuId}`);
        
        if (input.files && input.files[0]) {
            const reader = new FileReader();
            reader.onload = (e) => {
                preview.src = e.target.result;
                preview.style.display = 'block';
            };
            reader.readAsDataURL(input.files[0]);
        }
    }

    document.getElementById('restaurantForm').addEventListener('submit', (e) => {
        if (uploadedImages.length === 0 && document.getElementById('restaurantImages').files.length === 0) {
            e.preventDefault();
            alert('최소 1개 이상의 홍보 이미지를 업로드해주세요.');
            return false;
        }
        return true;
    });

    window.addEventListener('load', () => {
        addMenuItem();
    });

    document.getElementById("phone").addEventListener("input", function(e) {
        let value = e.target.value.replace(/[^0-9]/g, "");
        let result = "";

        if (value.startsWith("02")) {
            if (value.length <= 2) {
                result = value;
            } else if (value.length <= 5) {
                result = value.slice(0, 2) + "-" + value.slice(2);
            } else if (value.length <= 9) {
                result = value.slice(0, 2) + "-" + value.slice(2, 5) + "-" + value.slice(5, 9);
            } else {
                result = value.slice(0, 2) + "-" + value.slice(2, 6) + "-" + value.slice(6, 10);
            }
        }
        else {
            if (value.length <= 3) {
                result = value;
            } else if (value.length <= 6) {
                result = value.slice(0, 3) + "-" + value.slice(3);
            } else if (value.length <= 10) {
                result = value.slice(0, 3) + "-" + value.slice(3, 6) + "-" + value.slice(6, 10);
            } else {
                result = value.slice(0, 3) + "-" + value.slice(3, 7) + "-" + value.slice(7, 11);
            }
        }

        e.target.value = result;
    });
</script>
</body>
</html>