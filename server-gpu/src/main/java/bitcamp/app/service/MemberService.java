package bitcamp.app.service;

import java.util.List;
import bitcamp.app.vo.Member;

public interface MemberService {
  void add(Member member) throws Exception;
  void addOfExternal(Member member);
  List<Member> list(String keyword);
  Member get(String email, String password);
  void lastLoginUpdate(int no);
  Member getByEmail(String email);
  Member getByNickname(String nickname);
  Member get(int no);
  void update(Member member);
  void delete(int no);
  List<Member> getFollowings(int no);
  List<Member> getFollowers(int no);
  void updateProfilePhoto(Member member);
  Member updateByVerifyToken(String token);
}
