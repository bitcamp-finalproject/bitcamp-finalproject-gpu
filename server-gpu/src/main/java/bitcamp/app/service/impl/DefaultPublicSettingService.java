package bitcamp.app.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import bitcamp.app.dao.PublicSettingDao;
import bitcamp.app.service.PublicSettingService;
import bitcamp.app.vo.PublicSetting;

@Service
public class DefaultPublicSettingService implements PublicSettingService{

  @Autowired private PublicSettingDao publicSettingDao;

  @Override
  public List<PublicSetting> view(int memberNo) {
    return publicSettingDao.getAll(memberNo);
  }

  @Override
  public void add(PublicSetting ps) {
    publicSettingDao.insert(ps);
  }

  @Override
  public void update(PublicSetting ps) {
    publicSettingDao.update(ps);
  }


}
