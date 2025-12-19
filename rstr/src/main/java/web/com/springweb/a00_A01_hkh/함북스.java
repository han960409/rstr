package web.com.springweb.a00_A01_hkh;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import web.com.springweb.a00_prjdto.Restaurant;

@Controller
public class 함북스 {

	
	@Autowired
	//  http://localhost:5050/home
	@GetMapping("home")
	public String home() {
		return "a00_프로젝트/Home";
	}
	
	//  http://localhost:5050/blog
	@GetMapping("blog")
	public String blog() {
		return "a00_프로젝트/review_info";
	}
	
	//  http://localhost:5050/area
	@GetMapping("area")
	public String area() {
		return "a00_프로젝트/Area";
	}
	
	// http://localhost:5050/king
	@GetMapping("/king")
    public String showRestaurant(Model model) {
        Restaurant r = dao.getRestaurant();  // Dao 메서드 호출
        model.addAttribute("restaurant", r); // 모델에 담아서 JSP에 전달
        return "a00_프로젝트/review_king";             // JSP 이름
    }

	//  http://localhost:5050/areaplus
	@GetMapping("areaplus")
	public String areaplus() {
		return "a00_프로젝트/Areaplus";
	}
	
	//  http://localhost:5050/list
	@GetMapping("list")
	public String list() {
		return "a00_프로젝트/Restaurant_list";
	}
}