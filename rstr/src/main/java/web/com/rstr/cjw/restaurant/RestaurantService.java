package web.com.rstr.cjw.restaurant;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.com.rstr.common.dto.RestaurantImageDto;



@Service
public class RestaurantService {

    @Autowired
    private RestaurantDao rstrDao;
    @Autowired
    private RestaurantImageDao rstrImgDao;
    @Autowired
    private MenuDao menuDao;

    public String findRstrNameById(int restaurantId) {
        return rstrDao.findRstrNameById(restaurantId);
    }

    public List<RestaurantImageDto> getRestaurantImages(int restaurantId) {
        return rstrImgDao.findByRestaurantId(restaurantId);
    }

    public List<Menu> getMenus(int restaurantId) {
        return menuDao.findMenusByRestaurantId(restaurantId);
    }

    public String getDesc(int restaurantId) {
        return rstrDao.getDesc(restaurantId);
    }

    public String getOpen(int restaurantId) {
        return rstrDao.getOpen(restaurantId);
    }

    public String getLoc(int restaurantId) {
        return rstrDao.getLoc(restaurantId);
    }

    public String getNum(int restaurantId) {
        return rstrDao.getNum(restaurantId);
    }
}
