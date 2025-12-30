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
ADD REVIEWIMAGE VARCHAR2(300);
UPDATE RESTAURANT
SET latitude = 37.28648227941,
	longitude = 127.01261281897
WHERE id = 1;

UPDATE REVIEW
SET REVIEWIMAGE = '/resources/images/churros.jpg,/resources/images/churros2.jpg,/resources/images/churros3.jpg'
WHERE id = '1';
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
SELECT r.id, rv.restaurant_id
FROM restaurant r
LEFT JOIN review rv
ON r.id = rv.restaurant_id;
/* @Select("SELECT * review FROM restaurant r
LEFT JOIN review rv ON r.id = rv.restaurant_id WHERE r.id = #{r.id};")
List<review> getReviewList();
*/
ALTER TABLE restaurant
ADD longitude NUMBER;
DELETE FROM review
WHERE id = 26;
/*
@Select("SELECT * FROM RESTAURANT ORDER BY RECEIVE_RECOMMEND DESC")
List<Restaurant> getRestaurantList();

*/

/*
@Select("SELECT * FROM REVIEW WHERE ID = #{id}");
Review findById(int id);
@Select("SELECT * FROM REVIEW ORDER BY created_at DESC");
List<Review> findAll();
*/
SELECT *
FROM review
WHERE id BETWEEN 1 AND 5
ORDER BY created_at DESC;
SELECT * FROM RESTAURANT;

SELECT * FROM menu WHERE restaurant_id = 2;
UPDATE menu 
SET image_path = '/images/2/menu/88e1da3d-b48d-4026-a4c0-def2fa42cfde.jpg'
WHERE restaurant_id = 2;

SELECT * FROM reservation;

ALTER TABLE RESERVATION
DROP COLUMN special_request;
