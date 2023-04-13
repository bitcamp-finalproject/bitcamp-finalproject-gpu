package bitcamp.app.vo;

import lombok.Data;

@Data
public class PublicSetting {
  private int typeNo;
  private String title;
  private String description;
  private int memberNo;
  private int rangeNo;
  private int rangeState;
}
