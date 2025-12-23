SELECT  * FROM menu ORDER BY ID;
DELETE FROM menu;

UPDATE menu SET PROFILE_IMG_PATH = '/upload/2/menu/메뉴1.png' WHERE NAME LIKE '%초밥%';
UPDATE menu SET PROFILE_IMG_PATH = '/upload/2/menu/메뉴2.png' WHERE NAME LIKE '%라멘%';
UPDATE menu SET PROFILE_IMG_PATH = '/upload/2/menu/메뉴3.png' WHERE NAME LIKE '%연어%';
UPDATE menu SET PROFILE_IMG_PATH = '/upload/2/menu/메뉴4.png' WHERE NAME LIKE '%튀김%';
UPDATE menu SET PROFILE_IMG_PATH = '/upload/2/menu/메뉴5.png' WHERE NAME LIKE '%장어%';

COMMIT;

SELECT OPERATING_HOURS FROM restaurant WHERE id=2;
/*
@Select("SELECT OPERATING_HOURS FROM restaurant WHERE id=2")
String getOpen();
*/
SELECT * FROM restaurant;
SELECT PHONE FROM restaurant WHERE id=2;
SELECT ADDRESS FROM restaurant WHERE id=2;
/*
@Select("SELECT PHONE FROM restaurant WHERE id=2")
String getNum();

@Select("SELECT ADDRESS FROM restaurant WHERE id=2")
String getLoc();
*/
ALTER TABLE REVIEW
ADD PF_IMAGE VARCHAR2(50);
UPDATE REVIEW
SET ID = 6,
	TITLE = '해장국 대박',
    BODY = '해장국 한 그릇 먹고 어제 마신 술이 싹 내려갔어요!',
    RESTAURANT_ID = 6,
    USER_ID = 6,
    CREATED_AT = SYSDATE,
    RECEIVE_RECOMMEND = 63
WHERE id = '6';
INSERT INTO REVIEW
			   VALUES ('16', '바삭 돈까스', '여태까지 먹은 돈까스는 가짜였어요!', '16', '16','' ,'5',SYSDATE, 592,'','');
SELECT * FROM RESTAURANT;
SELECT * FROM REVIEW;
SELECT * FROM REVIEW WHERE restaurant_Id = 1;
SELECT r.id,
       r.restaurant_name,
       rv.BODY
FROM restaurant r
LEFT JOIN review rv
  ON r.id = rv.restaurant_id
WHERE r.id = 1;
/* @Select("SELECT * review FROM restaurant r
LEFT JOIN review rv ON r.id = rv.restaurant_id WHERE r.id = #{r.id};")
List<review> getReviewList();
*/
DELETE FROM review
WHERE id = 26;
/*
@Select("SELECT * FROM RESTAURANT ORDER BY RECEIVE_RECOMMEND DESC")
List<Restaurant> getRestaurantList();

*/