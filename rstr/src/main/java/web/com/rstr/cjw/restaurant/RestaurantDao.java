package web.com.rstr.cjw.restaurant;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

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
}
