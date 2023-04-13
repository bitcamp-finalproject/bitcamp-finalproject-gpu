package bitcamp.app.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import bitcamp.app.vo.Member;

@Mapper
public interface MemberDao {
  void insert(Member m);
  List<Member> findAll();
  Member findByNo(int no);
  Member findByEmailAndPassword(Map<String,Object> map);
  void lastLoginUpdate(int no);
  Member findByEmail(String email);
  Member findByNickname(String nickname);
  Member findByToken(String token);
  int update(Member m);
  int delete(int no);
  void updateProfile(Member m);
  void updateToken(Member m);
  void updateStateByToken(String token);
}
