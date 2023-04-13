package bitcamp.app.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import bitcamp.app.vo.PublicSetting;

@Mapper
public interface PublicSettingDao {
  void insert(PublicSetting ps);
  void update(PublicSetting ps);
  void delete(int typeNo);
  List<PublicSetting> getAll(int memberNo);
}
