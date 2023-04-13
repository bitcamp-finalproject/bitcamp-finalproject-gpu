package bitcamp.app.vo;

import lombok.Data;

@Data
public class Faq {
  private String faqTypeNo;
  private String faqType;
  private String faqNo;
  private String title;
  private String content;
  private String writeDt;
}