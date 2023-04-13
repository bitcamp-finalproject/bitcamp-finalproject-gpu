package bitcamp.app.dao;

import org.apache.ibatis.annotations.Mapper;
import bitcamp.app.vo.Point;

@Mapper
public interface PointDao {

  void userInsert(Point point);
  int findPointByBoard(int no);
  int findPoint(int no);
  void commentInsert(int no);
  void likeInsert(int no);
  void unlikeInsert(int no);
  void boardInsert(int no);
  void loginInsert(int no);
  void signupInsert(int no);

}
