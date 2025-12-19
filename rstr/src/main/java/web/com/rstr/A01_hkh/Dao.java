package web.com.rstr.A01_hkh;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import web.com.springweb.A02_cjw.restaurant;
import web.com.springweb.a00_prjdto.Restaurant;


@Mapper
public interface Dao {
	
	@Select("SELECT restaurant_name AS restaurantName FROM restaurant WHERE id = 11")
		Restaurant getRestaurant();
	@Select("SELECT * FROM RESTAURANT WHERE ID = #{id}")
		List<restaurant> getRestaurantList();
}
