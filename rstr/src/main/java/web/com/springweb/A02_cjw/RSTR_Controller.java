package web.com.springweb.A02_cjw;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class RSTR_Controller {

    @Autowired
    private RSTR_Service service;
  	
    // http://localhost:5050/restaurant/2
    @GetMapping("/restaurant/2")
    public String restaurant2(Model d) {
        d.addAttribute("rstrName", service.findRstrNameById());
        List<RestaurantImg> images = service.getRestaurantImages(2);
        d.addAttribute("images", images); 
        List<Menu> menus = service.getMenus(2);
        d.addAttribute("menus", menus);
        d.addAttribute("desc", service.getDesc());
        d.addAttribute("open", service.getOpen());
        d.addAttribute("num", service.getNum());
        d.addAttribute("loc", service.getLoc());      
        return "project_4th/Hambook_View";
    }
    
    // http://localhost:5050/complete?id=1
    @GetMapping("/complete") 
    public String showCompletePage(@RequestParam Long id, Model model) {
        model.addAttribute("reservationId", id);    
        return "project_4th/Hambook_resv";
    }
    
    // http://localhost:5050/login
    @GetMapping("/login")
    	public String login(Model a) {
    	return "project_4th/Login";
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