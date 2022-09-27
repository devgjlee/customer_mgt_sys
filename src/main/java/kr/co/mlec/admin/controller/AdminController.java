package kr.co.mlec.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mlec.admin.service.AdminService;
import kr.co.mlec.board.service.BoardService;
import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.common.Pagination;
import kr.co.mlec.member.service.MemberService;
import kr.co.mlec.member.vo.MemberVO;

@Controller
public class AdminController {
	@Autowired
	private MemberService service;
	
	@Autowired
	private AdminService aservice;
	
	@Autowired
	private BoardService bservice;
	
	//��ü ��� ��ȸ
	@RequestMapping("/admin")
	public ModelAndView adminList(@RequestParam(required = false, defaultValue = "1") int page,
								  @RequestParam(required = false, defaultValue = "1") int range,
								  @RequestParam(required = false, defaultValue = "empId") String searchType,
								  @RequestParam(required = false) String keyword, HttpServletRequest request, Model model,
								  HttpSession session) throws Exception  {
		Pagination pagination = new Pagination();
		/*
		 * if (searchType.equals("name")) { String ID = service.selectID(keyword); //
		 * System.out.println("ID: " + ID); pagination.setKeyword(ID); } else { }
		 */
		pagination.setKeyword(keyword);
		pagination.setSearchType(searchType);
		
		//��ü ��� count
		int listCnt = service.selectEmpCnt(pagination);
//		 System.out.println("��ü �Խù� ����: " + listCnt);
		pagination.pageInfo(page, range, listCnt);
		List<MemberVO> boardList = service.selectAll(pagination);
		
		ModelAndView mav = new ModelAndView("/admin/adminList");
		mav.addObject("boardList", boardList);
		mav.addObject("listCnt", listCnt);
		mav.addObject("pagination3", pagination);
		
		return mav;
	}
	
	//��� �� ���� ��ȸ
	@RequestMapping("/empDetail/{id}")
	public ModelAndView empDetail(@PathVariable("id")String empId) {
//		System.out.println("Ŭ���� ��� ���: " + empId);
		int customerCnt = service.myPageCnt(empId);
//		int customerCnt =service.selectMyCustomerCnt(empId);	//��� �� �� ��ȸ
//		System.out.println("��� ����: " + customerCnt);
		MemberVO empDetail = service.selectEmpInfo(empId);		//��� �� ���� ��ȸ
		String phone = empDetail.getPhone();
		String result = "";
		
		if(phone != null && phone.length() >= 11 ) {
			result = phone.substring(0, 3) + "-" + phone.substring(3, 7) + "-" + phone.substring(7, 11);
		} else {
			result = phone;
		}
		
		ModelAndView mav = new ModelAndView("/admin/empDetail");
		mav.addObject("empInfo", empDetail);
		mav.addObject("phone", result);
		mav.addObject("customerCnt", customerCnt);
		
		return mav;
	}
	
	//��� ��� ��ȸ
	@RequestMapping("/myEmpList")
	public ModelAndView myEmp(@RequestParam(required = false, defaultValue = "1") int page,
							  @RequestParam(required = false, defaultValue = "1") int range,
							  @RequestParam(required = false, defaultValue = "empId") String searchType,
							  @RequestParam(required = false) String keyword, HttpServletRequest request, Model model,
							  HttpSession session) throws Exception   {
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		String id = userVO.getId();
		
		Pagination pagination = new Pagination();
		pagination.setKeyword(keyword);
		pagination.setSearchType(searchType);
		pagination.setId(id);

		int listCnt = service.selectMyEmpCnt(pagination);
//		System.out.println("������ ��� ��ȸ �� �Խù�: " + listCnt);

		pagination.pageInfo(page, range, listCnt);
		
		List<MemberVO> boardList = service.selectMyEmp(pagination);
		
		ModelAndView mav = new ModelAndView("/admin/myEmpList");
		
		mav.addObject("boardList", boardList);
		mav.addObject("listCnt", listCnt);
		mav.addObject("pagination4", pagination);
		
		return mav;
	}
	
	//���� ��û�� �� ���� ����Ʈ ��ȸ
	@RequestMapping("/admin/deleteList")
	public ModelAndView deleteList(@ModelAttribute("boardVO") BoardVO boardVO,
								  @RequestParam(required = false, defaultValue = "1") int page,
								  @RequestParam(required = false, defaultValue = "1") int range,
								  @RequestParam(required = false, defaultValue = "companyKor") String searchType,
								  @RequestParam(required = false) String keyword, HttpServletRequest request, Model model,
								  HttpSession session) throws Exception {
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		String id = userVO.getId();
		
		Pagination pagination = new Pagination();
		
		pagination.setId(id);
		pagination.setKeyword(keyword);
		pagination.setSearchType(searchType);
		
		int listCnt = service.selectDeleteListCnt(pagination);
//		System.out.println("������û �Խù� ����: " + listCnt);

		pagination.pageInfo(page, range, listCnt);
		
		List<BoardVO> boardList = service.selectDeleteY(pagination);
		
		ModelAndView mav = new ModelAndView("/admin/deleteList");
		mav.addObject("boardList", boardList);
		mav.addObject("listCnt", listCnt);
		mav.addObject("pagination5", pagination);
		
		return mav;
	}
	
	//���� ����
	@ResponseBody
	@RequestMapping("/admin/{no}/delete")
	public Map<String, String> deleteComplete(@PathVariable("no")int boardNo) {
		bservice.deleteBoard(boardNo);
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", boardNo + "�� �� ���� ������ �Ϸ�Ǿ����ϴ�.");
		return map;
	}
	
	//���� �ݷ�
	@RequestMapping("/admin/noDelete/{no}")
	public String noDelete(@PathVariable("no")String customerNo) {
		bservice.noDelete(customerNo);
		
		return "redirect:/admin/deleteList";
	}
	
	//�� ���� ��� ����
	@RequestMapping("/admin/{id}/empDel")
	public Map<String, String> deleteMyEmp(@PathVariable("id")String empId) {
		service.deleteEmp(empId);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", empId + "�� ����� ���� ������ �Ϸ�Ǿ����ϴ�.");
		return map;
	}
	
	// ���� ��Ʈ ������ ó��
	@ResponseBody
	@RequestMapping(value = "/empDetail/{no}/chartData.do", method = RequestMethod.POST)
	public List<GoogleChartDto> chartData(@PathVariable("no") String empNo) {
		List<MemberVO> consultCnt = aservice.selectConsutlCnt(empNo);
		Map<String, String> cntMap = new HashMap<String, String>();

		for (MemberVO list : consultCnt) {
			cntMap.put(list.getCompanyKor(), list.getCount());
//				System.out.println("customer_no: " + list.getCompanyKor());
//				System.out.println("count: " + list.getCount());
		}

		for (String key : cntMap.keySet()) {
			String value = cntMap.get(key);
//				System.out.println(key + ": " + value);
		}
		List<GoogleChartDto> lists = new ArrayList<GoogleChartDto>();

		for (int i = 0; i < consultCnt.size(); i++) {
			String no = consultCnt.get(i).getCompanyKor();
			int cnt = Integer.parseInt(consultCnt.get(i).getCount());
			lists.add(new GoogleChartDto(no, cnt));
		}
		return lists;
	}
}
