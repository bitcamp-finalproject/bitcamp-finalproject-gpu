package bitcamp.app.service;

import java.util.List;
import bitcamp.app.vo.Faq;

public interface FaqService {
  List<Faq> findFaqType();

  List<Faq> findFaq();

  List<Faq> findFaqByType(String faqTypeNo);
}
