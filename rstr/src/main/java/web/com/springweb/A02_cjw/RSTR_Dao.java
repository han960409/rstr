package web.com.springweb.A02_cjw;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface RSTR_Dao {
	@Select("SELECT restaurant_name FROM restaurant WHERE id = 2")
	String findRstrNameById();
	
	@Select("SELECT DESCRIPTION FROM restaurant WHERE id = 2")
	String getDesc();
	
	@Select("SELECT OPERATING_HOURS FROM restaurant WHERE id=2")
	String getOpen();
	
	@Select("SELECT PHONE FROM restaurant WHERE id=2")
	String getNum();

	@Select("SELECT ADDRESS FROM restaurant WHERE id=2")
	String getLoc();
}

