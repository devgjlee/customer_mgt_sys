package kr.co.mlec.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.common.Pagination;
/**
 * mybatis를 통한 oracle DB 게시판 CRUD 구현클래스
 * @author 401Prof
 *
 */
@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	public List<BoardVO> select(Pagination pagination) {
		List<BoardVO> list = session.selectList("board.dao.BoardDAO.selectAll", pagination);
		
		return list;
	}

	public void insert(BoardVO board) {
		
		session.insert("board.dao.BoardDAO.insert", board);
	}

	public BoardVO selectByNo(int boardNo) {
		BoardVO board = session.selectOne("board.dao.BoardDAO.selectByNo", boardNo);
		return board;
	}

	public void deteleByNo(int boardNo) {
		session.delete("board.dao.BoardDAO.deleteByNo", boardNo);
	}

	public List<BoardVO> selectConsultByNo(int boardNo) {
		List<BoardVO> consult = session.selectList("board.dao.BoardDAO.selectConsultByNo", boardNo);
		
		return consult;
	}

	public List<BoardVO> selectMyCustomer(Pagination pagination) {
		List<BoardVO> list = session.selectList("board.dao.BoardDAO.selectMyCustomer", pagination);
		
		return list;
	}

	public void updateModify(BoardVO board) {
		session.update("board.dao.BoardDAO.updateModify", board);
	}

	public void insertRegist(BoardVO regisBoard) {
		session.insert("board.dao.BoardDAO.insertRegist", regisBoard);
	}

	public void changeNtoY(int customerNo) {
		session.update("board.dao.BoardDAO.changeNtoY", customerNo);
	}

	public void changeYtoN(int customerNo) {
		session.update("board.dao.BoardDAO.changeYtoN", customerNo);
	}

	public int selectBoardListCnt(Pagination pagination) {
		int listCnt = session.selectOne("board.dao.BoardDAO.selectBoardListCnt", pagination);
		return listCnt;
	}
	
	public int selectMyCustomerCnt(Pagination pagination) {
		int listCnt = session.selectOne("board.dao.BoardDAO.selectMyCustomerCnt", pagination);
		return listCnt;
	}
	public void deleteCheckBoard(int boardNo) {
		session.update("board.dao.BoardDAO.deleteCheckBoard", boardNo);
	}

	public void consultUpdate(BoardVO boardVO) {
		session.update("board.dao.BoardDAO.consultUpdate", boardVO);
	}

	public void noDelete(String customerNo) {
		session.update("board.dao.BoardDAO.noDelete", customerNo);
	}

	
	
}














