package web.com.rstr.A01_hkh;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import web.com.rstr.common.dto.Restaurant;
import web.com.rstr.common.dto.Review;


@Mapper
public interface Dao {
	
	@Select("SELECT restaurant_name AS restaurantName FROM restaurant WHERE id = 11")
		Restaurant getRestaurant();
	@Select("SELECT * FROM RESTAURANT WHERE ID = 11")
		List<Restaurant> getRestaurantList();
	@Select("SELECT * FROM RESTAURANT ORDER BY RECEIVE_RECOMMEND DESC")
	List<Restaurant> getRstrDesc();
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
}
