package bitcamp.app.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import bitcamp.app.vo.Follow;

@Mapper
public interface FollowDao {
  void insert(Follow follow);
  void delete(Follow follow);
  List<Integer> findAllFollowingNumbers(int no);
  List<Integer> findAllFollowerNumbers(int no);
  int checkState(Follow follow);
  int getFollowingCount(int memberNo);
  int getFollowerCount(int memberNo);
}
