package web.com.springweb.A02_cjw;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface RSTR_Img_Dao {
    // [수정] img_url -> IMAGE_URL (실제 DB 컬럼명)
    // IMAGE_URL as imgUrl : DB의 IMAGE_URL 값을 가져와서 DTO의 imgUrl 변수에 넣겠다는 뜻입니다.
    @Select("SELECT id, restaurant_id, IMAGE_URL as imgUrl, sort_order FROM restaurant_promo WHERE restaurant_id = #{restaurantId} ORDER BY sort_order ASC")
    List<RestaurantImg> findByRestaurantId(int restaurantId);
}
