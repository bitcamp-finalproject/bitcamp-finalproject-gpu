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
@PropertySource("classpath:/naverAi.properties")
@ConfigurationProperties(prefix="ncp")
@Getter
@Setter
@ToString
public class NaverAiConfig {
  Logger log = LogManager.getLogger(getClass());

  public NaverAiConfig() {
    log.trace("NaverAiConfig 객체 생성됨!");
  }

  private String clientIdSummary;
  private String clientSecretSummary;
  private String urlSummary;
  private String clientIdTrans;
  private String clientSecretTrans;
  private String urlTrans;

}
