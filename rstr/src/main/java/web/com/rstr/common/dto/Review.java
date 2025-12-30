package web.com.rstr.common.dto;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

import jakarta.validation.constraints.DecimalMax;
import jakarta.validation.constraints.DecimalMin;

public class Review {
	private int id;							/* 리뷰작성자 아이디 */
	private String title;					/* 리뷰 제목 */
	private String body;					/* 리뷰 본문 */
	private int restaurantId;				/* 레스토랑 아이디 */
	private int userId;						/* ? */
	private int userVisitId;				/* 유저 방문번호 */
	private LocalDateTime timeStamp;		/*  */
	@DecimalMin("0.5")						/* 평점 최소 */
	@DecimalMax("5.0")						/* 평점 최대 */
	private BigDecimal rating;				/* 평점 */
	private int receiveRecommend;			/* 추천 받은 수 */
	private String pfImage;					/* 프로필 이미지 */
	private List<String> reviewImageList;	/* 가게 리뷰 이미지*/
	private String reviewImage;
	private List<Comment> commentList;
	
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	public int getReceiveRecommend() {
		return receiveRecommend;
	}
	public void setReceiveRecommend(int receiveRecommend) {
		this.receiveRecommend = receiveRecommend;
	}
	public List<String> getReviewImageList() {
		return reviewImageList;
	}
	public String getReviewImage() {
		return reviewImage;
	}
	public void setReviewImage(String reviewImage) {
		this.reviewImage = reviewImage;
	}
	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Review(int id, String title, String body, int restaurantId, int userId, int userVisitId,
			LocalDateTime timeStamp, @DecimalMin("0.5") @DecimalMax("5.0") BigDecimal rating, int receiveRecommend,
			String pfImage, List<String> reviewImageList, String reviewImage, List<Comment> commentList) {
		super();
		this.id = id;
		this.title = title;
		this.body = body;
		this.restaurantId = restaurantId;
		this.userId = userId;
		this.userVisitId = userVisitId;
		this.timeStamp = timeStamp;
		this.rating = rating;
		this.receiveRecommend = receiveRecommend;
		this.pfImage = pfImage;
		this.reviewImageList = reviewImageList;
		this.reviewImage = reviewImage;
		this.commentList = commentList;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public int getRestaurantId() {
		return restaurantId;
	}
	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getUserVisitId() {
		return userVisitId;
	}
	public void setUserVisitId(int userVisitId) {
		this.userVisitId = userVisitId;
	}
	public LocalDateTime getTimeStamp() {
		return timeStamp;
	}
	public void setTimeStamp(LocalDateTime timeStamp) {
		this.timeStamp = timeStamp;
	}
	public BigDecimal getRating() {
		return rating;
	}
	public void setRating(BigDecimal rating) {
		this.rating = rating;
	}
	public int getReceive_recommend() {
		return receiveRecommend;
	}
	public void setReceive_recommend(int receive_recommend) {
		this.receiveRecommend = receive_recommend;
	}
	public String getPfImage() {
		return pfImage;
	}
	public void setPfImage(String pfImage) {
		this.pfImage = pfImage;
	}
	public List<String> getreviewImageList() {
		return reviewImageList;
	}
	public void setReviewImageList(List<String> reviewImageList) {
		this.reviewImageList = reviewImageList;
	}
	

}
