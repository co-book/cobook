package org.ebook.cobook.interceptor;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ebook.cobook.member.domain.MemberVO;
import org.ebook.cobook.member.persistence.MemberDAO;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{

	@Inject
	private MemberDAO memberDAO;
	
	// 세션검사 수행후 인증검사
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 사용자의 이메일이 존재하는지 검사하고 난후
		// 패스워드가 유효한지 검사한다
		HttpSession session = request.getSession();
		MemberVO userVO = new MemberVO();
		System.out.println("인터셉터: " +request.getParameter("password"));
		System.out.println("이메일: " + request.getParameter("email"));
		String password = request.getParameter("password");
		userVO.setEmail(request.getParameter("email"));
		
		MemberVO memberVO = memberDAO.getMember(userVO);
		// 유효한 이메일 일경우
		if(memberVO != null){
			System.out.println("체크1");
			// 비밀번호가 같을 경우
			if(memberVO.getPassword().equals(password)){
				System.out.println("체크2");
				session.setAttribute("login", memberVO);
				return true;
			}
		}
		System.out.println("체크3");
//		response.sendRedirect("/");
		PrintWriter out = response.getWriter();
		out.println("FAIL");
		return false;
	}

}
