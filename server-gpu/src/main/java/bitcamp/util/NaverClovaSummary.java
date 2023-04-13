package bitcamp.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import javax.management.RuntimeErrorException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.stereotype.Component;
import bitcamp.app.NaverAiConfig;

@Component
public class NaverClovaSummary {

  static Logger log = LogManager.getLogger(NaverClovaSummary.class);

  @Autowired private NaverAiConfig naverAiConfig;

  public String summarize(String originContent) {

    String clientId = naverAiConfig.getClientIdSummary();
    String clientSecret = naverAiConfig.getClientSecretSummary();
    String apiUrl = naverAiConfig.getUrlSummary();
    String language = "ko";
    String model = "general";
    String tone = "0";
    String summaryCount = "2";
    String summaryContent;
    
    String content = originContent.replaceAll("\n", ". ");

    try {
      URL url = new URL(apiUrl);
      HttpURLConnection con = (HttpURLConnection) url.openConnection();
      con.setRequestMethod("POST");

      con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
      con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
      con.setRequestProperty("Content-Type", "application/json");

      con.setDoOutput(true);
      OutputStreamWriter wr = new OutputStreamWriter(con.getOutputStream());
      String jsonRequest = "{\"document\": {\"content\": \"" + content + "\"}, \"option\": {\"language\": \"" + language + "\", \"model\": \"" + model + "\", \"tone\": " + tone + ", \"summaryCount\": " + summaryCount + "}}";
      log.info("jsonRequest >>> " + jsonRequest);
      
      wr.write(jsonRequest);
      wr.flush();
 
      int responseCode = con.getResponseCode();
      log.info("responseCode >>> " + responseCode);
      BufferedReader br;

      if (responseCode == 200) { // Success
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else { // Error
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }

      String inputLine;
      StringBuffer response = new StringBuffer();

      while ((inputLine = br.readLine()) != null) {
        response.append(inputLine);
      }
      br.close();

      summaryContent = response.toString();

      log.info("summaryContent >>> "+ summaryContent);
      //{"summary":"도시의 야경을 방안에서 보고 있다.\n분주한 도시는 항상 차가운 얼굴을 하고 있다."}
      //{"status":400,"error":{"errorCode":"E100","message":"Insufficient valid sentence"}}
      
      
      JSONObject jsonObject = new JSONObject(summaryContent);
      log.info("jsonObject.has(\"status\") >>> " + jsonObject.has("status"));
      if (jsonObject.has("status")) {
        JSONObject error = jsonObject.getJSONObject("error");
        log.info("error >>> " + error);
        String errorCode = error.getString("errorCode");
        log.info("errorCode >>> " + errorCode);
        
        switch (errorCode) {
          case "E001":  // 빈 문자열 or blank 문자
//            throw new RuntimeException("빈 문자열이 입력 되었습니다.");
          case "E003":  // 문장이 기준치보다 초과 했을 경우
//            throw new RuntimeException("입력된 문장 길이가 기준치를 초과 하였습니다.");
          case "E100":  //유효한 문장이 부족한 경우
//            throw new RuntimeException("유효한 문장이 부족합니다.");
            log.info("summaryContent E100 >>> "+ summaryContent);
            return summaryContent;
          case "E101":  // ko, ja 가 아닌 경우
            summaryContent = content;
            break;
          default:
//            throw new RuntimeException("Clova Summary 응답에서 기타 오류가 발생했습니다.");
        }
      }

      log.info("summaryContent2 >>> "+ summaryContent);
      return summaryContent;

    } catch (Exception e) {
      log.error("Error >>> " + e);

      return null;
    }
  }
}