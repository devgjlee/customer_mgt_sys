package kr.co.mlec.board.service;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.mlec.board.dao.BoardDAO;
import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.common.Pagination;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	public List<BoardVO> selectBoard(Pagination pagination) {
		List<BoardVO> boardList = boardDAO.select(pagination);
		return boardList;
	}
	
	public List<BoardVO> consultForm(int boardNo) {
		List<BoardVO> consultList = boardDAO.selectConsultByNo(boardNo);
		return consultList;
	}

	public void insertBoard(BoardVO board) {
		boardDAO.insert(board);
	}

	public BoardVO detailBoard(int boardNo) {
		return boardDAO.selectByNo(boardNo);
	}
	
	public void deleteBoard(int boardNo) {
		boardDAO.deteleByNo(boardNo);
	}

	public List<BoardVO> selectMyCustomer(Pagination pagination) {
		List<BoardVO> boardList = boardDAO.selectMyCustomer(pagination);
		return boardList;
	}

	public void updateModify(BoardVO board) {
		boardDAO.updateModify(board);
	}

	public void insertRegist(BoardVO regisBoard) {
		boardDAO.insertRegist(regisBoard);
	}

	public void changeNtoY(int customerNo) {
		boardDAO.changeNtoY(customerNo);
	}

	public void changeYtoN(int customerNo) {
		boardDAO.changeYtoN(customerNo);
	}

	public int selectBoardListCnt(Pagination pagination) {
		int listCnt = boardDAO.selectBoardListCnt(pagination);
		return listCnt;
	}

	public void deleteCheckBoard(int boardNo) {
		boardDAO.deleteCheckBoard(boardNo);
	}

	public void consultUpdate(BoardVO boardVO) {
		boardDAO.consultUpdate(boardVO);
	}

	public int selectMyCustomerCnt(Pagination pagination) {
		return boardDAO.selectMyCustomerCnt(pagination);
	}

	public void noDelete(String customerNo) {
		boardDAO.noDelete(customerNo);
	}

	public String checkBizCategory(String companyNum) {
//		System.out.println("���񽺿��� ���ι�ȣ �������� Ȯ��: " + companyNum);
//		System.out.println("���񽺿��� ����������ȣ 2�ڸ� �ڸ���: " + companyNum.substring(4,6));
		int num = Integer.parseInt(companyNum.substring(4,6));
		int[] bizIndex = {11, 12, 13, 14, 21, 22, 31, 32, 33, 34, 35 ,36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 71, 81, 82, 83, 84, 85};
		String[] bizString = {"�ֽ�ȸ��", "�ո�ȸ��", "����ȸ��", "����ȸ��", "��ܹ���", "��ܹ���", "�б�����", "��ȸ��������", "�Ƿ����", "ȸ�����",
							  "����", "�����������", "������������", "�������������", "�긲����", "�߼ұ����������", "�ſ���������", "������������",
							  "�뵿����", "�������ݰ�", "�ǷẸ������", "��������", "���ȸ�Ǽ�", "��ȣ�ſ�ݰ�", "�ڵ�����ۻ��", "������������",
							  "�ֽ�ȸ��", "�ո�ȸ��", "����ȸ��", "����ȸ��", "��Ÿ"};
		int findIndex = 0;
		
		for(int i = 0; i < bizIndex.length; i++) {
			if(num == bizIndex[i]) {
				findIndex = i;
			}
		}
		String result = bizString[findIndex];
		
		return result;
	}

	
	
}











