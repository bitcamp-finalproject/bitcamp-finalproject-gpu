package bitcamp.app.vo;

import java.time.LocalDateTime;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

@Data
public class Point {
  private int logNo;
  private int type;
  private int getMemberNo;
  private int sendmemberNo;
  private int boardNo;
  private int point;

  @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+9")
  private LocalDateTime getDt;
}
