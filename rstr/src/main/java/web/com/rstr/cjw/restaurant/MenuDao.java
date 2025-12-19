package web.com.rstr.cjw.restaurant;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface MenuDao {
    @Select("SELECT id, name, price, restaurant_id as restaurantId, " +
            "profile_img_path as profileImgPath, description, created_at as createdAt " +
            "FROM menu WHERE restaurant_id = #{restaurantId} ORDER BY id ASC")
    List<Menu> findMenusByRestaurantId(int restaurantId);
}
