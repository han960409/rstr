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