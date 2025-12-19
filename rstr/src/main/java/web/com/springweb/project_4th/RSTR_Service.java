package web.com.springweb.project_4th;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class RSTR_Service {

    @Autowired
    private RSTR_Dao rstrDao;
    @Autowired
    private RSTR_Img_Dao rstrImgDao;
    @Autowired
    private Menu_Dao menuDao;
    
    public String findRstrNameById() {
        return rstrDao.findRstrNameById();
    }
    public List<RestaurantImg> getRestaurantImages(int restaurantId) {
        return rstrImgDao.findByRestaurantId(restaurantId);
    }
    public List<Menu> getMenus(int restaurantId) {
        return menuDao.findMenusByRestaurantId(restaurantId);
    }
    public String getDesc() {
    	return rstrDao.getDesc();
    }
    public String getOpen() {
    	return rstrDao.getOpen();
    }
    public String getLoc() {
    	return rstrDao.getLoc();
    }
    public String getNum() {
    	return rstrDao.getNum();
    }
}
