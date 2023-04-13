package bitcamp.app;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Configuration
@PropertySource("classpath:/naverObjectStorage.properties")
@ConfigurationProperties(prefix="ncp")
@Getter
@Setter
@ToString
public class NaverObjectStorageConfig {
  Logger log = LogManager.getLogger(getClass());

  public NaverObjectStorageConfig() {
    log.trace("NaverConfig 객체 생성됨!");
  }

  private String endPoint; // ncp.endPoint 프로퍼티를 받는 필드
  private String regionName; // ncp.regionName 프로퍼티를 받는 필드
  private String accessKey; // ncp.accessKey 프로퍼티를 받는 필드
  private String secretKey; // ncp.secretKey 프로퍼티를 받는 필드
  private String bucketName;
}
