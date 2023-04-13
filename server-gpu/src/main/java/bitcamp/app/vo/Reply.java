package bitcamp.app.vo;

import java.time.LocalDateTime;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

@Data
public class Reply {
  private int replyNo;
  private int boardNo;
  private String content;
  private int memberNo;
  private Member writer;

  @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+9")
  private LocalDateTime writeDt;
}
