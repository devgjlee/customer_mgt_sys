package kr.co.mlec.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mlec.board.service.BoardService;
import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.common.Pagination;
import kr.co.mlec.file.service.FileService;
import kr.co.mlec.file.vo.FileVO;
import kr.co.mlec.member.service.MemberService;
import kr.co.mlec.member.vo.MemberVO;

@Controller
public class BoardController {

	@Autowired
	private BoardService service;

	@Autowired
	private FileService fservice;

	@Autowired
	private MemberService mservice;

	// 전체 기업고객 조회
	@RequestMapping("/board")
	public ModelAndView list(@ModelAttribute("boardVO") BoardVO boardVO,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "companyKor") String searchType,
			@RequestParam(required = false) String keyword, HttpServletRequest request, Model model,
			HttpSession session ) throws Exception {
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		String id = userVO.getId();

		char type = mservice.selectType(id).charAt(0);

		Pagination pagination = new Pagination();

		// 행원 이름으로 검색했을 때 empid를 가져와서 selectBoard 해줘야할 듯?
		if (searchType.equals("name")) {
			String ID = mservice.selectID(keyword);
//        	System.out.println("ID: " + ID);
			pagination.setKeyword(ID);
		} else {
			pagination.setKeyword(keyword);
		}
		pagination.setSearchType(searchType);
		
		session.setAttribute("keyword", keyword);
		session.setAttribute("searchType", searchType);
		
		// 전체리스트 개수
		int listCnt = service.selectBoardListCnt(pagination);
//        System.out.println("전체 게시물 개수: " + listCnt);

		pagination.pageInfo(page, range, listCnt);

		List<BoardVO> boardList = service.selectBoard(pagination);
		
		ModelAndView mav = new ModelAndView();
		mav = new ModelAndView("/board/list");

		mav.addObject("boardList", boardList);
		mav.addObject("listCnt", listCnt);
		mav.addObject("pagination", pagination);
		mav.addObject("keyword", pagination.getKeyword());
		mav.addObject("searchType", pagination.getSearchType());
		return mav;
	}

	// 담당 기업 고객 조회
	@RequestMapping("/myCustomer")
	public ModelAndView myCustomerlist(@RequestParam(required = false, defaultValue = "1") int page,
									   @RequestParam(required = false, defaultValue = "1") int range,
									   @RequestParam(required = false, defaultValue = "companyKor") String searchType,
									   @RequestParam(required = false) String keyword,
									   HttpSession session) {
		Pagination pagination = new Pagination();
		pagination.setSearchType(searchType);
		pagination.setKeyword(keyword);
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		String user = userVO.getId();
		pagination.setId(user);
//		System.out.println(pagination.getId());
		
		// 전체리스트 개수
		int listCnt = service.selectMyCustomerCnt(pagination);
//		System.out.println("1. 전체 게시물 개수: " + listCnt);

		pagination.pageInfo(page, range, listCnt);
		
		List<BoardVO> boardList = service.selectMyCustomer(pagination);
		ModelAndView mav = new ModelAndView("/myCustomer/myCustomer");
		mav.addObject("myCustomerList", boardList);
		mav.addObject("listCnt2", listCnt);
		mav.addObject("pagination2", pagination);
		return mav;
	}

	// 수정 폼 조회
	@GetMapping("/board/{no}/modify")
	public ModelAndView modify(@PathVariable("no") int boardNo) {

		BoardVO board = service.detailBoard(boardNo);
		
		// 법인 번호
		String companyNum = board.getCorporationNum();
		String bizCategory = "법인 구분 없음";
		if (companyNum != null) {
			bizCategory = service.checkBizCategory(companyNum);
		}

		ModelAndView mav = new ModelAndView("board/modify");
		mav.addObject("modifyBoard", board);
		mav.addObject("no", boardNo);
		mav.addObject("bizCategory", bizCategory);
		return mav;
	}

	// 수정 폼 DB에 업데이트 하기.
	@PostMapping("/board/{no}/modify")
	public String modifyUpdate(@Valid BoardVO modifyBoard, BindingResult result, @PathVariable("no") int no,
			HttpServletRequest request) throws Exception {

		MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request;
//		if(result.hasErrors()) {
//			return "redirect:/board/" + no + "/modify";
//		}
		System.out.println("file1: " + mRequest.getParameter("attachfile1"));
		System.out.println("file2: " + mRequest.getParameter("attachfile2"));
		System.out.println("file3: " + mRequest.getParameter("attachfile3"));
		System.out.println("file4: " + mRequest.getParameter("attachfile4"));
		System.out.println("file5: " + mRequest.getParameter("attachfile5"));
//		if(mRequest.getParameter("attachfile1") != null || mRequest.getParameter("attachfile2") != null) {
		fservice.fileUpload(mRequest);
//		}
		service.updateModify(modifyBoard);

		return "redirect:/board/" + no;
	}

//	상세 게시글 조회  /board/3
//	@RequestMapping(value="/board/{no}", method=RequestMethod.GET)
	@GetMapping("/board/{no}")
	public ModelAndView detail(@PathVariable("no") int boardNo) {

		BoardVO board = service.detailBoard(boardNo);

		//법인 번호
		String companyNum = board.getCorporationNum();
		String bizCategory = "법인 구분 없음";
		if(companyNum != null) {
			bizCategory = service.checkBizCategory(companyNum);
		}
		
		// 첨부된 파일 select해와서 모델에 추가해주기.
		List<FileVO> file = fservice.selectFile(boardNo);

		ModelAndView mav = new ModelAndView("board/oneView");
		mav.addObject("board", board);
		mav.addObject("fileList", file);
		mav.addObject("bizCategory", bizCategory);
		return mav;
	}

	// 상담 이력 관리.
	@RequestMapping(value = "/board/{no}/consult", method = RequestMethod.GET)
	public ModelAndView consultForm(@PathVariable("no") int boardNo, HttpSession session) {

		List<BoardVO> consult = service.consultForm(boardNo);
		BoardVO board = service.detailBoard(boardNo);
		MemberVO user = (MemberVO) session.getAttribute("userVO");
		String id = user.getId();

		ModelAndView mav = new ModelAndView("board/consult");
		mav.addObject("consult", consult);
		mav.addObject("boardForConsult", board);
		mav.addObject("no", boardNo);
		mav.addObject("writer", id);

		return mav;
	}

	// 상담내역 DB insert
	@PostMapping("/board/{no}/consult")
	public String write(@PathVariable("no") int no, @Valid BoardVO board, BindingResult result) {

//		if(result.hasErrors()) {
//			//에러발생했다고 알림 넣기
//			return "/board/list";
//		}
		service.insertBoard(board);

		return "redirect:/board/" + no + "/consult";
	}

	// 상담 내역 수정 DB update
	@RequestMapping("/board/{no}/{list_no}/consult/update")
	public String consultUpdate(@PathVariable("list_no")String listNo, @PathVariable("no")String boardNo, BoardVO boardVO, HttpServletRequest request) {
		String input = "modifyInput" + listNo;
		String history = request.getParameter(input);
		boardVO.setList_no(listNo);
		boardVO.setHistory(history);
		
		service.consultUpdate(boardVO);
		/*
		 * Map<String, String> map = new HashMap<String, String>(); map.put("msg",
		 * listNo + "번 고객 정보 수정 완료되었습니다."); return map;
		 */
		return "redirect:/board/" + boardNo  + "/consult";
		
	}

	// 고객 정보 삭제
	@ResponseBody
	@RequestMapping("/board/{no}/delete")
	public Map<String, String> delete(@PathVariable("no") int boardNo) {
		service.deleteCheckBoard(boardNo);
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", boardNo + "번 정보 삭제가 승인 대기 중으로 처리되었습니다.");
		return map;
	}
	

	// 즐겨찾기 N일때 Y 으로 체크하기 위한 put 방식
	@ResponseBody
	@RequestMapping(value = "/myCustomer/changeNtoY/{no}", method = RequestMethod.GET)
	public Map<String, String> starCheckYes(@PathVariable("no") int customerNo) {
		service.changeNtoY(customerNo);
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", customerNo + "고객 즐겨찾기 완료");
		return map;
	}

	// 즐겨찾기 Y일때 N 으로 체크하기 위한 put 방식
	@ResponseBody
	@RequestMapping(value = "/myCustomer/changeYtoN/{no}", method = RequestMethod.GET)
	public Map<String, String> starCheckNo(@PathVariable("no") int customerNo) {
		service.changeYtoN(customerNo);
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", customerNo + "고객 즐겨찾기 취소");
		return map;
	}

}
