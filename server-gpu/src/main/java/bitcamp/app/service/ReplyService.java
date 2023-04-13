package bitcamp.app.service;

import java.util.List;
import bitcamp.app.vo.Reply;

public interface ReplyService {
  List<Reply> get(int no);
  void insert(Reply reply);
  int countCommentLike(int no);
  void commentDelete(int no);
  boolean checkLikeState(Reply reply);
  void like(Reply reply);
  void unlike(Reply reply);
}
