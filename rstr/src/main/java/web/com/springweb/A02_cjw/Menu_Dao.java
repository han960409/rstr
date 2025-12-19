package web.com.springweb.A02_cjw;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface Menu_Dao {
    @Select("SELECT id, name, price, restaurant_id as restaurantId, " +
            "profile_img_path as profileImgPath, description, created_at as createdAt " +
            "FROM menu WHERE restaurant_id = #{restaurantId} ORDER BY id ASC")
    List<Menu> findMenusByRestaurantId(int restaurantId);
}
