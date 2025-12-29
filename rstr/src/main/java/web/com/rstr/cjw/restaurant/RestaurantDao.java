package web.com.rstr.cjw.restaurant;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import web.com.rstr.common.dto.Restaurant;

@Mapper
public interface RestaurantDao {
    
    @Select("SELECT restaurant_name FROM restaurant WHERE id = #{id}")
    String findRstrNameById(int id);
    
    @Select("SELECT description FROM restaurant WHERE id = #{id}")
    String getDesc(int id);
    
    @Select("SELECT operating_hours FROM restaurant WHERE id = #{id}")
    String getOpen(int id);
    
    @Select("SELECT phone FROM restaurant WHERE id = #{id}")
    String getNum(int id);
    
    @Select("SELECT address FROM restaurant WHERE id = #{id}")
    String getLoc(int id);
    
    @Insert(
    	    "INSERT INTO restaurant " +
    	    "(id, restaurant_name, category, city, address, description, operating_hours, phone, created_at) " +
    	    "VALUES " +
    	    "(#{id}, #{restaurantName}, #{category}, #{city}, #{address}, #{description}, #{operatingHours}, #{phone}, CURRENT_TIMESTAMP)"
    	)
    	@SelectKey(
    	    statement = "SELECT restaurant_seq.NEXTVAL FROM dual",
    	    keyProperty = "id",
    	    before = true,
    	    resultType = Integer.class
    	)
    	void insertRestaurant(Restaurant restaurant);


    @Update("UPDATE restaurant SET image_path = #{imagePath} WHERE id = #{restaurantId}")
    void updateMainImage(
        @Param("restaurantId") int restaurantId,
        @Param("imagePath") String imagePath
    );
    
}