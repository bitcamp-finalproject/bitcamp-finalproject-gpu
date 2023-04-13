package bitcamp.app.dao;

import org.apache.ibatis.annotations.Mapper;
import bitcamp.app.vo.GeneratedImg;

@Mapper
public interface GeneratedImgDao {
  void insert(GeneratedImg generatedImg);
}
