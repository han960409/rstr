package web.com.rstr.A01_hkh;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import web.com.springweb.a00_prjdto.Restaurant;

@Controller
public class 함북스 {
	@Autowired
    private hambooksService restaurantService;
	//  http://localhost:6805/home
	@GetMapping("home")
	public String home() {
		return "a00_프로젝트/Home";
	}
	
	//  http://localhost:6805/blog
	@GetMapping("blog")
	public String blog() {
		return "a00_프로젝트/review_info";
	}
	
	//  http://localhost:6805/area
	@GetMapping("area")
	
	public String area() {
		return "a00_프로젝트/Area";
	}
	
	// http://localhost:6805/king
    @GetMapping("/king")
    public String showRestaurant(Model model) {
        Restaurant r = restaurantService.getRestaurant();
        model.addAttribute("restaurant", r);
        return "a00_프로젝트/review_king";
    }
	//  http://localhost:6805/areaplus
	@GetMapping("areaplus")
	public String areaplus() {
		return "a00_프로젝트/Areaplus";
	}
	
	//  http://localhost:6805/list
	@GetMapping("list")
	public String list() {
		return "a00_프로젝트/Restaurant_list";
	}
}