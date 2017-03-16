package org.ebook.cobook.member.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.ebook.cobook.member.domain.MemberVO;
import org.ebook.cobook.member.service.MemberService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/member/*")
public class MemberController {

	@Inject
	private MemberService service;

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinMember(MemberVO vo) throws Exception {

		service.joinMember(vo);

		return "redirect:/";
	}

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

	@ResponseBody
	@RequestMapping(value="/loginPOST", method = RequestMethod.POST)
	public ResponseEntity<String> loginPOST(@RequestBody MemberVO vo, HttpSession session){
		
		ResponseEntity<String> entity = null;
		String result = "FAIL";
		System.out.println(vo.toString());
		try{
			
			String password = vo.getPassword();
			MemberVO member = service.getMember(vo);
			if(member != null){
				
				if(member.getPassword().equals(password)){
					session.setAttribute("login", member);
					result = "SUCCESS";
				}
			}
			
			entity = new ResponseEntity<>(result, HttpStatus.OK);
		}catch(Exception e){
			
			entity = new ResponseEntity<>("FAIL", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	
	
}
