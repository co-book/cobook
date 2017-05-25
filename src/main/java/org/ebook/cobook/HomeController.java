package org.ebook.cobook;


import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.PageMaker;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index( Model model) {	
		logger.info("Welcome home! ");
		return "index";
	}
	@RequestMapping(value="/index", method = RequestMethod.GET)
	public String index(){
		logger.info("Welcome home! ");
		return "index";	
	}
	@RequestMapping(value="/ajaxTest", method = RequestMethod.GET)
	public void ajaxTest(){
		
	}
	
	@RequestMapping(value="/editorCopy", method = RequestMethod.GET)
	public void editorCopy(){
		
	}
	


	
	@RequestMapping(value="/hello", method = RequestMethod.GET)
	public void hello(String name, Model model)throws Exception{
		System.out.println("메서드 실행확인 name: " + name);
		logger.debug(name);
		model.addAttribute("greeting", name);
	}
	
	@RequestMapping(value="/hello", method = RequestMethod.POST)
	public String helloPOST()throws Exception{
		
		return "redirect:/editorCopy";
	}
	
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String review() throws Exception {
		return "redirect:/review/";
	}

			//****************************mybook

			/**

			 * MyBook

			 * @param locale

			 * @param model

			 * @return

			 */

		

		

			

			

			//리뷰 리스트 최신순, 인기순  
/*
			@RequestMapping(value = "/review/reviewList", method = RequestMethod.GET)

			public String reviewList( Model model) {

				logger.info("reviewList");

				return "review/reviewList";

			}

			//최신 리뷰 - 최신에 쓰여진 리뷰(책이름 , 리뷰 제목 )

			@RequestMapping(value = "/review/lastedReviewList", method = RequestMethod.GET)

			public String lastedReviewList( Model model) {

				logger.info("lastedReviewList");

				return "review/lastedReviewList";

			}

			//베스트 댓글 (좋아요 많은순,클릭시 해당 리뷰 게시판으로 이동) 

			@RequestMapping(value = "/review/bestReply", method = RequestMethod.GET)

			public String bestReply(Model model) {

				logger.info("bestReply");

				return "review/bestReply";

			}*/

			

			

			//****************************Review Single 

			/**

			 * 

			 * @param model

			 * @return

			 */

			/*@RequestMapping(value = "/review/single", method = RequestMethod.GET)

			public String single( Model model) {

				logger.info("/review/single");

				return "/review/single";

			}*/
	
			
	
}
