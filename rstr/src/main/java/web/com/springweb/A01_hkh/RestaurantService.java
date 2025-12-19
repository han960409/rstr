package web.com.springweb.A01_hkh;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.com.springweb.a00_prjdto.Restaurant;

@Service
public class RestaurantService {

    @Autowired
    private Dao dao;  // 

  
    public Restaurant getRestaurant() {
        return dao.getRestaurant();
    }

}

	

