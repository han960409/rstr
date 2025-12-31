package web.com.rstr.A01_hkh;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import web.com.rstr.common.dto.Comment;
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

        if (review != null) {
            // 이미지 처리
            if (review.getReviewImage() != null && !review.getReviewImage().isEmpty()) {
                review.setReviewImageList(
                    Arrays.asList(review.getReviewImage().split(","))
                );
            }

            // 🔥 댓글 무조건 포함
            List<Comment> comments = dao.findCommentsByReviewId((long) review.getId());
            review.setCommentList(comments != null ? comments : List.of());
        }

        return review;
    }
    public Review getReviewWithComments(int reviewId) {
        Review review = dao.findReviewById(reviewId);

        if (review != null) {
            // 리뷰 이미지 처리
            if (review.getReviewImage() != null && !review.getReviewImage().isEmpty()) {
                review.setReviewImageList(
                    Arrays.asList(review.getReviewImage().split(","))
                );
            }
            // 댓글 포함
            List<Comment> comments = dao.findCommentsByReviewId((long) reviewId);
            review.setCommentList(comments);
        }

        return review;
    }
    public List<Review> getReviewsByRestaurantId(int restaurantId) {

        List<Review> reviews =
                dao.findReviewsByRestaurantId(restaurantId);

        for (Review review : reviews) {

            // 이미지 처리
            if (review.getReviewImage() != null &&
                !review.getReviewImage().isEmpty()) {

                review.setReviewImageList(
                    Arrays.asList(review.getReviewImage().split(","))
                );
            }

            // 🔥🔥 댓글 세팅 (가장 중요)
            List<Comment> comments =
                    dao.findCommentsByReviewId((long) review.getId());

            review.setCommentList(
                    comments != null ? comments : List.of()
            );
        }

        return reviews;
    }
    public void signup(MemberVO vo) {
        dao.insertMember(vo);
    }
    public List<Restaurant> getAllRestaurant() {
    	
        return dao.getAllRestaurant();
    }
    public Restaurant findById(int id) {
        return dao.findById(id);
    }
    public List<Comment> getCommentsByReviewId(Long reviewId) {
        return dao.findCommentsByReviewId(reviewId);
    }

    /* 댓글 작성 */
    public void addComment(Comment comment) {
        dao.insertComment(comment);
    }
    
    public void deleteComment(Long commentId, String userId) {
        Comment comment = new Comment();
        comment.setId(commentId);
        comment.setUserId(userId);

        dao.deleteComment(comment); // ✅ Dao가 Comment 객체 받도록 호출
    }
    
    /**
     * 공감 처리
     * @param restaurantId : 공감할 가게 ID
     * @param userId : 로그인한 사용자 ID
     * @return : 새로운 공감 수, 이미 공감했으면 -1 반환
     */
    @Transactional
    public int addRecommend(int restaurantId) {

        // 1️⃣ restaurantId 기준 대표 리뷰 조회
        Review review = dao.findTopReviewByRestaurantId(restaurantId); // DAO 필요
        if (review == null) return -1;
        int reviewId = review.getId();

        // 2️⃣ review 테이블 공감 수 증가
        dao.addRecommend(reviewId);

        // 3️⃣ restaurant 테이블 공감 수 증가
        dao.updateRestaurantRecommend(restaurantId); // DAO 필요

        // 4️⃣ 최종 공감 수 조회 (restaurant 기준)
        return dao.getRestaurantRecommendCount(restaurantId); // DAO 필요
    }
    
}
