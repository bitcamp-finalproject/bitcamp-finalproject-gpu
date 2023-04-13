package bitcamp.app.service;

import bitcamp.app.vo.Like;

public interface LikeService {
  void like(Like like, String type);
  void disLike(Like like, String type);
  boolean checkState(Like like, String type);
  int countLiker(int contentNo, String type);
}
