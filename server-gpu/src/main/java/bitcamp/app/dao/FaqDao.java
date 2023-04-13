package bitcamp.app.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import bitcamp.app.vo.Faq;

@Mapper
public interface FaqDao {
  List<Faq> findFaqType();

  List<Faq> findFaq();

  List<Faq> findFaqByType(String faqTypeNo);
}
