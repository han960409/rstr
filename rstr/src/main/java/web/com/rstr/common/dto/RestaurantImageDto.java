package web.com.rstr.common.dto;

public class RestaurantImageDto {
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRestaurantId() {
		return restaurantId;
	}
	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public int getSortOrder() {
		return sortOrder;
	}
	public void setSortOrder(int sortOrder) {
		this.sortOrder = sortOrder;
	}
	public RestaurantImageDto(int id, int restaurantId, String imgUrl, int sortOrder) {
		super();
		this.id = id;
		this.restaurantId = restaurantId;
		this.imgUrl = imgUrl;
		this.sortOrder = sortOrder;
	}
	public RestaurantImageDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	private int id;
	private int restaurantId;
	private String imgUrl;
	private int sortOrder;
}

