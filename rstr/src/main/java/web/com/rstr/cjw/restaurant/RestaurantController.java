package web.com.rstr.cjw.restaurant;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class RestaurantController {

    @Autowired
    private RestaurantService service;

    // http://localhost:6805/restaurant/2
    @GetMapping("/restaurant/{id}")
    public String restaurantDetail(@PathVariable int id, Model d) {

        d.addAttribute("rstrName", service.findRstrNameById(id));
        d.addAttribute("images", service.getRestaurantImages(id));
        d.addAttribute("menus", service.getMenus(id));
        d.addAttribute("desc", service.getDesc(id));
        d.addAttribute("open", service.getOpen(id));
        d.addAttribute("num", service.getNum(id));
        d.addAttribute("loc", service.getLoc(id));

        return "hambook/restaurant-detail";
    }
    
    // http://localhost:6805/complete?id=1
    @GetMapping("/complete") 
    public String showCompletePage(@RequestParam Long id, Model model) {
        model.addAttribute("reservationId", id);    
        return "hambook/ReservationCompleteDetail";
    }
    
    // http://localhost:6805/login
    @GetMapping("/login")
    	public String login(Model a) {
    	return "hambook/LoginDetail";
    }
    
    // http://localhost:5050/map
    @GetMapping("/map")
    public String map(Model d) {
    	return "project_4th/map";
    }
    
    // http://localhost:5050/reservlist
    @GetMapping("/reservlist")
    public String reserv(Model d) {
    	return "project_4th/reservlist";
    }
    
    
    
}