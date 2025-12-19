package web.com.springweb.a00_A01_hkh;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.com.springweb.a00_prjdto.Restaurant;

@Service
public class RestaurantService {

    @Autowired
    private Dao dao;  // ✅ static 제거

    // ✅ 인스턴스 메서드로 변경
    public String getRestaurant() {
        return dao.getRestaurant();
    }

}

	

