package org.ebook.cobook.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/login/*")
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);


	@RequestMapping(value = "/APIExamNaverLogin")
	public void examLogin() {

	}

	@RequestMapping(value = "/callback")
	public void callback() {

	}

	@RequestMapping(value = "/kakao")
	public void kakao() {

	}

	@RequestMapping(value = "/facebook")
	public void facebook(HttpServletRequest req) {

		cookieLog(req);
	}

	@RequestMapping(value = "/facebook2")
	public void facebook2() {

	}

	@RequestMapping(value = "/google")
	public void google(HttpServletRequest req) {

		cookieLog(req);

	}

	@RequestMapping(value = "/google2")
	public void google2() {

	}

	@ResponseBody
	@RequestMapping(value = "/register", produces = "text/plain;charset=UTF-8")
	public String register(@RequestBody String age) throws Exception {

		System.out.println(age);

		return "success";
	}

	@RequestMapping(value="/firebase", method = RequestMethod.GET)
	public void firebase(){
		
	}
	
	@RequestMapping(value="/total", method = RequestMethod.GET)
	public void total(){
		
	}
	
	
	
	public void cookieLog(HttpServletRequest req) {

		System.out.println("--------쿠키 확인---------------");
		Cookie[] cookie = req.getCookies();
		if (cookie != null) {
			logger.debug("쿠키갯수 : " + cookie.length);
			for (Cookie c : cookie) {
				logger.debug("쿠키 이름 : " + c.getName());
				logger.debug("쿠키 값: " + c.getValue());
				logger.debug("쿠키 경로 : " + c.getPath());
				
			}
		}
	}

}
