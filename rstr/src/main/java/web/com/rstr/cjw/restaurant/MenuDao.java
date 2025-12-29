package web.com.rstr.cjw.restaurant;

import java.util.List;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface MenuDao {
    
    @Select("SELECT id, name, price, restaurant_id as restaurantId, " +
            "profile_img_path as profileImgPath, description, created_at as createdAt " +
            "FROM menu WHERE restaurant_id = #{restaurantId} ORDER BY id ASC")
    List<Menu> findMenusByRestaurantId(int restaurantId);
    
    @Insert("INSERT INTO menu (ID, restaurant_id, name, price, description, profile_img_path, created_at) " +
            "VALUES (PRJ01.MENU_SEQ.NEXTVAL, #{restaurantId}, #{name}, #{price}, #{description}, #{profileImgPath}, CURRENT_TIMESTAMP)")
    void insertMenu(Menu menu);
}