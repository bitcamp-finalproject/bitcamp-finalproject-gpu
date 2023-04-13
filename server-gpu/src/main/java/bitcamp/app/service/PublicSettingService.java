package bitcamp.app.service;

import java.util.List;
import bitcamp.app.vo.PublicSetting;

public interface PublicSettingService {
  List<PublicSetting> view(int memberNo);

  void add(PublicSetting ps);
  void update(PublicSetting ps);
}
