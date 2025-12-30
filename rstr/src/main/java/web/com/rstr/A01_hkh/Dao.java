package web.com.rstr.A01_hkh;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import web.com.rstr.common.dto.Comment;
import web.com.rstr.common.dto.MemberVO;
import web.com.rstr.common.dto.Restaurant;
import web.com.rstr.common.dto.Review;


@Mapper
public interface Dao {
	
	@Select("SELECT restaurant_name AS restaurantName FROM restaurant WHERE id = 11")
		Restaurant getRestaurant();
	@Select("SELECT * FROM RESTAURANT WHERE ID = 11")
		List<Restaurant> getRestaurantList();
	@Select("""
		    SELECT *
		    FROM (
		        SELECT r.*,
		               ROW_NUMBER() OVER (
		                   PARTITION BY restaurant_id
		                   ORDER BY receive_recommend DESC
		               ) rn
		        FROM review r
		        WHERE restaurant_id IN (${restaurantIds})
		    )
		    WHERE rn = 1
		""")
		List<Review> findTopReviewByRestaurantIds(
		    @Param("restaurantIds") String restaurantIds
		);
	@Select("SELECT *\r\n"
			+ "    FROM restaurant\r\n"
			+ "    ORDER BY created_at DESC")
	List<Restaurant> getOrderByCreatedAtDesc();
	@Select("SELECT rv.*, r.receive_recommend  \r\n"
			+ "	        FROM review rv  \r\n"
			+ "	        JOIN restaurant r ON rv.restaurant_id = r.id  \r\n"
			+ "	        WHERE rv.restaurant_id = #{restaurantId}  \r\n"
			+ "	        ORDER BY r.receive_recommend DESC")
        List<Review> getReviewListById(int restaurantId);
	@Select("""
		    SELECT *
		    FROM restaurant
		    ORDER BY receive_recommend DESC
		""")
		List<Restaurant> getOrderByRecommendDesc();
	@Select("SELECT id, restaurant_name AS restaurantName, latitude, longitude FROM restaurant")
	List<Restaurant> getAllRestaurants();
	@Select("		    SELECT *\r\n"
			+ "		    FROM review\r\n"
			+ "		    WHERE id BETWEEN 1 AND 5\r\n"
			+ "		    ORDER BY created_at DESC")
		List<Review> selectIdBetween1And5();
	
    @Select("SELECT *\r\n"
    		+ "            FROM RESTAURANT\r\n"
    		+ "            WHERE ID = #{id}")
        Restaurant findById(int id);
    @Select("SELECT * FROM REVIEW WHERE id = #{id}")
    Review findReviewById(int id);
    @Select("SELECT *\r\n"
    		+ "    	    FROM review\r\n"
    		+ "    	    WHERE RESTAURANT_ID = #{restaurantId}\r\n"
    		+ "    	    ORDER BY id DESC")
    	List<Review> findReviewsByRestaurantId(int restaurantId);

    @Insert("            INSERT INTO USERS\r\n"
    		+ "            (ID, USER_ID, PASSWORD, NAME, EMAIL, PHONE ,ROLE)\r\n"
    		+ "            VALUES\r\n"
    		+ "            (USERS_SEQ.NEXTVAL, #{userId}, #{password}, #{name}, #{email}, #{phone}, #{role})")
    int insertMember(MemberVO vo);

   @Select("    SELECT\r\n"
   		+ "        ID               AS id,\r\n"
   		+ "        RESTAURANT_NAME  AS restaurantName,\r\n"
   		+ "        CATEGORY         AS category,\r\n"
   		+ "        ADDRESS          AS address,\r\n"
   		+ "        OPERATING_HOURS AS operatingHours,\r\n " 
   		+ " 	IMAGE_PATH       AS imagePath \r\n "
   		+ "    FROM RESTAURANT\r\n"
   		+ "    ORDER BY RESTAURANT_NAME")
    List<Restaurant> getAllRestaurant();
   
   /**
    * 로그인: 아이디와 비밀번호로 사용자 조회
    */
   @Select("SELECT " +
           "ID as id, " +
           "USER_ID as userId, " +
           "NAME as name, " +
           "EMAIL as email, " +
           "PHONE as phone, " +
           "ROLE as role " +
           "FROM USERS " +
           "WHERE USER_ID = #{userId} " +
           "AND PASSWORD = #{password}")
   MemberVO selectByUserIdAndPassword(@Param("userId") String userId, 
                                      @Param("password") String password);
   
   /**
    * 아이디 중복 체크
    */
   @Select("SELECT COUNT(*) FROM USERS WHERE USER_ID = #{userId}")
   int countByUserId(@Param("userId") String userId);
   
   /**
    * 사용자 ID로 조회
    */
   @Select("SELECT " +
           "ID as id, " +
           "USER_ID as userId, " +
           "NAME as name, " +
           "EMAIL as email, " +
           "PHONE as phone, " +
           "ROLE as role " +
           "FROM USERS " +
           "WHERE ID = #{id}")
   MemberVO selectById(@Param("id") Long id);
   @Insert("INSERT INTO comments (id, body, user_id, review_id) " +
           "VALUES (comment_seq.NEXTVAL, #{body}, #{userId}, #{reviewId})")
   void insertComment(Comment comment);

   @Select("SELECT id, body, user_id AS userId, review_id AS reviewId, created_at AS createdAt " +
           "FROM comments WHERE review_id = #{reviewId} ORDER BY created_at ASC")
   List<Comment> findCommentsByReviewId(Long reviewId);
}

