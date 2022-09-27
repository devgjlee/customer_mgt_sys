package kr.co.mlec.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.branch.vo.BranchVO;
import kr.co.mlec.common.Pagination;
import kr.co.mlec.member.dao.MemberDAO;
import kr.co.mlec.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	public MemberVO login(MemberVO member) {

		return memberDAO.login(member);
	}
	
	public String selectName(String id) {
		
		return memberDAO.selectName(id);
		
	}
	
	public String selectID(String name) {
		return memberDAO.selectID(name);
	}
	
	public String selectType(String key) {
		return memberDAO.selectType(key);
	}

	public List<MemberVO> selectAll(Pagination page) {
		return memberDAO.selectAll(page);
	}

	public MemberVO selectEmpInfo(String empId) {
		return memberDAO.selectEmpInfo(empId);
	}

	public int selectMyCustomerCnt(String empId) {
		return memberDAO.selectMyCustomerCnt(empId);
	}

	public List<MemberVO> selectMyEmp(Pagination page) {
		return memberDAO.selecyMyEmp(page);
	}

	public List<BoardVO> selectDeleteY(Pagination page) {
		return memberDAO.seleteDeleteY(page);
	}

	public void insertNewEmp(MemberVO  memberVO) {
		memberDAO.insertNewEmp(memberVO);
	}

	public void deleteEmp(String empId) {
		memberDAO.deleteEmp(empId);
	}

	public int selectEmpCnt(Pagination pagination) {
		return memberDAO.selectEmpCnt(pagination);
	}

	public int selectMyEmpCnt(Pagination pagination) {
		return memberDAO.selectMyEmpCnt(pagination);
	}

	public int selectDeleteListCnt(Pagination pagination) {
		return memberDAO.selectDeleteListCnt(pagination);
	}

	public int myPageCnt(String empId) {
		return memberDAO.myPageCnt(empId);
	}

	public void modifyEmp(MemberVO empModifyBoard) {
		memberDAO.modifyEmp(empModifyBoard);
	}

	public void joinEmp(MemberVO memberVO) {
		memberDAO.joinEmp(memberVO);
	}

	public List<BranchVO> selectBranch(Pagination pagination) {
		return memberDAO.selectBranch(pagination);
	}

	public int selectBranchCnt(Pagination pagination) {
		return memberDAO.selectBranchCnt(pagination);
	}
}
