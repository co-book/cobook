package org.ebook.cobook.member.controller;


import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.ebook.cobook.member.domain.MemberVO;
import org.ebook.cobook.member.service.MemberService;
import org.ebook.cobook.util.JavaMail;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	@ResponseBody
	public ResponseEntity<Map<String,Object>> login( @RequestBody MemberVO vo, HttpSession session){
		System.out.println("login");
		System.out.println(vo.toString());
		
		ResponseEntity<Map<String,Object>> entity = null;
		Map<String, Object> map = new HashMap<>();
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
						session.setAttribute("member", member);
						result = "SUCCESS";
						msg="로그인 성공";
					}else{
						result = "FAIL";
						msg="비밀번호가 틀렸습니다.";
					}
				}else{
					// GOOGLE, FACEBOOK 
					session.setAttribute("member", member);
					result = "SUCCESS";
					msg="로그인 성공";
				}
			}else{
				result = "FAIL";
				msg="회원 가입되지 않은 아이디입니다. 회원가입을 해주세요 ";
			}
			
			map.put("result", result);
			map.put("msg", msg);
			map.put("member", vo);
			entity = new ResponseEntity<>(map, HttpStatus.OK);
		}catch(Exception e){
			msg = e.getMessage();
			map.put("result", "FAIL");
			map.put("msg", msg);
			entity = new ResponseEntity<>(map, HttpStatus.BAD_REQUEST);
			
		}
		System.out.println(result + " : "+msg);

		return entity;
	}
	
	/**
	 * 로그 아웃 
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(HttpSession session){
		session.setAttribute("member", null);
		return "redirect:/";
	}
	
	/**
	 * 회원가입
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/joinMember", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String,Object>> joinMember(@RequestBody MemberVO vo){
		System.out.println("joinMember");
		System.out.println(vo.toString());
		String result = "FAIL";
		ResponseEntity<Map<String,Object>> entity = null;

		Map<String, Object> map = new HashMap<>();
		try{
			vo.setMyPoint(10000);
			service.joinMember(vo);
			result = "SUCCESS";
			map.put("result", result);
			entity = new ResponseEntity<>( map ,HttpStatus.OK);
		}catch(Exception e){
			result = "FAIL";
			e.printStackTrace();
			map.put("result", result);
			map.put("msg", e.getMessage());
			entity = new ResponseEntity<>(map, HttpStatus.BAD_REQUEST);
		}
		System.out.println("fin");
		return entity;
	}
	
	

	/**
	 * 중복체크, 이메일 유효성체크
	 * @param vo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> checkEmail(@RequestBody MemberVO vo) {
		Map<String,Object> map = new HashMap<>();
		ResponseEntity<Map<String,Object>> entity = null;
		String result = "FAIL";
		String msg="";
		String authString="";
		try {
			if(service.checkEmail(vo.getEmail())){
				result = "FAIL";
				msg = "현재 가입된 이메일입니다.";
			}else{
				authString = JavaMail.sendMail(vo.getEmail(), "cobook회원님");
				entity = new ResponseEntity<>(map, HttpStatus.OK);
				result = "SUCCESS";
			}

			map.put("authString",authString);
			map.put("result", result);
			map.put("msg", msg);
			
			entity = new ResponseEntity<>(map, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", result);
			map.put("msg", e.getMessage());
			entity = new ResponseEntity<>(map, HttpStatus.BAD_REQUEST);
		}

		System.out.println("결과값: "+result);
		System.out.println("authString: "+authString);
		System.out.println("msg: "+msg);
		return entity;
	}

	/**
	 * 비밀번호 변경 페이지 
	 * @param email
	 * @param mv
	 * @return
	 */
	@RequestMapping(value="/modifyPasswordPage/{email}", method = RequestMethod.GET)
	public ModelAndView modifyPasswordPage(@PathVariable("email") String email, ModelAndView mv){
		mv.addObject("email", email);
		mv.setViewName("/member/modifyPasswordPage");
		return mv;
	}
	
	/**
	 * 비밀번호 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/modifyMember", method = RequestMethod.POST)
	public String modifyMember(MemberVO vo)throws Exception{
		service.modifyMember(vo);
		return "redirect:/";
	}
	
	
}
