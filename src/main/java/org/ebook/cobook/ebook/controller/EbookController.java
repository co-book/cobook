package org.ebook.cobook.ebook.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;

import org.ebook.cobook.board.controller.ReviewController;
import org.ebook.cobook.board.domain.ReviewVO;
import org.ebook.cobook.ebook.domain.BookmarkVO;
import org.ebook.cobook.ebook.domain.BorrowVo;
import org.ebook.cobook.ebook.domain.EbookVO;
import org.ebook.cobook.ebook.service.EbookService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.media.sound.ModelAbstractChannelMixer;

import sun.print.resources.serviceui;

@Controller
@RequestMapping(value="/ebook/*")
public class EbookController {

	@Inject
	private EbookService ebookService;
	
	private static final Logger logger = 
			LoggerFactory.getLogger(EbookController.class);
	
	@RequestMapping(value= "/getEbookList", method = RequestMethod.POST)
	public ResponseEntity<List<EbookVO>> getEbookList(Model model) throws Exception{
		logger.info("EBook List 호출");
		//Set pathSet = request.getSession().getServletContext().getResourcePaths("/");
		//System.out.println(pathSet);	
	
		List<EbookVO> list = ebookService.getEbookList(model);
		model.addAttribute("list", list);
		
		logger.info("Ebook List : "+list.toString());
		
	    //HashMap<String, Object> hashmap = new HashMap<String, Object>();
	    // hashmap.put("EbookList", list);
	    
		ResponseEntity<List<EbookVO>> entity = null;
		try{
			entity=new ResponseEntity<>(list, HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;

	}
	
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
	@RequestMapping(value= "/getEbookDetail", method = RequestMethod.GET)
	public void getEbookDetail(@RequestParam("ebook_no") int ebook_no, Model model) throws Exception{
		logger.info("getEbookDetail 호출");
		EbookVO evo = ebookService.eBookDetail(ebook_no);
		model.addAttribute(evo);
	}
	
	/**
	 * 북마크 리스트 불러오기 
	 * @param model
	 * @throws Exception
	 */
	//따로 이동해시켜줄 뷰가 없을때 responseBody를 씁니다;-!
	@RequestMapping(value= "/getBookMarkList", method = RequestMethod.GET)
	public @ResponseBody List<BookmarkVO> getBookMarkList(Model model , BorrowVo borrowVo ) throws Exception{
		logger.info("getBookMarkList 호출");
		//List<BookmarkVo> list = ebookService.getBookMarkList();
		return null;
	}
	 
	/**
	 * 북마크 추가
	 * @param model
	 * @throws Exception
	 */
	//추가 ? ebook_no, member_no , cfi 모두 같은 경우 에러처리? 
	@RequestMapping(value= "/setBookMark", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> setBookMark(Model model , BookmarkVO bookmark) throws Exception{
		logger.info("setBookMark 호출");
		Map<String, Object> resultMap = new HashMap<>();
		boolean result = false;
		String resultMsg = "";
		try{
			ebookService.setBookMark(bookmark);
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
	@RequestMapping(value= "/removeBookmark", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> removeBookmark(Model model , BookmarkVO bookmark) throws Exception{
		logger.info("removeBookmark 호출");
		Map<String, Object> resultMap = new HashMap<>();
		boolean result = false;
		String resultMsg = "";

		try{
			ebookService.removeBookmark(bookmark);
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
	

	@RequestMapping(value= "/updateLastPage", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> updateLastPage(Model model , BorrowVo borrowVo) throws Exception{
		logger.info("updateLastPage 호출");
		Map<String, Object> resultMap = new HashMap<>();
		boolean result = false;
		String resultMsg = "";
		
		try{
			ebookService.updateLastPage(borrowVo);
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
}
