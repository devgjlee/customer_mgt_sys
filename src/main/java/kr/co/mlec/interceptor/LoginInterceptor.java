package kr.co.mlec.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.mlec.member.vo.MemberVO;

//@Service
public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler)
			throws Exception {
		
		/*
		HandlerMethod method = (HandlerMethod)handler;
		
		System.out.println("Controller : " + method.getBean());
		System.out.println("method : " + method);
		*/

		HttpSession session = request.getSession();
		MemberVO userVO = (MemberVO)session.getAttribute("userVO");
		
		if(userVO == null) {
			
			response.sendRedirect(request.getContextPath() + "/login");
			
			return false;
		} 		
		return true;
	}

	
}














