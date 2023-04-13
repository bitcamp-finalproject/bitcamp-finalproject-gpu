package bitcamp.app.dao;

import org.apache.ibatis.annotations.Mapper;
import bitcamp.app.vo.Like;

@Mapper
public interface LikeBoardDao {
  void insert(Like like);
  void delete(Like like);
  int checkState(Like like);
  int countLiker(int boardNo);
}
