package bitcamp.app.service;

import java.util.List;
import bitcamp.app.vo.Report;

public interface ReportService {
  void replyReport(Report report);
  void boardReport(Report report);
  List<Report> findReportType();
}
