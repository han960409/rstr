<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    width: 20px;
    height: 20px;
}

@media (max-width: 768px) {
    .header-container {
        height: 64px;
    }
    .nav-menu {
        gap: 1rem;
    }
    .nav-link {
        gap: 0.25rem;
        font-size: 0.875rem;
    }
    .nav-link svg {
        width: 18px;
        height: 18px;
    }
}
</style>

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
            
            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    <a href="/mypage" class="nav-link">
                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                        </svg>
                        <span>마이페이지</span>
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="/login" class="nav-link">
                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                        </svg>
                        <span>로그인</span>
                    </a>
                </c:otherwise>
            </c:choose>
        </nav>
    </div>
</header>

<script>
    const header = document.getElementById('header');
    window.addEventListener('scroll', () => {
        if (window.scrollY > 20) {
            header.classList.add('scrolled');
        } else {
            header.classList.remove('scrolled');
        }
    });
</script>