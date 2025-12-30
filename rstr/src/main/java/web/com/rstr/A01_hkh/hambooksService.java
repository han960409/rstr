package web.com.rstr.A01_hkh;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.com.rstr.common.dto.MemberVO;
import web.com.rstr.common.dto.Restaurant;
import web.com.rstr.common.dto.Review;

@Service
public class hambooksService {

    @Autowired
    private Dao dao;

    /* ⭐ 식당별 대표 리뷰 Map */
    public Map<Integer, Review> getTopReviewMap(List<Integer> restaurantIds) {

        String ids = restaurantIds.stream()
                .map(String::valueOf)
                .collect(Collectors.joining(","));

        List<Review> reviews =
                dao.findTopReviewByRestaurantIds(ids);

        Map<Integer, Review> reviewMap = new HashMap<>();
        for (Review r : reviews) {
            reviewMap.put(r.getRestaurantId(), r);
        }
        return reviewMap;
    }

    /* 최신순 */
    public List<Restaurant> getRstrLatest() {
        return dao.getOrderByCreatedAtDesc();
    }

    /* 🔥 공감 많은 순 */
    public List<Restaurant> getRstrDesc() {
        return dao.getOrderByRecommendDesc();
    }
    public List<Restaurant> getAllRestaurants() {
        return dao.getAllRestaurants();
    }
    public List<Review> getReviewsIdBetween1And5() {
        return dao.selectIdBetween1And5();
    }
    public Restaurant getRestaurantById(int id) {
        return dao.findById(id);
    }
    public Review getReviewById(int id) {

        Review review = dao.findReviewById(id);

        if (review != null
            && review.getReviewImage() != null
            && !review.getReviewImage().isEmpty()) {

            review.setReviewImageList(
                Arrays.asList(review.getReviewImage().split(","))
            );
        }

        return review;
    }
    public List<Review> getReviewsByRestaurantId(int restaurantId) {
        return dao.findReviewsByRestaurantId(restaurantId);
    }
    public void signup(MemberVO vo) {
        dao.insertMember(vo);
    }
    public List<Restaurant> getAllRestaurant() {
        return dao.selectAllRestaurant();
    }

}
