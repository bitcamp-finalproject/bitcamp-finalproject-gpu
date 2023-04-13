package bitcamp.util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import bitcamp.app.NaverAiConfig;

@Component
public class NaverPapagoTranslation {

  static Logger log = LogManager.getLogger(NaverPapagoTranslation.class);

  @Autowired private NaverAiConfig naverAiConfig;

  public String translate(String summaryContent) {

    String clientId = naverAiConfig.getClientIdTrans();
    String clientSecret = naverAiConfig.getClientSecretTrans();
    String apiURL = naverAiConfig.getUrlTrans();
    String source = "ko";
    String target = "en";

    try {
      String text = URLEncoder.encode(summaryContent, "UTF-8");
      URL url = new URL(apiURL);

      HttpURLConnection con = (HttpURLConnection) url.openConnection();
      con.setRequestMethod("POST");
      con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
      con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);

      // post request
      String postParams = "source=" + source + "&target=" + target + "&text=" + text;

      con.setDoOutput(true);
      DataOutputStream wr = new DataOutputStream(con.getOutputStream());
      wr.writeBytes(postParams);
      wr.flush();
      wr.close();

      int responseCode = con.getResponseCode();
      BufferedReader br;

      if(responseCode==200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {  // 오류 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }

      String inputLine;
      StringBuffer response = new StringBuffer();

      while ((inputLine = br.readLine()) != null) {
        response.append(inputLine);
      }
      br.close();

      String transContent0 = response.toString();
      log.info("transContent0 >>> " + transContent0);
      String transContent = transContent0.replaceAll("[가-힣]", "");
      log.info("transContent >>> " + transContent);

      return transContent;

    } catch (Exception e) {
      log.error(e);

      return null;
    }
  }
}
