package bitcamp.app.service.impl;

import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import bitcamp.app.dao.AlarmDao;
import bitcamp.app.service.AlarmService;
import bitcamp.app.vo.AlarmLog;

@Service
public class DefaultAlarmService implements AlarmService {

  Logger log = LogManager.getLogger(getClass());

  @Autowired private AlarmDao alarmDao;

  @Override
  public List<AlarmLog> list(int no) {
    return alarmDao.findAll(no);
  }

}
