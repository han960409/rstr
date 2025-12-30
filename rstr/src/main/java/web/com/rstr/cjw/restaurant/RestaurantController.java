package web.com.rstr.cjw.restaurant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.util.List;

@Controller
public class RestaurantController {
    
    @Autowired
    private RestaurantService service;
    
    
    // http://localhost:6805/restaurant/1
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
    
    
    // http://localhost:6805/reservlist
    @GetMapping("/reservlist")
    public String reserv(Model d) {
        return "hambook/ReservListDetail";
    }
    
    
    // http://localhost:6805/restaurant/new (등록 페이지 보여주기)
    @GetMapping("/restaurant/new")
    public String showNewRestaurantPage() {
        return "hambook/restaurant-register";
    }
    
    // http://localhost:6805/restaurant/new (등록 처리)
    @PostMapping("/restaurant/new")
    public String createNewRestaurant(
            @RequestParam("rstrName") String restaurantName,
            @RequestParam("category") String category,
            @RequestParam("loc") String address,
            @RequestParam("city") String city,
            @RequestParam(value = "desc", required = false) String description,
            @RequestParam(value = "open", required = false) String operatingHours,
            @RequestParam(value = "num", required = false) String phone,
            @RequestParam(value = "restaurantImages", required = false) List<MultipartFile> images,
            @RequestParam(value = "menuNames", required = false) List<String> menuNames,
            @RequestParam(value = "menuPrices", required = false) List<Integer> menuPrices,
            @RequestParam(value = "menuDescriptions", required = false) List<String> menuDescriptions,
            @RequestParam(value = "menuImages", required = false) List<MultipartFile> menuImages,
            RedirectAttributes redirectAttributes) {
        
        try {
            // Service에 등록 요청 (ID 반환받음)
            int restaurantId = service.createRestaurant(
                restaurantName, category, address, city, description, operatingHours, phone,
                images, menuNames, menuPrices, menuDescriptions, menuImages
            );
            
            // 성공 메시지
            redirectAttributes.addFlashAttribute("successMessage", 
                "'" + restaurantName + "' 식당이 성공적으로 등록되었습니다!");
            
            // 방금 등록한 식당 상세 페이지로 이동
            return "redirect:/restaurant/" + restaurantId;
            
        } catch (Exception e) {
            e.printStackTrace();
            
            // 에러 메시지
            redirectAttributes.addFlashAttribute("errorMessage", 
                "등록 실패: " + e.getMessage());
            
            // 다시 등록 페이지로
            return "redirect:/restaurant/new";
        }
    }
}