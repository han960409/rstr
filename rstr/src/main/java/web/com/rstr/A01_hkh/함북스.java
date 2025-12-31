package web.com.rstr.A01_hkh;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;
import web.com.rstr.common.dto.Comment;
import web.com.rstr.common.dto.MemberVO;
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
    /* 댓글 등록 */


    /* 리뷰 상세 페이지에서 댓글 조회 */
    @GetMapping("/review/{reviewId}")
    public String reviewDetail(@PathVariable Long reviewId, Model model) {

        Review review = hambooksService.getReviewById(reviewId.intValue());

        // 댓글
        List<Comment> comments = hambooksService.getCommentsByReviewId(reviewId);
        review.setCommentList(comments);

        // 🔥 가게 정보
        Restaurant restaurant =
            hambooksService.getRestaurantById(review.getRestaurantId());

        model.addAttribute("reviews", List.of(review));
        model.addAttribute("restaurant", restaurant); // ← 이게 없었음

        return "hambook/review_info";
    }
    @PostMapping("/review/addComment")
    public String addComment(@RequestParam Long reviewId,
                             @RequestParam String userId,
                             @RequestParam String body) {

        Comment comment = new Comment();
        comment.setReviewId(reviewId);
        comment.setUserId(userId);
        comment.setBody(body);

        hambooksService.addComment(comment);

        // ✅ 반드시 review/{id}로
        return "redirect:/review/" + reviewId;
    }
    
    @PostMapping("/review/deleteComment")
    public String deleteComment(
            @RequestParam Long commentId,
            @RequestParam Long reviewId,
            @RequestParam String userId,
            HttpSession session) {

        MemberVO loginUser = (MemberVO) session.getAttribute("user");
        if (loginUser == null || !loginUser.getUserId().equals(userId)) {
            return "redirect:/review/" + reviewId;
        }

        hambooksService.deleteComment(commentId, userId);

        return "redirect:/review/" + reviewId;
    }
    
    @PostMapping("/restaurant/recommend")
    @ResponseBody
    public Map<String, Object> recommendRestaurant(@RequestParam int restaurantId, HttpSession session) {
        Map<String, Object> result = new HashMap<>();

        // 세션에서 로그인한 user 객체 가져오기
        Object userObj = session.getAttribute("user");
        if(userObj == null) {
            result.put("success", false);
            result.put("message", "로그인이 필요합니다.");
            return result;
        }

        // user 객체에서 userId 추출
        String userId = null;
        try {
            userId = (String) userObj.getClass().getMethod("getUserId").invoke(userObj);
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "세션 정보에 문제가 있습니다.");
            return result;
        }

        int newCount = hambooksService.addRecommend(restaurantId);
        result.put("success", true);
        result.put("newCount", newCount);
        return result;
    }
    
    // http://localhost:6805/list
    @GetMapping("/list")
    public String restaurantList(Model model) {

        List<Restaurant> restaurantList =
                hambooksService.getAllRestaurant();

        model.addAttribute("restaurantList", restaurantList);

        return "hambook/RestaurantList";
    }
    // http://localhost:6805/restaurant/26
    @GetMapping("/{id}")
    public String restaurantDetail(
            @PathVariable("id") int id,
            Model model) {

        Restaurant restaurant = hambooksService.findById(id);
        model.addAttribute("restaurant", restaurant);

        return "hambook/restaurant-detail"; // restaurant-detail.jsp
    }

    // http://localhost:6805/signup
    @GetMapping("/signup")
    public String signupForm() {
        return "hambook/join";
    }
    // http://localhost:6805/signup
    @PostMapping("/signup")
    public String signup(MemberVO vo) {
        if (vo.getRole() == null || vo.getRole().isBlank()) {
            vo.setRole("USER");
        }
        hambooksService.signup(vo);
        return "redirect:/login";
    }
}