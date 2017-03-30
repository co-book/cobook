package org.ebook.cobook;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value="/ajaxTest", method = RequestMethod.GET)
	public void ajaxTest(){
		
	}
	
	@RequestMapping(value="/editorCopy", method = RequestMethod.GET)
	public void editorCopy(){
		
	}
	
	@RequestMapping(value="/ebookList", method = RequestMethod.GET)
	public String ebooklist(){
		logger.info("Welcome home! ");
		return "ebooklist";	
	}
	
	@RequestMapping(value="/index", method = RequestMethod.GET)
	public String index(){
		logger.info("Welcome home! ");
		return "index";	
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
	
	//메인페이지 광고 + 추천도서 (코북에서 선정한 책 5권)

			@RequestMapping(value = "/index/banner", method = RequestMethod.GET)

			public String banner(Locale locale, Model model) {

				logger.info("index/banner");

				return "index/banner";

			}

			//월간 베스트 도서 - 한달동안 대여가 많이된책 Top 10

			@RequestMapping(value = "/index/cobookList", method = RequestMethod.GET)

			public String cobookList(Locale locale, Model model) {

				logger.info("index/cobookList");

				return "index/cobookList";

			}

			//코북 화제의 도서 - 별점순, 인기순(리뷰많은것), 완독순, 최신순 

			@RequestMapping(value = "/index/monthlyList", method = RequestMethod.GET)

			public String monthlyList(Locale locale, Model model) {

				logger.info("index/monthlyList");

				return "index/monthlyList";

			}

			//알라딘리스트

			@RequestMapping(value = "/index/alladinList", method = RequestMethod.GET)

			public String alladinList(Locale locale, Model model) {

				logger.info("index/alladinList");

				return "index/alladinList";

			}

			

			//****************************mybook

			/**

			 * MyBook

			 * @param locale

			 * @param model

			 * @return

			 */

			/*@RequestMapping(value = "/mybook", method = RequestMethod.GET)

			public String mybook(Locale locale, Model model) {

				logger.info("mybook");

				return "mybook";

			}*/

			//Mybook리스트 - 

			/*@RequestMapping(value = "/mybook/mybookList", method = RequestMethod.GET)

			public String mybookList(Locale locale, Model model) {

				logger.info("mybookList");

				return "mybook/mybookList";

			}*/

			

			//****************************Review

			/**

			 * Review

			 * @param locale

			 * @param model

			 * @return

			 */

			@RequestMapping(value = "/review", method = RequestMethod.GET)

			public String review(Locale locale, Model model) {

				logger.info("review");

				return "review";

			}

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
