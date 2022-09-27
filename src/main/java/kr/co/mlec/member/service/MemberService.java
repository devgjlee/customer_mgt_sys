package kr.co.mlec.member.service;

import java.util.List;

import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.branch.vo.BranchVO;
import kr.co.mlec.common.Pagination;
import kr.co.mlec.member.vo.MemberVO;

public interface MemberService {

	public MemberVO login(MemberVO member);
	
	public String selectName(String id);

	public String selectID(String keyword);

	public String selectType(String key);

	public List<MemberVO> selectAll(Pagination page);

	public MemberVO selectEmpInfo(String empId);

	public int selectMyCustomerCnt(String empId);

	public List<MemberVO> selectMyEmp(Pagination page);

	public List<BoardVO> selectDeleteY(Pagination page);

	public void insertNewEmp(MemberVO memberVO);

	public void deleteEmp(String empId);

	public int selectEmpCnt(Pagination pagination);

	public int selectMyEmpCnt(Pagination pagination);

	public int selectDeleteListCnt(Pagination pagination);
	
	public int myPageCnt(String empId);

	public void modifyEmp(MemberVO empModifyBoard);

	public void joinEmp(MemberVO memberVO);

	public List<BranchVO> selectBranch(Pagination pagination);

	public int selectBranchCnt(Pagination pagination);
}
