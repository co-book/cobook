package org.ebook.cobook.member.controller;


import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.ebook.cobook.member.domain.MemberVO;
import org.ebook.cobook.member.service.MemberService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/member/*")
public class MemberController {

	@Inject
	private MemberService service;
	
	/**
	 * 로그인  
	 * loginType - facebook, google, cobook으로 구분
	 * @param vo
	 * @param session
	 * @return
	 */
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public ResponseEntity<String> login( @RequestBody MemberVO vo, HttpSession session){
		System.out.println("login!!!!!!!111");

		System.out.println(vo.toString());
		System.out.println(vo.getEmail());
		System.out.println(vo.getPassword());
		System.out.println(vo.getLoginType());
		
		ResponseEntity<String> entity = null;
		String result = "FAIL";
		String msg="OK";
		
		try{
			MemberVO member = service.getMember(vo);
			//회원가입여부 체크 
			if(member != null){
				//로그인 여부 체크 
				if(vo.getLoginType().equals("COBOOKLOGIN")){
					// COBOOK 회원 가입시 - 비밀번호 체크
					if(member.getPassword().equals(vo.getPassword())){
						session.setAttribute("member", vo);
						result = "SUCCESS";
					}
				}else{
					// GOOGLE, FACEBOOK 
					session.setAttribute("member", vo);
					result = "SUCCESS";
				}
			}else{
				result = "FAIL";
				msg="회원 가입되지 않은 아이디입니다. 회원가입을 해주세요 ";
			}
			entity = new ResponseEntity<>(result, HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<>("FAIL", HttpStatus.BAD_REQUEST);
			msg = e.getMessage();
		}
		//session.setAttribute("msg", msg);
		System.out.println(msg);
		return entity;
	}
	
	/**
	 * 회원가입
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/joinMember", method = RequestMethod.POST)
	public String joinMember(MemberVO vo) throws Exception {
		service.joinMember(vo);
		return "redirect:/";
	}

	/**
	 * 중복체크?
	 * @param vo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/checkEmail", method = RequestMethod.POST)
	public ResponseEntity<String> checkEmail(@RequestBody MemberVO vo) {

		ResponseEntity<String> entity = null;
		String result = "FAIL";
		try {

			if(service.checkEmail(vo.getEmail()))result = "SUCCESS";
			System.out.println("결과값: "+result);
			entity = new ResponseEntity<>(result, HttpStatus.OK);
			
		} catch (Exception e) {

			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@ResponseBody
	@RequestMapping(value = "/checkNickname", method = RequestMethod.POST)
	public ResponseEntity<String> checkNickname(@RequestBody MemberVO vo) {

		ResponseEntity<String> entity = null;
		String result = "FAIL";
		try {

			if(service.checkNickName(vo.getNickname()))result = "SUCCESS";
			
			entity = new ResponseEntity<>(result, HttpStatus.OK);
			
		} catch (Exception e) {

			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 이메일 보내는 ajax메서드 회원으로부터 이메일값을 받아서 전송한다
		@ResponseBody
		@RequestMapping(value="/sendEmail", method = RequestMethod.POST)
		public ResponseEntity<String> sendEmailPOST(@RequestBody MemberVO vo){
			
			ResponseEntity<String> entity = null;
			System.out.println(vo.toString());
			try{
				
				String authString = "test";//JavaMail.sendMail(vo.getEmail(), "cobook회원님");
				entity = new ResponseEntity<>(authString, HttpStatus.OK);
				
			}catch(Exception e){
				
				entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			
			return entity;
		}
		
		@RequestMapping(value="/loginPOST", method = RequestMethod.POST)
		public String loginPOST(){
			
			return "redirect:/test/replyTest";
		}
	
	
	
	
}
