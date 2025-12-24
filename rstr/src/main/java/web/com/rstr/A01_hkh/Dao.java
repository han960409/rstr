package web.com.rstr.A01_hkh;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

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
}
