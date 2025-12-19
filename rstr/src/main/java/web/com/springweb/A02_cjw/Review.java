package web.com.springweb.A02_cjw;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import jakarta.validation.constraints.DecimalMax;
import jakarta.validation.constraints.DecimalMin;

public class Review {
	private int id;
	private String title;
	private String body;
	private int restaurantId;
	private int userId;
	private int userVisitId;
	private LocalDateTime timeStamp;
	@DecimalMin("0.5") 
	@DecimalMax("5.0")
	private BigDecimal rating;
	public Review() {}
	public Review(int id, String title, String body, int restaurantId, int userId, int userVisitId,
			LocalDateTime timeStamp, BigDecimal rating) {
		super();
		this.id = id;
		this.title = title;
		this.body = body;
		this.restaurantId = restaurantId;
		this.userId = userId;
		this.userVisitId = userVisitId;
		this.timeStamp = timeStamp;
		this.rating = rating;
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
	
}
