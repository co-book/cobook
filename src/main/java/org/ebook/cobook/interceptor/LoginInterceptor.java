package org.ebook.cobook.interceptor;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ebook.cobook.member.domain.MemberVO;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	/**
	 * 로그인 여부 확인하기
	 * by.journey
	 * preHandle() - controller 전
	 * postHandle() -  controller에서 나온 후 view로 보내기 전
	 * afterCompletion() - view까지 끝내고 나서
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception 
	{
		/*MemberVO mvo = (MemberVO) request.getAttribute("member");
		int member_no = 0;*/
		
		if(request.getSession().getAttribute("member") == null){
			System.out.println("로그인 세션 없음");
			response.sendRedirect("/");
			return false;
		}
		
		return true;
	}
 
	/*@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}	*/
	
	
}
