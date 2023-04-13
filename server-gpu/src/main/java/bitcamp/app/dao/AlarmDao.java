package bitcamp.app.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import bitcamp.app.vo.AlarmLog;

@Mapper
public interface AlarmDao {

  List<AlarmLog> findAll(int no);

}
