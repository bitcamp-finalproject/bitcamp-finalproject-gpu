package bitcamp.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@EnableTransactionManagement
@SpringBootApplication
@ComponentScan(basePackages = {"bitcamp.app", "bitcamp.util"})
public class App implements WebMvcConfigurer{

  public static void main(String[] args) {
    SpringApplication.run(App.class, args);
  }

  @Bean
  public WebMvcConfigurer corsConfigurer() {
    return new WebMvcConfigurer() {
      @Override
      public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
        .allowCredentials(true)  // SpringBoot + axios 사용 관련 AuthController 에서 HttpSession 동일 객체 사용을 위한 설정
        .allowedOrigins(
            "http://localhost:8080",
            "http://127.0.0.1:8080",
            "http://223.130.129.169:8080")
        .allowedMethods("*");
      }
    };
  }
}
