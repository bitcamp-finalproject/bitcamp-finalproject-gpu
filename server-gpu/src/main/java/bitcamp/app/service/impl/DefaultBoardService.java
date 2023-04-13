package bitcamp.app.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import bitcamp.app.dao.BoardDao;
import bitcamp.app.dao.GeneratedImgDao;
import bitcamp.app.service.BoardService;
import bitcamp.app.vo.Board;
import bitcamp.app.vo.GeneratedImg;

@Service
public class DefaultBoardService implements BoardService{

  @Autowired private BoardDao boardDao;
  @Autowired private GeneratedImgDao generatedImgDao;

  @Transactional
  @Override
  public void add(Board board) {
    boardDao.insert(board);

    GeneratedImg generatedImg = new GeneratedImg();
    generatedImg.setFilename(board.getGeneratedImg().getFilename());
    generatedImg.setBoardNo(board.getBoardNo());
    generatedImgDao.insert(generatedImg);
  }

  @Override
  public List<Board> list(String keyword) {
    return boardDao.findAll(keyword);
  }

  @Override
  public Board get(int no) {
    return boardDao.findByNo(no);
  }

  @Override
  public List<Board> getByMemberNo(int memberNo) {
    return boardDao.findByMemberNo(memberNo);
  }

  @Override
  public void update(Board board) {

  }

  @Override
  public void delete(int no) {

  }

  @Override
  public List<Board> listHot() {
    return boardDao.findAllHot();
  }

  @Override
  public List<Board> listRecent() {
    return boardDao.findAllRecent();
  }

  @Override
  public List<Board> listFollow(int no) {
    return boardDao.findFollow(no);
  }


}
