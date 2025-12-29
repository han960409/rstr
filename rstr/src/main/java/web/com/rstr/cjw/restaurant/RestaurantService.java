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
    
    // 기본 업로드 경로
    private static final String BASE_UPLOAD_DIR = "C:/Users/26/git/rstr2/rstr/src/main/resources/static/images/";
    
    // ==================== 기존 코드 ====================
    
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
    
    // ==================== 새로 추가: 식당 등록 기능 ====================
    
    /**
     * 식당 등록
     * @return 등록된 식당 ID
     */
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
        
        // 1. 식당 기본 정보 저장
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
        // 2. 식당 이미지 저장
        if (images != null && !images.isEmpty()) {
            String mainImagePath = null;
            
            for (int i = 0; i < images.size(); i++) {
                MultipartFile image = images.get(i);
                if (!image.isEmpty()) {
                    // 파일 저장 (restaurantId 폴더 안에)
                    String imagePath = saveFile(image, restaurantId, "restaurant");
                    
                    // 첫 번째 이미지를 대표 이미지로
                    if (i == 0) {
                        mainImagePath = imagePath;
                    }
                    
                    // 이미지 정보 DB 저장
                    RestaurantImageDto imageDto = new RestaurantImageDto();
                    imageDto.setRestaurantId(restaurantId);
                    imageDto.setImgUrl(imagePath);
                    imageDto.setSortOrder(i + 1);  // 순서: 1, 2, 3...
                    rstrImgDao.insertImage(imageDto);
                }
            }
            
            // 대표 이미지 업데이트
            if (mainImagePath != null) {
                rstrDao.updateMainImage(restaurantId, mainImagePath);
            }
        }
        
        // 3. 메뉴 정보 저장
        if (menuNames != null && !menuNames.isEmpty()) {
            for (int i = 0; i < menuNames.size(); i++) {
                Menu menu = new Menu();
                menu.setRestaurantId(restaurantId);
                menu.setName(menuNames.get(i));
                menu.setPrice(menuPrices.get(i));
                
                // 메뉴 설명
                if (menuDescriptions != null && i < menuDescriptions.size()) {
                    menu.setDescription(menuDescriptions.get(i));
                }
                
                // 메뉴 이미지
                if (menuImages != null && i < menuImages.size() && !menuImages.get(i).isEmpty()) {
                    String menuImagePath = saveFile(menuImages.get(i), restaurantId, "menu");
                    menu.setProfileImgPath(menuImagePath);
                }
                
                menuDao.insertMenu(menu);
            }
        }
        
        return restaurantId;
    }
    
    /**
     * 파일 저장 메서드
     * @param file 업로드 파일
     * @param restaurantId 식당 ID
     * @param type "restaurant" 또는 "menu"
     * @return DB에 저장할 경로
     */
    private String saveFile(MultipartFile file, int restaurantId, String type) throws IOException {
        // 업로드 디렉토리: C:/Users/26/.../images/{restaurantId}/{type}/
        String uploadPath = BASE_UPLOAD_DIR + restaurantId + "/" + type + "/";
        File uploadDir = new File(uploadPath);
        
        // 디렉토리가 없으면 생성
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        
        // 고유한 파일명 생성 (중복 방지)
        String originalFilename = file.getOriginalFilename();
        String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
        String savedFilename = UUID.randomUUID().toString() + extension;
        
        // 파일 저장
        Path filePath = Paths.get(uploadPath + savedFilename);
        Files.write(filePath, file.getBytes());
        
        // DB에 저장할 경로 반환 (웹에서 접근 가능한 경로)
        return "/images/" + restaurantId + "/" + type + "/" + savedFilename;
    }
}