package org.ebook.cobook.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		// 로그인이 되어있지 않으면 로그인페이지로 이동
		if(session.getAttribute("member") == null){
			
			System.out.println("로그인 세션 없음");
			
			response.sendRedirect("/");
			return false;
		}
		
		return true;
	}

	
	
}
