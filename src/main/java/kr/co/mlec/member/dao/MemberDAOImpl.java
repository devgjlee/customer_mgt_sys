package kr.co.mlec.member.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.branch.vo.BranchVO;
import kr.co.mlec.common.Pagination;
import kr.co.mlec.member.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	public MemberVO login(MemberVO member) {
		return session.selectOne("member.dao.MemberDAO.login", member);
	}

	public String selectName(String id) {
		return session.selectOne("member.dao.MemberDAO.selectName", id);
	}


	public String selectID(String name) {
		return session.selectOne("member.dao.MemberDAO.selectID", name);
	}

	public String selectType(String key) {
		return session.selectOne("member.dao.MemberDAO.selectType",key);
	}

	public List<MemberVO> selectAll(Pagination page) {
		return session.selectList("member.dao.MemberDAO.selectAll", page);
	}

	public MemberVO selectEmpInfo(String empId) {
		return session.selectOne("member.dao.MemberDAO.selectEmpInfo", empId);
	}

	public int selectMyCustomerCnt(String empId) {
		return session.selectOne("member.dao.MemberDAO.selectMyCustomerCnt",empId);
	}

	public List<MemberVO> selectConsultCnt(String empId) {
		return session.selectList("member.dao.MemberDAO.selectConsultCnt", empId);
	}

	public List<MemberVO> selecyMyEmp(Pagination page) {
		return session.selectList("member.dao.MemberDAO.selectMyEmp", page);
	}

	public List<BoardVO> seleteDeleteY(Pagination page) {
		return session.selectList("member.dao.MemberDAO.seleteDeleteY", page);
	}

	public void insertNewEmp(MemberVO memberVO) {
		session.insert("member.dao.MemberDAO.insertNewEmp", memberVO);
	}

	public void deleteEmp(String empId) {
		session.delete("member.dao.MemberDAO.deleteEmp", empId);
	}

	public int selectEmpCnt(Pagination pagination) {
		return session.selectOne("member.dao.MemberDAO.selectEmpCnt", pagination);
	}

	public int selectMyEmpCnt(Pagination pagination) {
		return session.selectOne("member.dao.MemberDAO.selectMyEmpCnt", pagination);
	}

	public int selectDeleteListCnt(Pagination pagination) {
		return session.selectOne("member.dao.MemberDAO.selectDeleteListCnt", pagination);
	}

	public int myPageCnt(String empId) {
		return session.selectOne("member.dao.MemberDAO.myPageCnt", empId);
	}

	public void modifyEmp(MemberVO empModifyBoard) {
		session.update("member.dao.MemberDAO.modifyEmp", empModifyBoard);
	}

	public void joinEmp(MemberVO memberVO) {
		session.insert("member.dao.MemberDAO.joinEmp", memberVO);
	}

	public List<BranchVO> selectBranch(Pagination pagination) {
		return session.selectList("member.dao.MemberDAO.selectBranch", pagination);
	}

	public int selectBranchCnt(Pagination pagination) {
		return session.selectOne("member.dao.MemberDAO.selectBranchCnt", pagination);
	}
}
