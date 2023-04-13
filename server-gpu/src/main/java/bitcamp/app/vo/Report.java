package bitcamp.app.vo;

import java.time.LocalDateTime;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;
import lombok.Data;

@Data
public class Report {
  private int boardNo;
  private int replyNo;
  private int memberNo;
  private int reportNo;
  private String reportType;
  private String content;

  @JsonFormat(
      shape = Shape.STRING,
      pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+9")
  private LocalDateTime reportDt;
}
