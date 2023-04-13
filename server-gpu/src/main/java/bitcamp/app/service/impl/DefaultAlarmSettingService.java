package bitcamp.app.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import bitcamp.app.dao.AlarmSettingDao;
import bitcamp.app.service.AlarmSettingService;
import bitcamp.app.vo.AlarmSetting;

@Service
public class DefaultAlarmSettingService implements AlarmSettingService{

  @Autowired private AlarmSettingDao alarmSettingDao;

  @Override
  public List<AlarmSetting> view(int memberNo) {
    return alarmSettingDao.getAll(memberNo);
  }

  @Override
  public void add(AlarmSetting ps) {
    alarmSettingDao.insert(ps);
  }

  @Override
  public void delete(AlarmSetting ps) {
    alarmSettingDao.delete(ps);
  }


}
