package web.com.rstr.A01_hkh;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import web.com.rstr.common.dto.Restaurant;
import web.com.rstr.common.dto.Review;

@Controller
public class 함북스 {
	@Autowired
    private hambooksService restaurantService;
	//  http://localhost:6805/home
	@GetMapping("home")
	public String home() {
		return "hambook/Home";
	}
	
	//  http://localhost:6805/blog
	@GetMapping("blog")
	public String blog() {
		return "hambook/review_info";
	}
	
	//  http://localhost:6805/area
	@GetMapping("area")
	
	public String area() {
		return "hambook/Area";
	}
	
	// http://localhost:6805/king?sort=like
	// http://localhost:6805/king?sort=latest
	@GetMapping("/king")
	public String showRestaurant(
	        @RequestParam(value = "sort", defaultValue = "like") String sort,
	        Model model) {

	    List<Restaurant> rstrList;
	    if ("latest".equals(sort)) {
	        rstrList = restaurantService.getRstrLatest();
	    } else {
	        rstrList = restaurantService.getRstrDesc(); // 추천순
	    }
	    Map<Integer, List<Review>> reviewMap = new HashMap<>();
	    for (Restaurant r : rstrList) {
	        List<Review> reviews = restaurantService.getReviewListById(r.getId());
	        reviewMap.put(r.getId(), reviews);
	    }
	    

	    model.addAttribute("rstrList", rstrList);
	    model.addAttribute("reviewMap", reviewMap);
	    model.addAttribute("sort", sort);
	    
	    return "hambook/review_king";
	}
	//  http://localhost:6805/areaplus
	@GetMapping("areaplus")
	public String areaplus() {
		return "hambook/Areaplus";
	}
	
	//  http://localhost:6805/list
	@GetMapping("list")
	public String list() {
		return "hambook/Restaurant_list";
	}
}