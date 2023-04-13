package bitcamp.util;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class GsonFilter {

  public static String summary(String summaryContentObj) {
    JsonObject jsonObj = JsonParser.parseString(summaryContentObj).getAsJsonObject();
    String summaryContent = jsonObj.get("summary").getAsString().replace("\n", " ");

    return summaryContent;
  }

  public static String translate(String transContentRaw) {
    JsonObject jsonObj = JsonParser.parseString(transContentRaw).getAsJsonObject();
    String transContent = jsonObj.get("message").getAsJsonObject()
        .get("result").getAsJsonObject()
        .get("translatedText").getAsString();

    return transContent;
  }

  //  public static void main(String[] args) {
  //    String content = {"message":{"result":{"srcLangType":"ko","tarLangType":"en","translatedText":"Even if you look outside the window, there are thick clouds, and you can hear the sound of falling rain over and over again and again. You should be careful because the road can be slippery because of the rain.","engineType":null,"pivot":null,"dict":null,"tarDict":null},"@type":"response","@service":"naverservice.nmt.proxy","@version":"1.0.0"}};
  //    String transContent = translate(content);
  //    System.out.println(transContent);
  //  }

}
