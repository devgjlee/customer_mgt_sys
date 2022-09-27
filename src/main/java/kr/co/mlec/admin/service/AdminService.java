package kr.co.mlec.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mlec.common.Pagination;
import kr.co.mlec.member.dao.MemberDAO;
import kr.co.mlec.member.vo.MemberVO;

@Service
public class AdminService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	//한고객당 상담내역 수 select 
	public List<MemberVO> selectConsutlCnt(String empId) {
		List<MemberVO> consultCnt = memberDAO.selectConsultCnt(empId);
		return consultCnt;
	}

}
