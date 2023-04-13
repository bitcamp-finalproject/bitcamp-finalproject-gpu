package bitcamp.app.service.impl;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import bitcamp.app.dao.PointDao;
import bitcamp.app.service.PointService;
import bitcamp.app.vo.Point;

@Service
public class DefaultPointService implements PointService {

  Logger log = LogManager.getLogger(getClass());

  @Autowired private PointDao pointDao;

  @Override
  public void commentInsert(int no) {
    pointDao.commentInsert(no);
  }

  @Override
  public void likeInsert(int no) {
    pointDao.likeInsert(no);
  }

  @Override
  public void unlikeInsert(int no) {
    pointDao.unlikeInsert(no);
  }

  @Override
  public void boardInsert(int no) {
    pointDao.boardInsert(no);
  }

  @Override
  public void loginInsert(int no) {
    pointDao.loginInsert(no);
  }

  @Override
  public void signupInsert(int no) {
    pointDao.signupInsert(no);
  }

  @Override
  public int findPoint(int no) {
    return pointDao.findPoint(no);
  }

  @Override
  public int findPointByBoard(int no) {
    return pointDao.findPointByBoard(no);
  }

  @Override
  public void userInsert(Point point) {
    pointDao.userInsert(point);
  }

}
