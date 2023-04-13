package bitcamp.app.service;

import bitcamp.app.vo.Point;

public interface PointService {

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
