package kr.co.mlec.board.dao;

import java.util.List;

import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.common.Pagination;
import kr.co.mlec.member.vo.MemberVO;

/**
 * �Խ��� ������ CURD�� ���� ���Ŭ����
 * @author 401Prof
 *
 */
public interface BoardDAO {

	/**
	 * ��ü�Խñ� ��ȸ ����
	 * @return ��ȸ�� �Խù�
	 */
	List<BoardVO> select(Pagination pagination);
	
	/**
	 * ���۵�� ����
	 * @param board ����� �Խù� ����
	 */
	void insert(BoardVO board);
	
	/**
	 * �󼼰Խñ� ��ȸ ����
	 * @param boardNo ��ȸ�� �۹�ȣ
	 * @return ��ȸ�� �Խù�
	 */
	BoardVO selectByNo(int boardNo);
	
	/**
	 * �ش�Խñ� ���� ����
	 * @param boardNo ������ �۹�ȣ
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










