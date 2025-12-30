-- ============================================
-- 시퀀스 생성
-- ============================================
CREATE SEQUENCE users_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE restaurant_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE comment_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE review_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE user_visit_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE review_recommend_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE menu_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE reservation_seq START WITH 1 INCREMENT BY 1;

-- ============================================
-- 테이블 생성
-- ============================================

-- 사용자 테이블
CREATE TABLE users (
    id NUMBER PRIMARY KEY,
    user_id VARCHAR2(50) NOT NULL UNIQUE,
    password VARCHAR2(48) NOT NULL,
    name VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) NOT NULL UNIQUE,
    phone VARCHAR2(50),
    role VARCHAR2(20) DEFAULT 'USER' NOT NULL,
    profile_img_path VARCHAR2(500),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT chk_user_role CHECK (role IN ('USER', 'ADMIN', 'OWNER'))
);

-- 레스토랑 테이블
CREATE TABLE restaurant (
    id NUMBER PRIMARY KEY,
    restaurant_name VARCHAR2(200) NOT NULL,
    operating_hours VARCHAR2(100),
    category VARCHAR2(50) NOT NULL,
    address VARCHAR2(500) NOT NULL,
    city VARCHAR2(100) NOT NULL,
    phone VARCHAR2(20),
    description VARCHAR2(500),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    receive_recommend NUMBER
);

SELECT restaurant_name FROM restaurant WHERE id = 11;
/*

SELECT restaurant_name FROM restaurant WHERE id = 11;
SELECT * FROM restaurant;
@Select("")
String getRestaulantName();
**/
-- 메뉴 테이블
CREATE TABLE menu (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(200) NOT NULL,
    price NUMBER(10,0) NOT NULL,
    restaurant_id NUMBER NOT NULL,
    profile_img_path VARCHAR2(500),
    description VARCHAR2(200),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- 예약 테이블
CREATE TABLE reservation (
    id NUMBER PRIMARY KEY,
    restaurant_id NUMBER NOT NULL,
    user_id NUMBER NOT NULL,
    reserv_date TIMESTAMP NOT NULL,
    party_size NUMBER(2,0) DEFAULT 2 NOT NULL,
    status VARCHAR2(20) DEFAULT 'PENDING' NOT NULL,
    special_request CLOB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- 방문 기록 테이블
CREATE TABLE user_visit (
    id NUMBER PRIMARY KEY,
    user_id NUMBER NOT NULL,
    restaurant_id NUMBER NOT NULL,
    visit_date DATE NOT NULL,
    visit_status VARCHAR2(20) DEFAULT 'Upcoming' NOT NULL,
    reservation_id NUMBER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT chk_visit_status CHECK (visit_status IN ('COMPLETED', 'CANCELLED', 'Upcoming'))
);

-- 리뷰 테이블
CREATE TABLE review (
    id NUMBER PRIMARY KEY,
    title VARCHAR2(200) NOT NULL,
    body CLOB NOT NULL,
    restaurant_id NUMBER NOT NULL,
    user_id NUMBER NOT NULL,
    user_visit_id NUMBER,
    rating NUMBER(2,1) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT chk_review_rating CHECK (rating BETWEEN 1.0 AND 5.0)
);
ALTER TABLE restaurant ADD receive_recommend NUMBER;
/* review
	private int id;
	private String title;
	private String body;
	private int restaurant_Id;
	private int user_Id;
	private int user_Visit_Id;
	private int rating;
	private LocalDateTime timeStamp;
	@DecimalMin("1.0")
    @DecimalMax("5.0")
    private BigDecimal rating;
*/
SELECT 
-- 댓글 테이블
CREATE TABLE COMMENTS (
    id NUMBER PRIMARY KEY,
    body CLOB NOT NULL,
    user_id VARCHAR2(50) NOT NULL,
    review_id NUMBER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 리뷰 추천 테이블
CREATE TABLE review_recommend (
    id NUMBER PRIMARY KEY,
    review_id NUMBER NOT NULL,
    user_id NUMBER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);
/*
	private String userId;
    private String password;
    private String name;
    private String email;
    private String phone;
*/
CREATE TABLE MEMBER (
	USER_ID VARCHAR2(50) PRIMARY KEY,
	PASSWORD VARCHAR2(50) NOT NULL,
	NAME VARCHAR2(50),
	EMAIL VARCHAR2(50),
	PHONE VARCHAR2(50)
);
SELECT * FROM MEMBER;
SELECT * FROM COMMENTS;
DROP TABLE COMMENTS;
SELECT * FROM review;
SELECT * FROM RESTAURANT;
ALTER TABLE REVIEW
ADD COMMENTBODY VARCHAR2(100);
-- ============================================
-- 샘플 데이터
-- ============================================
INSERT INTO users VALUES (users_seq.NEXTVAL, 'user01', 'pass01', '김지원', 'user01@test.com', 01011112222, 'USER', NULL, CURRENT_TIMESTAMP);
INSERT INTO users VALUES (users_seq.NEXTVAL, 'user02', 'pass02', '이민수', 'user02@test.com', 01022223333, 'USER', NULL, CURRENT_TIMESTAMP);
INSERT INTO users VALUES (users_seq.NEXTVAL, 'user03', 'pass03', '박지현', 'user03@test.com', 01033334444, 'USER', NULL, CURRENT_TIMESTAMP);
INSERT INTO users VALUES (users_seq.NEXTVAL, 'owner01', 'pass04', '최사장', 'owner01@test.com', 01044445555, 'OWNER', NULL, CURRENT_TIMESTAMP);
INSERT INTO users VALUES (users_seq.NEXTVAL, 'admin01', 'pass05', '관리자', 'admin01@test.com', 01055556666, 'ADMIN', NULL, CURRENT_TIMESTAMP);

INSERT INTO restaurant VALUES (restaurant_seq.NEXTVAL, '수원 불고기', '10:00~22:00', '한식', '수원시 권선구 수원여대입구', '수원', '031-111-2222', '정통 불고기 전문점', CURRENT_TIMESTAMP,0);
INSERT INTO restaurant VALUES (restaurant_seq.NEXTVAL, '스시하루', '11:00~21:00', '일식', '용인시 처인구 경희대입구', '용인', '031-222-3333', '신선한 초밥', CURRENT_TIMESTAMP,0);
INSERT INTO restaurant VALUES (restaurant_seq.NEXTVAL, '파스타존', '10:30~22:30', '양식', '수원시 영통구 아주대입구', '수원', '031-333-4444', '이탈리안 파스타', CURRENT_TIMESTAMP,0);
INSERT INTO restaurant VALUES (restaurant_seq.NEXTVAL, '치킨천국', '16:00~02:00', '치킨', '수원시 팔달구', '수원', '031-444-5555', '바삭한 치킨', CURRENT_TIMESTAMP,0);
INSERT INTO restaurant VALUES (restaurant_seq.NEXTVAL, '카페모닝', '08:00~20:00', '카페', '수원시 장안구 수원KT위즈파크 앞', '수원', '031-555-6666', '브런치 카페', CURRENT_TIMESTAMP,0);

UPDATE restaurant SET receive_recommend = 360 WHERE id = 26;
SELECT * 
FROM menu
WHERE restaurant_id = 26;
DROP TABLE menu;

INSERT INTO menu VALUES (menu_seq.NEXTVAL, '불고기 정식', 12000, 1, NULL, '대표 메뉴', CURRENT_TIMESTAMP);
INSERT INTO menu VALUES (menu_seq.NEXTVAL, '초밥 세트', 18000, 2, NULL, '모둠 초밥', CURRENT_TIMESTAMP);
INSERT INTO menu VALUES (menu_seq.NEXTVAL, '까르보나라', 15000, 3, NULL, '크림 파스타', CURRENT_TIMESTAMP);
INSERT INTO menu VALUES (menu_seq.NEXTVAL, '후라이드 치킨', 17000, 4, NULL, '바삭한 치킨', CURRENT_TIMESTAMP);
INSERT INTO menu VALUES (menu_seq.NEXTVAL, '아메리카노', 4500, 5, NULL, '원두 커피', CURRENT_TIMESTAMP);

INSERT INTO reservation VALUES (reservation_seq.NEXTVAL, 1, 1, TIMESTAMP '2025-01-10 18:00:00', 2, 'CONFIRMED', '창가 자리', CURRENT_TIMESTAMP);
INSERT INTO reservation VALUES (reservation_seq.NEXTVAL, 2, 2, TIMESTAMP '2025-01-11 19:00:00', 3, 'PENDING', NULL, CURRENT_TIMESTAMP);
INSERT INTO reservation VALUES (reservation_seq.NEXTVAL, 3, 3, TIMESTAMP '2025-01-12 12:00:00', 2, 'CONFIRMED', NULL, CURRENT_TIMESTAMP);
INSERT INTO reservation VALUES (reservation_seq.NEXTVAL, 4, 1, TIMESTAMP '2025-01-13 20:00:00', 4, 'CANCELLED', NULL, CURRENT_TIMESTAMP);
INSERT INTO reservation VALUES (reservation_seq.NEXTVAL, 5, 2, TIMESTAMP '2025-01-14 09:00:00', 1, 'CONFIRMED', '조용한 자리', CURRENT_TIMESTAMP);

INSERT INTO user_visit VALUES (user_visit_seq.NEXTVAL, 1, 1, DATE '2025-01-10', 'COMPLETED', 1, CURRENT_TIMESTAMP);
INSERT INTO user_visit VALUES (user_visit_seq.NEXTVAL, 2, 2, DATE '2025-01-11', 'Upcoming', 2, CURRENT_TIMESTAMP);
INSERT INTO user_visit VALUES (user_visit_seq.NEXTVAL, 3, 3, DATE '2025-01-12', 'COMPLETED', 3, CURRENT_TIMESTAMP);
INSERT INTO user_visit VALUES (user_visit_seq.NEXTVAL, 1, 4, DATE '2025-01-13', 'CANCELLED', 4, CURRENT_TIMESTAMP);
INSERT INTO user_visit VALUES (user_visit_seq.NEXTVAL, 2, 5, DATE '2025-01-14', 'COMPLETED', 5, CURRENT_TIMESTAMP);

INSERT INTO review VALUES (review_seq.NEXTVAL, '맛있어요', '불고기가 정말 맛있었습니다.', 1, 1, 1, 4.0, CURRENT_TIMESTAMP);
INSERT INTO review VALUES (review_seq.NEXTVAL, '신선한 초밥', '회가 신선해요.', 2, 2, NULL, 5.0, CURRENT_TIMESTAMP);
INSERT INTO review VALUES (review_seq.NEXTVAL, '괜찮은 파스타', '무난한 맛이에요.', 3, 3, 3, 4.0, CURRENT_TIMESTAMP);
INSERT INTO review VALUES (review_seq.NEXTVAL, '치킨 최고', '바삭바삭합니다.', 4, 1, NULL, 3.0, CURRENT_TIMESTAMP);
INSERT INTO review VALUES (review_seq.NEXTVAL, '분위기 좋아요', '카페가 조용해요.', 5, 2, 5, 4.0, CURRENT_TIMESTAMP);
INSERT INTO review VALUES (review_seq.NEXTVAL, '후메잌디스', '와우', 2, 2, 5, 4.0, CURRENT_TIMESTAMP);

INSERT INTO comments VALUES (comment_seq.NEXTVAL, '공감합니다!', 2, 1, CURRENT_TIMESTAMP);
INSERT INTO comments VALUES (comment_seq.NEXTVAL, '저도 가보고 싶네요', 3, 1, CURRENT_TIMESTAMP);
INSERT INTO comments VALUES (comment_seq.NEXTVAL, '사진도 좋네요', 1, 2, CURRENT_TIMESTAMP);
INSERT INTO comments VALUES (comment_seq.NEXTVAL, '정보 감사합니다', 4, 3, CURRENT_TIMESTAMP);
INSERT INTO comments VALUES (comment_seq.NEXTVAL, '맛집 인정', 5, 4, CURRENT_TIMESTAMP);

INSERT INTO review_recommend VALUES (review_recommend_seq.NEXTVAL, 1, 2, CURRENT_TIMESTAMP);
INSERT INTO review_recommend VALUES (review_recommend_seq.NEXTVAL, 1, 3, CURRENT_TIMESTAMP);
INSERT INTO review_recommend VALUES (review_recommend_seq.NEXTVAL, 2, 1, CURRENT_TIMESTAMP);
INSERT INTO review_recommend VALUES (review_recommend_seq.NEXTVAL, 3, 4, CURRENT_TIMESTAMP);
INSERT INTO review_recommend VALUES (review_recommend_seq.NEXTVAL, 4, 5, CURRENT_TIMESTAMP);