package web.com.rstr;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(
    scanBasePackages = {
        "web.com"          
    }
)
@MapperScan("web.com.springweb")  // MyBatis Mapper
public class Prj04Application {

    public static void main(String[] args) {
        SpringApplication.run(Prj04Application.class, args);
    }
}