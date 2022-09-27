package kr.co.mlec.board.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.common.Pagination;

public interface BoardService {

	List<BoardVO> selectBoard(Pagination pagination);
	void insertBoard(BoardVO board);
	BoardVO detailBoard(int boardNo);
	void deleteBoard(int boardNo);
	List<BoardVO> consultForm(int boardNo);
	List<BoardVO> selectMyCustomer(Pagination pagination);
	void updateModify(BoardVO board);
	void insertRegist(BoardVO regisBoard);
	void changeNtoY(int customerNo);
	void changeYtoN(int customerNo);
	int selectBoardListCnt(Pagination pagination);
	int selectMyCustomerCnt(Pagination pagination);
	void deleteCheckBoard(int boardNo);
	void consultUpdate(BoardVO boardVO);
	void noDelete(String customerNo);
	String checkBizCategory(String bizNum);
}
