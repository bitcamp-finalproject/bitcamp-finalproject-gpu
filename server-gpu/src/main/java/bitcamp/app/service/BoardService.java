package bitcamp.app.service;

import java.util.List;
import bitcamp.app.vo.Board;

public interface BoardService {
  void add(Board board);
  List<Board> list(String keyword);
  List<Board> listHot();
  List<Board> listRecent();
  List<Board> listFollow(int no);
  Board get(int no);
  List<Board> getByMemberNo(int memeberNo);
  void update(Board board);
  void delete(int no);
}
