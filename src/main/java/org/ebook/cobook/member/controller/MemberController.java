package org.ebook.cobook.member.controller;

import javax.inject.Inject;

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

	
	
	
	
	
}
