package web.com.rstr.cjw.restaurant;

import java.sql.Timestamp;

public class Menu {
	private int id;
    private String name;
    private int price;
    private int restaurantId;
    private String profileImgPath;
    private String description;
    private Timestamp createdAt;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getRestaurantId() {
		return restaurantId;
	}
	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}
	public String getProfileImgPath() {
		return profileImgPath;
	}
	public void setProfileImgPath(String profileImgPath) {
		this.profileImgPath = profileImgPath;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	public Menu(int id, String name, int price, int restaurantId, String profileImgPath, String description,
			Timestamp createdAt) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.restaurantId = restaurantId;
		this.profileImgPath = profileImgPath;
		this.description = description;
		this.createdAt = createdAt;
	}
	public Menu() {
		super();
		// TODO Auto-generated constructor stub
	}
}
