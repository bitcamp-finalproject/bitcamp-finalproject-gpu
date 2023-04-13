package bitcamp.app.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import bitcamp.app.dao.ReportDao;
import bitcamp.app.service.ReportService;
import bitcamp.app.vo.Report;

@Service
public class DefaultReportService implements ReportService{

  @Autowired private ReportDao reportDao;

  @Override
  public List<Report> findReportType() {
    return reportDao.findReportType();
  }

  @Override
  public void replyReport(Report report) {
    reportDao.replyReport(report);
  }

  @Override
  public void boardReport(Report report) {
    reportDao.boardReport(report);
  }

}
