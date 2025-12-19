package web.com.springweb.a00_prjdto;

public class RestaurantImg {
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
   public RestaurantImg(int id, int restaurantId, String imgUrl, int sortOrder) {
      super();
      this.id = id;
      this.restaurantId = restaurantId;
      this.imgUrl = imgUrl;
      this.sortOrder = sortOrder;
   }
   public RestaurantImg() {
      super();
      // TODO Auto-generated constructor stub
   }
   private int id;
   private int restaurantId;
   private String imgUrl;
   private int sortOrder;
}

