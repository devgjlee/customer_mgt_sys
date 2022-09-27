package kr.co.mlec.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mlec.branch.vo.BranchVO;
import kr.co.mlec.common.Pagination;
import kr.co.mlec.member.service.MemberService;
import kr.co.mlec.member.vo.MemberVO;

@SessionAttributes("userVO")
@Controller
public class LoginController {
	
	@Autowired
	private MemberService service;

	@GetMapping("/login")
	public String loginForm() {
		
		return "member/login";
	}
	
	@PostMapping("/login")
	public String login(MemberVO member, Model model) {
		
		MemberVO userVO = service.login(member);
		
		if(userVO == null) {
			// 로그인 실패
			return "member/login";
		}
		
		// 로그인 성공
		
		// 세션에 등록
		model.addAttribute("userVO", userVO);
		
		String id = userVO.getId();
		char type = service.selectType(id).charAt(0);
		
		String url = "";
		if(type == 'U') {
			url = "/myCustomer";
		} else if(type == 'S') {
			url =  "/myEmpList";
		}
		
		return "redirect:" + url;
	}
	
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
	
		status.setComplete();
		return "redirect:member/login";
		
	}
	
	@RequestMapping("/mypage")
	public String mypage(HttpSession session) {
		MemberVO userVO = (MemberVO)session.getAttribute("userVO");
		String id = userVO.getId();
		
		return "redirect:/empDetail/" + id;
		
	}
	
	@GetMapping("/join")
	public String joinForm() {
		return "member/join";
	}
	
	@PostMapping("/join")
	public String join(MemberVO memberVO) {
		
		service.joinEmp(memberVO);
		
		return "redirect:/login";
	}

	@GetMapping("/findBranch")
	public String findBranch() {
		return "/member/findBranch";
	}
	
	@RequestMapping("/findBranchResult") 
	public ModelAndView findBranchResult(@RequestParam(required = false, defaultValue = "1") int page,
										 @RequestParam(required = false, defaultValue = "1") int range,
										 @RequestParam(required = false) String keyword, HttpServletRequest request, Model model,
										 HttpSession session ) throws Exception{
//		System.out.println("keyword.." + keyword);
		
		Pagination pagination = new Pagination();
		
		pagination.setKeyword(keyword);
		
		session.setAttribute("keyword2", keyword);
		
		int listCnt = service.selectBranchCnt(pagination);
		System.out.println("전체 검색 결과 수: " + listCnt);
		pagination.pageInfo(page, range, listCnt);

		List<BranchVO> branchList = service.selectBranch(pagination);
		
		ModelAndView mav = new ModelAndView("/member/findBranch");

		mav.addObject("branchVO", branchList);
		mav.addObject("listCnt", listCnt);
		mav.addObject("pagination6", pagination);
		mav.addObject("keyword", pagination.getKeyword());
		mav.addObject("searchType", pagination.getSearchType());
		return mav;
	}
}

















