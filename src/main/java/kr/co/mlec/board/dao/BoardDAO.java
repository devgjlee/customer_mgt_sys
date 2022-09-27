package kr.co.mlec.board.dao;

import java.util.List;

import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.common.Pagination;
import kr.co.mlec.member.vo.MemberVO;

/**
 * 게시판 데이터 CURD를 위한 기능클래스
 * @author 401Prof
 *
 */
public interface BoardDAO {

	/**
	 * 전체게시글 조회 서비스
	 * @return 조회된 게시물
	 */
	List<BoardVO> select(Pagination pagination);
	
	/**
	 * 새글등록 서비스
	 * @param board 등록할 게시물 정보
	 */
	void insert(BoardVO board);
	
	/**
	 * 상세게시글 조회 서비스
	 * @param boardNo 조회할 글번호
	 * @return 조회된 게시물
	 */
	BoardVO selectByNo(int boardNo);
	
	/**
	 * 해당게시글 삭제 서비스
	 * @param boardNo 삭제할 글번호
	 */
	void deteleByNo(int boardNo);

	List<BoardVO> selectConsultByNo(int boardNo);

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
	

}










