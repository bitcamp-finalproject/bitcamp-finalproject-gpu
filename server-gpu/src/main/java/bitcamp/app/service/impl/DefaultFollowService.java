package bitcamp.app.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import bitcamp.app.dao.FollowDao;
import bitcamp.app.service.FollowService;
import bitcamp.app.vo.Follow;

@Service
public class DefaultFollowService implements FollowService{

  @Autowired private FollowDao followDao;

  @Override
  public void follow(Follow follow) {
    followDao.insert(follow);
  }

  @Override
  public void unFollow(Follow follow) {
    followDao.delete(follow);
  }

  @Override
  public boolean checkState(Follow follow) {
    if (follow.getFollowingNo() == follow.getFollowerNo() ||
        followDao.checkState(follow) == 1) {
      return true;
    }
    return false;
  }

  @Override
  public int getFollowingCount(int memberNo) {
    return followDao.getFollowingCount(memberNo);
  }

  @Override
  public int getFollowerCount(int memberNo) {
    return followDao.getFollowerCount(memberNo);
  }
}
