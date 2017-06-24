package org.ebook.cobook.member.controller;


import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.plugin.InterceptorChain;
import org.ebook.cobook.ebook.controller.EbookController;
import org.ebook.cobook.ebook.domain.BorrowVO;
import org.ebook.cobook.ebook.domain.EbookVO;
import org.ebook.cobook.member.domain.MemberVO;
import org.ebook.cobook.member.service.MemberService;
import org.ebook.cobook.util.JavaMail;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.SessionScope;
import org.springframework.web.servlet.ModelAndView;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping(value = "/member/*")
public class MemberController {

	@Inject
	private MemberService service;
	
	private static final Logger logger = 
			LoggerFactory.getLogger(EbookController.class);
	
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
	public ResponseEntity<Integer> modifyMember(@RequestBody MemberVO vo, HttpSession session)throws Exception{
		
		System.out.println(vo.getMember_no() + "//" + vo.getNickname());
		ResponseEntity<Integer> entity = null;
		int modifyCnt =service.modifyMember(vo);
		
		if(modifyCnt==0){
			entity = new ResponseEntity<>(modifyCnt,HttpStatus.NO_CONTENT);
		}else if(modifyCnt==1){
			 entity = new ResponseEntity<>(modifyCnt,HttpStatus.OK);
			 session.setAttribute("member", service.getMember((MemberVO)session.getAttribute("member")));
		}
		return entity;
	}
	
	/**
	 * 포인트 정보 가져오기
	 * @param vo
	 * @return
	 */
	
	@RequestMapping(value="/chargePoint", method = RequestMethod.GET)
	public ResponseEntity<MemberVO> chargePoint( HttpSession session)
	{	
		//MemberVO vo = null;
		ResponseEntity<MemberVO> entity = null;
		MemberVO vo= (MemberVO) session.getAttribute("member");
		try {
			vo = service.chargePoint(vo);
			entity =  new ResponseEntity<>(vo, HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity =  new ResponseEntity<>(vo, HttpStatus.BAD_REQUEST);
		}
		session.setAttribute("member", vo); 
		/*
		 * session에 있는 멤버정보를 초기화한다. 그래서 충전할때마다 멤버에 있는 마이포인트를 업뎃해주는것 흥
		 */
		
		return entity;
	}
	/**
	 * 마이페이지 연결
	 * by.journey
	 * @param vo
	 * @return
	 * GET 방식 프로토콜은 Request 패킷에 Body가 존재하지 않는다. 따라서 데이터를 가져올 수 없다
	 */
	/*인터셉터 사용전
	 * @RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public ModelAndView mypage(MemberVO vo, HttpSession session) 
	{	  
	  logger.info("/member/mypage");
	  int member_no = 0;
	  
	  vo = (MemberVO) session.getAttribute("member");
	  if(vo!=null)
	  {
		  member_no = vo.getMember_no();
	  }else {
		  ModelAndView mav = new ModelAndView("/cobook/");
	  }
	  ModelAndView mav = new ModelAndView("/member/mypage");
	  mav.addObject("mypage",vo);
	  mav.addObject("member_no", member_no);
	  return mav;
	}*/
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public ModelAndView mypage(HttpServletRequest request) 
	{	  
	  logger.info("/member/mypage");
	  ModelAndView mav = new ModelAndView("/member/mypage");
	  
	  mav.addObject("mypage",request.getAttribute("member"));
	  return mav;
	}
	/**
	 * 내가 대여한 책 리스트
	 * by.journey
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/mypage/getMyBorrowList", method = RequestMethod.POST)
	public ModelAndView getMybookList(@RequestBody BorrowVO vo)throws Exception
	{	
		System.out.println(vo.getMember_no());
		System.out.println("-------------------------------------------------------");
		ModelAndView mav = new ModelAndView("/member/mypage/getMyBorrowList");
		List<EbookVO> borrowList = service.getMyborrowList(vo);
		mav.addObject("myBorrowList", borrowList);	// borrow 리스트 
		mav.addObject("borrowListCnt", service.getMyBorrowCount(vo));	//리플 전체 갯수
		mav.addObject("moreCnt", vo.getMoreCnt());
		
		  return mav;
	  }
	/**
	 * 마이페이지 정보수정 연결
	 * by.journey
	 * @param vo
	 * @param session
	 * @return
	 * @throws Exception
	 */
	/*@RequestMapping(value="/mypage/memberModify", method = RequestMethod.GET)
	public ModelAndView getMemeberModify(MemberVO vo, HttpSession session) throws Exception
	{	
		int member_no=0;
		ModelAndView mav = new ModelAndView();
		vo = (MemberVO) session.getAttribute("member");
		
		if(vo!=null){
			member_no = vo.getMember_no();
			mav.setViewName("/member/memberModify");
			mav.addObject("modify", vo);
			mav.addObject("member_no", member_no);
		//세션에서 끊겼을때 메인으로 돌아간다
		}else if(session.getAttribute("member")==null){
			mav.setViewName("redirect:/");
		}
		return mav;
	}*/
	@RequestMapping(value="/mypage/memberModify", method = RequestMethod.GET)
	public ModelAndView getMemeberModify(HttpServletRequest request) throws Exception
	{	
		
		ModelAndView mav = new ModelAndView("/member/memberModify");
		mav.addObject("modify", request.getAttribute("member"));
		
		return mav;
	}
	

	
	
	
}
