package web.com.rstr.cjw.restaurant;

import java.util.List;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import web.com.rstr.common.dto.RestaurantImageDto;

@Mapper
public interface RestaurantImageDao {
    
    @Select("SELECT id, restaurant_id, IMAGE_URL as imgUrl, sort_order " +
            "FROM restaurant_promo " +
            "WHERE restaurant_id = #{restaurantId} " +
            "ORDER BY sort_order ASC")
    List<RestaurantImageDto> findByRestaurantId(int restaurantId);
    
    @Insert("INSERT INTO restaurant_promo (ID, restaurant_id, IMAGE_URL, sort_order) " +
            "VALUES (PRJ01.PROMO_SEQ.NEXTVAL, #{restaurantId}, #{imgUrl}, #{sortOrder})")
    void insertImage(RestaurantImageDto imageDto);
}