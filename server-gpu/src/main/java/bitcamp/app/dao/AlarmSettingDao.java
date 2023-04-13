package bitcamp.app.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import bitcamp.app.vo.AlarmSetting;

@Mapper
public interface AlarmSettingDao {
  void insert(AlarmSetting as);
  void delete(AlarmSetting as);
  List<AlarmSetting> getAll(int memberNo);
}
