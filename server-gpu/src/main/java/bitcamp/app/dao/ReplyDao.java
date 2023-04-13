package bitcamp.app.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import bitcamp.app.vo.Reply;

@Mapper
public interface ReplyDao {
  List<Reply> findByNo(int no);
  void insert(Reply reply);
  int countCommentLike(int no);
  void commentDelete(int no);
  int checkLikeState(Reply reply);
  void like(Reply reply);
  void unlike(Reply reply);
  void unlikeAll(int no);
}
