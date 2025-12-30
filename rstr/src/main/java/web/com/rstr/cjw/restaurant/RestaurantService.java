package web.com.rstr.cjw.restaurant;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import web.com.rstr.common.dto.Restaurant;
import web.com.rstr.common.dto.RestaurantImageDto;

@Service
public class RestaurantService {
    
    @Autowired
    private RestaurantDao rstrDao;
    
    @Autowired
    private RestaurantImageDao rstrImgDao;
    
    @Autowired
    private MenuDao menuDao;
    
    private static final String BASE_UPLOAD_DIR = "C:/Users/26/git/rstr2/rstr/src/main/resources/static/images/";
    
    
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
    
    
    @Transactional
    public int createRestaurant(
            String restaurantName,
            String category,
            String address,
            String city,
            String description,
            String operatingHours,
            String phone,
            List<MultipartFile> images,
            List<String> menuNames,
            List<Integer> menuPrices,
            List<String> menuDescriptions,
            List<MultipartFile> menuImages) throws IOException {
        
        Restaurant restaurant = new Restaurant();
        restaurant.setRestaurantName(restaurantName);
        restaurant.setCategory(category);
        restaurant.setAddress(address);
        restaurant.setCity(city);
        restaurant.setDescription(description);
        restaurant.setOperatingHours(operatingHours);
        restaurant.setPhone(phone);
        
        rstrDao.insertRestaurant(restaurant);
        int restaurantId = restaurant.getId();

        if (images != null && !images.isEmpty()) {
            String mainImagePath = null;
            
            for (int i = 0; i < images.size(); i++) {
                MultipartFile image = images.get(i);
                if (!image.isEmpty()) {

                    String imagePath = saveFile(image, restaurantId, "restaurant");
                    
                    if (i == 0) {
                        mainImagePath = imagePath;
                    }
                    

                    RestaurantImageDto imageDto = new RestaurantImageDto();
                    imageDto.setRestaurantId(restaurantId);
                    imageDto.setImgUrl(imagePath);
                    imageDto.setSortOrder(i + 1);
                    rstrImgDao.insertImage(imageDto);
                }
            }
            

            if (mainImagePath != null) {
                rstrDao.updateMainImage(restaurantId, mainImagePath);
            }
        }
        

        if (menuNames != null && !menuNames.isEmpty()) {
            for (int i = 0; i < menuNames.size(); i++) {
                Menu menu = new Menu();
                menu.setRestaurantId(restaurantId);
                menu.setName(menuNames.get(i));
                menu.setPrice(menuPrices.get(i));
                

                if (menuDescriptions != null && i < menuDescriptions.size()) {
                    menu.setDescription(menuDescriptions.get(i));
                }
                

                if (menuImages != null && i < menuImages.size() && !menuImages.get(i).isEmpty()) {
                    String menuImagePath = saveFile(menuImages.get(i), restaurantId, "menu");
                    menu.setProfileImgPath(menuImagePath);
                }
                
                menuDao.insertMenu(menu);
            }
        }
        
        return restaurantId;
    }
    

    private String saveFile(MultipartFile file, int restaurantId, String type) throws IOException {

        String uploadPath = BASE_UPLOAD_DIR + restaurantId + "/" + type + "/";
        File uploadDir = new File(uploadPath);      

        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        

        String originalFilename = file.getOriginalFilename();
        String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
        String savedFilename = UUID.randomUUID().toString() + extension;
        
        Path filePath = Paths.get(uploadPath + savedFilename);
        Files.write(filePath, file.getBytes());
        

        return "/images/" + restaurantId + "/" + type + "/" + savedFilename;
    }
}