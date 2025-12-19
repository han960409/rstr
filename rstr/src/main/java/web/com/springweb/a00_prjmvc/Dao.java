package web.com.springweb.a00_prjmvc;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import web.com.springweb.a00_prjdto.Restaurant;

@Mapper
public interface Dao {

	@Select("SELECT restaurant_name AS restaurantName FROM restaurant WHERE id = 11;")
		Restaurant getRestaurant();
}
