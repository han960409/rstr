package web.com.rstr.A01_hkh;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.com.rstr.common.dto.Restaurant;
import web.com.rstr.common.dto.Review;

@Service
public class hambooksService {

    @Autowired
    private Dao dao;  // 

  
    public Restaurant getRestaurant() {
        return dao.getRestaurant();
    }
	public List<Restaurant> getRstrDesc(){
		return dao.getRstrDesc();
	}

	public List<Restaurant> getRstrLatest() {
	    return dao.getOrderByCreatedAtDesc();
	}
    public List<Review> getReviewListById(int restaurantId) {
        return dao.getReviewListById(restaurantId);
    }
}

	

