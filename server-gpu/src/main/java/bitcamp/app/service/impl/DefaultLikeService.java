package bitcamp.app.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import bitcamp.app.dao.LikeBoardDao;
import bitcamp.app.dao.LikeReplyDao;
import bitcamp.app.service.LikeService;
import bitcamp.app.vo.Like;

@Service
public class DefaultLikeService implements LikeService{

  @Autowired private LikeReplyDao likeReplyDao;
  @Autowired private LikeBoardDao likeBoardDao;

  @Override
  public void like(Like like, String type) {
    switch(type) {
      case "reply":
        likeReplyDao.insert(like);
        break;
      case "board":
        likeBoardDao.insert(like);
        break;
      default:
    }
  }

  @Override
  public void disLike(Like like, String type) {
    switch(type) {
      case "reply":
        likeReplyDao.delete(like);
        break;
      case "board":
        likeBoardDao.delete(like);
        break;
      default:
    }
  }

  @Override
  public boolean checkState(Like like, String type) {
    switch(type) {
      case "reply":
        if (likeReplyDao.checkState(like) == 1) { return true; }
        break;
      case "board":
        if (likeBoardDao.checkState(like) == 1) { return true; }
        break;
      default:
        return false;
    }
    return false;
  }

  @Override
  public int countLiker(int contentNo, String type) {
    switch(type) {
      case "reply":
        return likeReplyDao.countLiker(contentNo);

      case "board":
        return likeBoardDao.countLiker(contentNo);

      default:
        return 0;
    }
  }
}
