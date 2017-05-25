package org.ebook.cobook.ebook.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ebook.cobook.board.controller.ReviewController;
import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.ReviewVO;
import org.ebook.cobook.ebook.domain.BookmarkVO;
import org.ebook.cobook.ebook.domain.BorrowVO;
import org.ebook.cobook.ebook.domain.EbookVO;
import org.ebook.cobook.ebook.domain.WishListVO;
import org.ebook.cobook.ebook.service.EbookService;
import org.ebook.cobook.member.domain.MemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.sun.media.sound.ModelAbstractChannelMixer;

import sun.print.resources.serviceui;

@Controller
@RequestMapping(value="/ebook/*")
public class EbookController {

	@Inject
	private EbookService ebookService;
	
	private static final Logger logger = 
			LoggerFactory.getLogger(EbookController.class);
	
	
	/*
	@RequestMapping(value= "/getEbookDetail", method = RequestMethod.GET)
	public void ebookDetail(Model model) throws Exception{
		logger.info("Ebook Detail 호출");
		//Set pathSet = request.getSession().getServletContext().getResourcePaths("/");
		//System.out.println(pathSet);	
	
		List<EbookVO> list = ebookService.getEbookList(model);
		model.addAttribute("list", list);
		logger.info("Ebook Detail : ");
	}*/
	
	
	
	//ebook 상세페이지
	/*@RequestMapping(value= "/getEbookDetail", method = RequestMethod.GET)
	public void getEbookDetail(@RequestParam("ebook_no") int ebook_no, Model model) throws Exception{
		logger.info("getEbookDetail 호출");
		EbookVO evo = ebookService.eBookDetail(ebook_no);
		model.addAttribute(evo);
	}*/
	
	/**
	 * 북마크 리스트 불러오기 
	 * @param model
	 * @throws Exception
	 */
	//따로 이동해시켜줄 뷰가 없을때 responseBody를 씁니다;-!
	@RequestMapping(value= "/getBookMarkList", method = RequestMethod.GET)
	@ResponseBody
	public List<BookmarkVO> getBookMarkList(Model model , BorrowVO borrowVO ) throws Exception{
		logger.info("getBookMarkList 호출");
		List<BookmarkVO> list = ebookService.getBookmarkList(borrowVO);
		return list;
	}
	 
	/**
	 * 북마크 추가
	 * @param model
	 * @throws Exception
	 */
	//추가 ? ebook_no, member_no , cfi 모두 같은 경우 에러처리? 
	@RequestMapping(value= "/writeBookMark", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> writeBookMark(Model model , BookmarkVO bookmark) throws Exception{
		logger.info("writeBookMark 호출");
		Map<String, Object> resultMap = new HashMap<>();
		boolean result = false;
		String resultMsg = "";
		try{
			ebookService.writeBookMark(bookmark);
			result = true;
		} catch (Exception e) {
			 result = false;
			 resultMsg=e.getMessage();
			 e.printStackTrace();
		}
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		return resultMap;
	}
	
	/**
	 * 북마크 지우기
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value= "/deleteBookmark", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> deleteBookmark(Model model , BookmarkVO bookmark) throws Exception{
		logger.info("deleteBookmark 호출");
		Map<String, Object> resultMap = new HashMap<>();
		boolean result = false;
		String resultMsg = "";

		try{
			ebookService.deleteBookmark(bookmark);
			result = true;
		} catch (Exception e) {
			 result = false;
			 resultMsg=e.getMessage();
			 e.printStackTrace();
		}
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		return resultMap;
	}
	

	@RequestMapping(value= "/setLastPage", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> setLastPage(Model model , BorrowVO borrowVO) throws Exception{
		logger.info("setLastPage 호출");
		Map<String, Object> resultMap = new HashMap<>();
		boolean result = false;
		String resultMsg = "";
		
		try{
			ebookService.setLastPage(borrowVO);
			result = true;
			System.out.println(result);
		} catch (Exception e) {
			 result = false;
			 resultMsg=e.getMessage();
			 e.printStackTrace();
		}
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		return resultMap;
	}
	
	 @RequestMapping(value="/getMyborrowList", method = RequestMethod.GET)
	  public String getMybookList(@ModelAttribute("cri")Criteria cri, Model model)throws Exception{
		  // [세션]
		  Map<String, Object> paramMap = new HashMap<>();
		  paramMap.put("cri", cri);
		  paramMap.put("member_no", 2);
		  
		  model.addAttribute("mybookList", ebookService.getMyborrowList(paramMap));
		  
		  return "";
	  }

	 //
	@RequestMapping(value = "/single/{ebook_no}", method = RequestMethod.GET)
	public String getEbookSingle(@PathVariable int ebook_no,  Model model, HttpSession session) {
		logger.info("single"+ebook_no);
		EbookVO vo=null;
		MemberVO mvo=null;
		int member_no =0;
		try {
			mvo= (MemberVO) session.getAttribute("member");
			if(mvo!=null)
			{
				//로그인된 상태
				member_no = mvo.getMember_no();
			}
			//서비스실행
			vo= ebookService.eBookDetail(ebook_no,member_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//model.addAttribute("mvo", mvo);
		model.addAttribute("evo", vo);
		return "ebook/single";
	}
	@RequestMapping(value = "/readEBook", method = RequestMethod.GET)
	public String readEBook( Model model) {
		logger.info("readEBook");
		return "test/viewer";
	}
	

	//메인페이지 광고 + 추천도서 (코북에서 선정한 책 5권)
	@RequestMapping(value = "/banner", method = RequestMethod.GET)
	public String banner(Locale locale, Model model) {
		logger.info("index/banner");
		return "index/banner";

	}

	//월간 베스트 도서 - 한달동안 대여가 많이된책 Top 10

	@RequestMapping(value = "/cobookList", method = RequestMethod.GET)
	public String getMonthlyList(Locale locale, Model model) {
		logger.info("index/cobookList");
		
		try {
			model.addAttribute("monthlyList", ebookService.getMonthlyList());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "index/cobookList";

	}

	//코북 화제의 도서 - 별점순, 인기순(리뷰많은것), 완독순, 최신순 , 파라미터를 다르게 적용해서.? 
	//mapper sql문만 다르게 해서 model에 같이 add해주면 안되나? 뷰에서 바로 꽂아주면...비효율 적인건가..?
	@RequestMapping(value = "/topicList", method = RequestMethod.GET)
	public String getEbookAllList(Locale locale, Model model) 
	{
		logger.info("index/topicList");
		
		try {
			model.addAttribute("starAvgList", ebookService.getEbookAllList());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "index/topicList";

	}

	//알라딘리스트 지금 뜨는거 아니예요? 잘?
	@RequestMapping(value = "/alladinList", method = RequestMethod.GET)
	public String alladinList(Locale locale, Model model) {
		logger.info("index/alladinList");
		return "index/alladinList";
	}

	


	@RequestMapping(value = "/genres/{category}", method = RequestMethod.GET)
	public ModelAndView genres(@PathVariable String category) {	  
	  ModelAndView mav = new ModelAndView("/ebook/genres");
	  logger.info("/genres/"+category);
	  mav.addObject("category", category);
	  return mav;
	}
	@RequestMapping(value = "/genres", method = RequestMethod.GET)
	public ModelAndView genresM() {	  
	  ModelAndView mav = new ModelAndView("/ebook/genres");
	  logger.info("/genres/genres");
	  mav.addObject("category","genres");
	  return mav;
	}
	
	//@RequestParam("category")
	@RequestMapping(value= "/getEbookList", method = RequestMethod.POST)
	public ModelAndView getEbookList(@RequestParam("category") String category) throws Exception{
		logger.info("EBook List 호출  - category : "+category);
		ModelAndView mav = new ModelAndView("/ebook/genres/getEbookList");	
		
		List<EbookVO> ebookList =ebookService.getEbookList(category);
		mav.addObject("ebookListCnt",  ebookList.size());
		mav.addObject("ebookList", ebookList );
		
		return mav;
	}
	
	//borrow 날짜를 가져가야 하는건가
	@RequestMapping(value="/borrowEbook", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> borrowEbook(@RequestBody BorrowVO borrow)
	{
		logger.info("ebook_no : "+borrow.getEbook_no());
		logger.info("member_no : "+borrow.getMember_no());
		logger.info("price : "+borrow.getPrice());
		logger.info("period : "+borrow.getPeriod());
		
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> map = new HashMap<>();
 
		String result = "Fail";
		String msg = "ok";
		try
		{	
			ebookService.borrowEbook(borrow);
			
			result = "SUCCESS";
			map.put("result", result);
			map.put("msg", msg);
			map.put("borrow", borrow);
			entity = new ResponseEntity<>(map, HttpStatus.OK);
		}catch (Exception e) {
			msg = e.getMessage();
			map.put("result", "Fail");
			map.put("msg", msg);
			entity = new ResponseEntity<>(map, HttpStatus.BAD_REQUEST);
		}
		
		System.out.println(result+ " : "+msg);
		return entity;
	}
	
	@RequestMapping(value="/addWishList", method = RequestMethod.GET)
	public ResponseEntity<String> addWishList(WishListVO wvo)
	{
		ResponseEntity<String> entity = null;
		String result="";
		try {
			result = ebookService.addWishList(wvo);
			entity = new ResponseEntity<>(result, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(result, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	//ebook - Single 페이지의 이책을 대여한사람들의 선택 
	@RequestMapping(value= "/getOtherList", method = RequestMethod.POST)
	public ModelAndView getOtherList(@RequestBody EbookVO vo) throws Exception{
		logger.info("getOtherList 호출  - getOtherList : "+vo.getEbook_no());
		ModelAndView mav = new ModelAndView("/ebook/getOtherList");	
		
		List<EbookVO> otherList =ebookService.getOtherList(vo);
		mav.addObject("otherList", otherList );
		
		return mav;
	}
	
}
