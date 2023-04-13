package bitcamp.app.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import bitcamp.app.dao.FollowDao;
import bitcamp.app.dao.MemberDao;
import bitcamp.app.service.MemberService;
import bitcamp.app.vo.Member;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMessage.RecipientType;

@Service
public class DefaultMemberService implements MemberService {

  Logger log = LogManager.getLogger(getClass());

  @Autowired private MemberDao memberDao;
  @Autowired private FollowDao followDao;
  @Autowired JavaMailSender mailSender;


  @Override
  public void add(Member member) throws Exception {

    memberDao.insert(member);
    memberDao.updateToken(member);

    String receiverMail = member.getEmail();
    MimeMessage message = mailSender.createMimeMessage();

    message.addRecipients(RecipientType.TO, receiverMail);// 보내는 대상
    message.setSubject("Artify 회원가입 이메일 인증");// 제목

    String body = "<div>"
        + "<h1> 안녕하세요. Artify 입니다</h1>"
        + "<br>"
        + "<p>아래 링크를 클릭하면 이메일 인증이 완료됩니다.<p>"
        + "<a href='http://localhost:3000/auth/verify?token=" + member.getToken() + "'>인증 링크</a>"
        + "</div>";

    message.setText(body, "utf-8", "html");// 내용, charset 타입, subtype
    // 보내는 사람의 이메일 주소, 보내는 사람 이름
    message.setFrom(new InternetAddress("bitcamp1@naver.com", "Artify_Admin"));// 보내는 사람
    mailSender.send(message);  // 메일 전송
  }

  @Override
  public void addOfExternal(Member member) {
    Member OldMember = memberDao.findByNickname(member.getNickname());

    if (OldMember != null) {
      String signUpMemberNickname = member.getNickname();

      if (signUpMemberNickname.equals(OldMember.getNickname())) {
        member.setNickname(signUpMemberNickname + "+");
      }
    }

    memberDao.insert(member);
  }

  @Override
  public List<Member> list(String keyword) {
    return memberDao.findAll();
  }

  @Override
  public Member get(String email, String password) {
    Map<String,Object> paramMap = new HashMap<>();
    paramMap.put("email", email);
    paramMap.put("password", password);

    log.debug(paramMap.toString());

    return memberDao.findByEmailAndPassword(paramMap);
  }

  @Override
  public Member getByEmail(String email) {
    return memberDao.findByEmail(email);
  }

  @Override
  public Member getByNickname(String nickname) {
    return memberDao.findByNickname(nickname);
  }

  @Override
  public void update(Member member) {
    memberDao.update(member);
  }

  @Override
  public void delete(int no) {

  }
  @Override
  public Member get(int no) {
    return memberDao.findByNo(no);
  }

  @Override
  public List<Member> getFollowings(int no) {
    List<Member> memberList = new ArrayList<>();
    followDao.findAllFollowingNumbers(no).forEach((followingNo) -> {
      memberList.add(get(followingNo));
    });
    return memberList;
  }

  @Override
  public List<Member> getFollowers(int no) {
    List<Member> memberList = new ArrayList<>();
    followDao.findAllFollowerNumbers(no).forEach((followerNo) -> {
      memberList.add(get(followerNo));
    });
    return memberList;
  }

  @Override
  public void updateProfilePhoto(Member member) {
    memberDao.updateProfile(member);
  }

  @Override
  public Member updateByVerifyToken(String token) {
    Member member = memberDao.findByToken(token);

    if (member != null) {
      memberDao.updateStateByToken(token);
      return member;
    } else {
      return null;
    }
  }

  @Override
  public void lastLoginUpdate(int no) {
    memberDao.lastLoginUpdate(no);
  }
}
