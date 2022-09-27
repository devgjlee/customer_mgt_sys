package kr.co.mlec.regist.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mlec.board.service.BoardService;
import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.file.service.FileService;
import kr.co.mlec.member.service.MemberService;
import kr.co.mlec.member.vo.MemberVO;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class registController {
	@Autowired
	private BoardService service;
	
	@Autowired
	private MemberService mservice;
	
	@Autowired
	private FileService fservice;
	
	//신규 기업 고객 Form 조회
	@GetMapping("/regist")
	public ModelAndView regist(HttpSession session, @ModelAttribute("regisBoard") @Valid BoardVO regisBoard) {
		MemberVO user = (MemberVO)session.getAttribute("userVO");
		String id = user.getId();
		
		ModelAndView model = new ModelAndView("/regist/registForm");
		
		String userName = mservice.selectName(id);
		
		model.addObject("name", userName);
		
		return model;
			
	}
	
	// 신규 기업고객 DB insert
	@PostMapping("/regist")
	public String registInsert(@ModelAttribute("regisBoard") @Valid BoardVO regisBoard, BindingResult result, HttpServletRequest request) throws Exception {
		service.insertRegist(regisBoard);
		MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request;
		fservice.fileUpload(mRequest);
		return "redirect:/myCustomer";
	}
	
	//신규 행원 등록
	@GetMapping("/admin/registEmp")
	public ModelAndView registForm(@ModelAttribute("empRegisBoard")MemberVO empRegisBoard) {
		ModelAndView mav = new ModelAndView("/admin/registForm");
			
		return mav;
	}
		
	//신규 행원 DB insert
	@PostMapping("/admin/registEmp")
	public String registEmp(@ModelAttribute("empRegisBoard")MemberVO empRegisBoard) {
		mservice.insertNewEmp(empRegisBoard);
		
		return "redirect:/empDetail/" + empRegisBoard.getId();
	}
	
	//기존 행원 삭제 폼 조회
	@GetMapping("/{id}/modifyMyInfo")
	public ModelAndView modifyMyInfo(MemberVO empModifyBoard, @PathVariable("id")String empId) {
		MemberVO empInfo = mservice.selectEmpInfo(empId);
		
		ModelAndView mav = new ModelAndView("/member/modifyMyInfo");
		mav.addObject("empInfo", empInfo);
		
		return mav;
	}
	
	//기존 행원 수정 사항 DB update
	@PostMapping("/{id}/modifyEmp")
	public String modifyUpdate(MemberVO empModifyBoard, @PathVariable("id")String empId) {
		mservice.modifyEmp(empModifyBoard);
		
		return "redirect:/empDetail/"+ empId;
				
	}
	
}













