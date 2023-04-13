package bitcamp.app.vo;

import java.time.LocalDateTime;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;
import lombok.Data;

@Data
public class Board {
  private int boardNo;
  private String originContent;
  private String summaryContent;
  private String transContent;
  private String tag;
  private int likeCnt;
  private int viewCnt;
  private int boardPublic;
  private int replyPublic;
  private int reportCnt;
  private int photoNo;
  private String fileName;
  private Member writer;
  private GeneratedImg generatedImg;

  @JsonFormat(
      shape = Shape.STRING,
      pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+9")
  private LocalDateTime writeDt;

  @JsonFormat(
      shape = Shape.STRING,
      pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+9")
  private LocalDateTime updateDt;

  @JsonFormat(
      shape = Shape.STRING,
      pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+9")
  private LocalDateTime replyWriteDt;
}
