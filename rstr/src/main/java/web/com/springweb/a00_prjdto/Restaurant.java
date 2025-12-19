package web.com.springweb.a00_prjdto;

import java.time.LocalDateTime;

public class Restaurant {
    private int id;
    private String restaurantName;
    public Restaurant(int id) {
		super();
		this.id = id;
	}
	public int getId() {
      return id;
   }
   public void setId(int id) {
      this.id = id;
   }
   public String getRestaurantName() {
      return restaurantName;
   }
   public void setRestaurantName(String restaurantName) {
      this.restaurantName = restaurantName;
   }
   public String getOperatingHours() {
      return operatingHours;
   }
   public void setOperatingHours(String operatingHours) {
      this.operatingHours = operatingHours;
   }
   public String getCategory() {
      return category;
   }
   public void setCategory(String category) {
      this.category = category;
   }
   public String getAddress() {
      return address;
   }
   public void setAddress(String address) {
      this.address = address;
   }
   public String getCity() {
      return city;
   }
   public void setCity(String city) {
      this.city = city;
   }
   public String getPhone() {
      return phone;
   }
   public void setPhone(String phone) {
      this.phone = phone;
   }
   public String getDescription() {
      return description;
   }
   public void setDescription(String description) {
      this.description = description;
   }
   public LocalDateTime getCreatedAt() {
      return createdAt;
   }
   public void setCreatedAt(LocalDateTime createdAt) {
      this.createdAt = createdAt;
   }
   public Restaurant(int id, String restaurantName, String operatingHours, String category, String address,
         String city, String phone, String description, LocalDateTime createdAt) {
      super();
      this.id = id;
      this.restaurantName = restaurantName;
      this.operatingHours = operatingHours;
      this.category = category;
      this.address = address;
      this.city = city;
      this.phone = phone;
      this.description = description;
      this.createdAt = createdAt;
   }
   private String operatingHours;
    private String category;
    private String address;
    private String city;
    private String phone;                    
    private String description;
    private LocalDateTime createdAt;
   public Restaurant() {
      super();
      // TODO Auto-generated constructor stub
   }
}
