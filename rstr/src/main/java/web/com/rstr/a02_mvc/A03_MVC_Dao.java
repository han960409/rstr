package web.com.rstr.a02_mvc;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;


@Mapper
public interface A03_MVC_Dao {
	
	@Select("SELECT * FROM DEPT")
	List<Dept> getDeptList();
}
