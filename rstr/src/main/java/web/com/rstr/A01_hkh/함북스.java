package web.com.rstr.A01_hkh;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import web.com.rstr.common.dto.Restaurant;
import web.com.rstr.common.dto.Review;

@Controller
public class 함북스 {



    @Autowired
    private hambooksService hambooksService;

    // http://localhost:6805/home
    @GetMapping("home")
    public String home() {
        return "hambook/Home";
    }

 // http://localhost:6805/blog
    @GetMapping("/blog")
    public String blog(Model model) {

        // 리뷰 ID 1~5만 조회
        List<Review> reviews = hambooksService.getReviewsIdBetween1And5();
        for (Review review : reviews) {
            if (review.getReviewImage() != null && !review.getReviewImage().isEmpty()) {
            	review.setReviewImageList(
            		    Arrays.asList(review.getReviewImage().split(","))
            		);
            }
        }
        model.addAttribute("reviews", reviews);

        return "hambook/review_info";
    }
    // http://localhost:6805/review/restaurant/1
    @GetMapping("/review/restaurant/{restaurantId}")
    public String reviewByRestaurant(
            @PathVariable int restaurantId,
            Model model) {

        // 식당 정보
        Restaurant restaurant =
                hambooksService.getRestaurantById(restaurantId);

        // 해당 식당의 리뷰 목록
        List<Review> reviews =
                hambooksService.getReviewsByRestaurantId(restaurantId);
        // ⭐⭐⭐ 이 부분 추가 ⭐⭐⭐
        for (Review review : reviews) {
            if (review.getReviewImage() != null &&
                !review.getReviewImage().isEmpty()) {

                review.setReviewImageList(
                    Arrays.asList(review.getReviewImage().split(","))
                );
            }
        }

        model.addAttribute("restaurant", restaurant);
        model.addAttribute("reviews", reviews);

        return "hambook/review_info";
    }
    // http://localhost:6805/area
    @GetMapping("/area")
    public String showMap(Model model) {
        List<Restaurant> restaurants = hambooksService.getAllRestaurants();
        model.addAttribute("restaurants", restaurants);
        return "hambook/Area"; // area.jsp
    }

    // http://localhost:6805/king?sort=like
    // http://localhost:6805/king?sort=latest
    @GetMapping("/king")
    public String showRestaurant(
            @RequestParam(value = "sort", defaultValue = "like") String sort,
            Model model) {

        List<Restaurant> rstrList;

        if ("latest".equals(sort)) {
            rstrList = hambooksService.getRstrLatest();   // 최신순
        } else {
            rstrList = hambooksService.getRstrDesc();     // 🔥 공감 많은 순
        }

        List<Integer> restaurantIds = rstrList.stream()
                .map(Restaurant::getId)
                .toList();

        Map<Integer, Review> reviewMap =
                hambooksService.getTopReviewMap(restaurantIds);

        model.addAttribute("rstrList", rstrList);
        model.addAttribute("reviewMap", reviewMap);
        model.addAttribute("sort", sort);

        return "hambook/review_king";
    }

    // http://localhost:6805/areaplus
    @GetMapping("areaplus")
    public String areaplus() {
        return "hambook/Areaplus";
    }

    // http://localhost:6805/list
    @GetMapping("list")
    public String list() {
        return "hambook/Restaurant_list";
    }
}