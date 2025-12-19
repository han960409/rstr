package web.com.rstr.a02_mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class A02_MVC_Service {

	@Autowired
	private A03_MVC_Dao dao;
	
	// 메서드를 통해서 mybatis에서 만들어진 DB데이터가 있는 객체를 
	// 연동호출함.. [(dept),(dept),(dept),(dept)]
	public List<Dept> getDeptList(){
		return dao.getDeptList();
	}
	
	
}
