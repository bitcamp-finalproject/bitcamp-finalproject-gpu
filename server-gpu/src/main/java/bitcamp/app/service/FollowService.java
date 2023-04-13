package bitcamp.app.service;

import bitcamp.app.vo.Follow;

public interface FollowService {
  void follow(Follow follow);
  void unFollow(Follow follow);
  boolean checkState(Follow follow);
  int getFollowingCount(int memberNo);
  int getFollowerCount(int memberNo);
}
