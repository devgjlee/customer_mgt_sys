package kr.co.mlec.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.mlec.member.service.MemberService;
import kr.co.mlec.member.vo.MemberVO;

//@Controller
public class LoginController2 {
	
	@Autowired
	private MemberService service;

	@GetMapping("/login")
	public String loginForm() {
		
		return "member/login";
	}
	
	@PostMapping("/login")
	public String login(MemberVO member, HttpSession session) {
		
		MemberVO userVO = service.login(member);
		
		if(userVO == null) {
			// 로그인 실패
			return "member/login";
		}
		
		// 로그인 성공
		
		// 세션에 등록
		session.setAttribute("userVO", userVO);		
		
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
		
	}
}

















