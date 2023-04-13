package bitcamp.app.service;

import java.util.List;
import bitcamp.app.vo.AlarmSetting;

public interface AlarmSettingService {
  List<AlarmSetting> view(int memberNo);

  void add(AlarmSetting ps);
  void delete(AlarmSetting ps);
}
